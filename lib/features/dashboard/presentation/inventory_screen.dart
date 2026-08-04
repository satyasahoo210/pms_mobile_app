import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/core/theme/app_theme.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';
import 'package:pms_admin/features/calendar/presentation/calendar_controller.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late DateTime _startDate;
  late DateTime _endDate;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    final now = DateTime.now();
    _startDate = DateTime(now.year, now.month, now.day);
    _endDate = _startDate.add(const Duration(days: 13)); // 14 days default
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<DateTime> _generateDates(DateTime start, DateTime end) {
    final List<DateTime> dates = [];
    DateTime current = start;
    // Cap at 31 days to prevent UI overload
    final limit = start.add(const Duration(days: 30));
    final actualEnd = end.isAfter(limit) ? limit : end;

    while (current.isBefore(actualEnd) || current.isAtSameMomentAs(actualEnd)) {
      dates.add(current);
      current = current.add(const Duration(days: 1));
    }
    return dates;
  }

  int _getAvailability(
    String roomTypeId,
    DateTime date,
    List<Query$GetRooms$rooms> rooms,
    List<Query$GetBookings$bookings> bookings,
    Query$GetProperties$properties? property,
  ) {
    final totalRooms = rooms.where((r) => r.RoomType?.id == roomTypeId).length;
    final dateDateOnly = DateTime(date.year, date.month, date.day);
    int occupiedOnDay = 0;

    Map<String, dynamic>? settings;
    if (property?.settings != null) {
      try {
        settings = jsonDecode(property!.settings!) as Map<String, dynamic>;
      } catch (_) {}
    }

    String propCheckOutTime = settings?['checkoutTime'] ?? '07:00:00';
    if (propCheckOutTime.split(':').length == 2) {
      propCheckOutTime = '$propCheckOutTime:00';
    }

    String propCheckInTime = settings?['checkinTime'] ?? '08:00:00';
    if (propCheckInTime.split(':').length == 2) {
      propCheckInTime = '$propCheckInTime:00';
    }

    for (final b in bookings) {
      if (b.status == Enum$BookingStatus.CANCELLED) continue;

      final checkIn = DateTime.parse(b.checkInDate).toLocal();
      final checkOut = DateTime.parse(b.checkOutDate).toLocal();
      final checkInDateOnly = DateTime(
        checkIn.year,
        checkIn.month,
        checkIn.day,
      );
      final checkOutDateOnly = DateTime(
        checkOut.year,
        checkOut.month,
        checkOut.day,
      );

      final checkInTimeStr = DateFormat('HH:mm:ss').format(checkIn);
      final checkOutTimeStr = DateFormat('HH:mm:ss').format(checkOut);

      DateTime startOccupiedDate = checkInDateOnly;
      if (checkInTimeStr.compareTo(propCheckInTime) < 0) {
        startOccupiedDate = checkInDateOnly.subtract(const Duration(days: 1));
      }

      DateTime endOccupiedDate = checkOutDateOnly.subtract(
        const Duration(days: 1),
      );
      if (checkOutTimeStr.compareTo(propCheckOutTime) > 0) {
        endOccupiedDate = checkOutDateOnly;
      }

      final isOccupied =
          (dateDateOnly.isAtSameMomentAs(startOccupiedDate) ||
              dateDateOnly.isAfter(startOccupiedDate)) &&
          (dateDateOnly.isBefore(endOccupiedDate) ||
              dateDateOnly.isAtSameMomentAs(endOccupiedDate));

      if (isOccupied) {
        final roomsOfTypeInBooking =
            b.BookingRoom?.where(
              (br) => br != null && br.roomTypeId == roomTypeId,
            ).length ??
            0;
        occupiedOnDay += roomsOfTypeInBooking;
      }
    }

    final availability = totalRooms - occupiedOnDay;
    return availability < 0 ? 0 : availability;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;
    final calendarDataAsync = ref.watch(calendarDataProvider);
    final selectedProperty = ref.watch(selectedPropertyProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'INVENTORY GRID',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
            if (selectedProperty != null)
              Text(
                selectedProperty.name.toUpperCase(),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: ext.textMuted,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontSize: 11,
          ),
          tabs: const [
            Tab(text: 'AVAILABILITY GRID'),
            Tab(text: 'CATEGORIES'),
          ],
        ),
      ),
      body: calendarDataAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Failed to load data: $err')),
        data: (data) {
          // Extract unique room types from rooms list
          final roomTypesMap = <String, Query$GetRooms$rooms$RoomType>{};
          for (final room in data.rooms) {
            if (room.RoomType != null) {
              roomTypesMap[room.RoomType!.id] = room.RoomType!;
            }
          }
          final roomTypes = roomTypesMap.values.toList();

          return TabBarView(
            controller: _tabController,
            children: [
              _buildAvailabilityGrid(
                ref,
                roomTypes,
                data.rooms,
                data.bookings,
                ext,
                selectedProperty,
              ),
              _buildCategoriesList(roomTypes, data.rooms, ext),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAvailabilityGrid(
    WidgetRef ref,
    List<Query$GetRooms$rooms$RoomType> roomTypes,
    List<Query$GetRooms$rooms> rooms,
    List<Query$GetBookings$bookings> bookings,
    AppColorsExtension ext,
    Query$GetProperties$properties? property,
  ) {
    final theme = Theme.of(context);
    final dates = _generateDates(_startDate, _endDate);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Date Range Picker Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusDefault),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: _startDate,
                          firstDate: DateTime.now().subtract(
                            const Duration(days: 365),
                          ),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                        );
                        if (picked != null) {
                          setState(() {
                            _startDate = picked;
                            if (_endDate.isBefore(_startDate)) {
                              _endDate = _startDate.add(
                                const Duration(days: 13),
                              );
                            }
                          });
                        }
                      },
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'START DATE',
                          border: OutlineInputBorder(),
                        ),
                        child: Text(
                          DateFormat('dd MMM yyyy').format(_startDate),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacingMd),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: _endDate,
                          firstDate: _startDate,
                          lastDate: _startDate.add(const Duration(days: 30)),
                        );
                        if (picked != null) {
                          setState(() {
                            _endDate = picked;
                          });
                        }
                      },
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'END DATE',
                          border: OutlineInputBorder(),
                        ),
                        child: Text(DateFormat('dd MMM yyyy').format(_endDate)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppTheme.spacingMd),

          // Inventory Grid Table Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusDefault),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radiusDefault),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Fixed Column: Room Category
                  Container(
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: ext.borderLight)),
                    ),
                    child: Column(
                      children: [
                        // Left Header
                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest
                                .withValues(alpha: 0.3),
                            border: Border(
                              bottom: BorderSide(color: ext.borderLight),
                            ),
                          ),
                          child: Text(
                            'CATEGORY',
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: ext.textMuted,
                              fontSize: 9,
                            ),
                          ),
                        ),
                        // Left Rows
                        ...roomTypes.map((type) {
                          final count = rooms
                              .where((r) => r.RoomType?.id == type.id)
                              .length;
                          return Container(
                            height: 70,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: ext.borderLight.withValues(alpha: 0.5),
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  type.name,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: ext.textPrimary,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '$count units',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: ext.textMuted,
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                  // Right Scrollable Grid: Dates Availability
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Date Cells
                          Row(
                            children: dates.map((date) {
                              final formattedDay = DateFormat(
                                'EEE',
                              ).format(date);
                              final formattedDate = DateFormat(
                                'dd',
                              ).format(date);
                              final isWeekend =
                                  formattedDay == 'Sat' ||
                                  formattedDay == 'Sun';

                              return Container(
                                width: 65,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: isWeekend
                                      ? theme
                                            .colorScheme
                                            .surfaceContainerHighest
                                            .withValues(alpha: 0.5)
                                      : theme
                                            .colorScheme
                                            .surfaceContainerHighest
                                            .withValues(alpha: 0.2),
                                  border: Border(
                                    right: BorderSide(
                                      color: ext.borderLight.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                    bottom: BorderSide(color: ext.borderLight),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      formattedDay.toUpperCase(),
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: ext.textMuted,
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      formattedDate,
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w900,
                                            color: ext.textPrimary,
                                          ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),

                          // Data Rows
                          ...roomTypes.map((type) {
                            return Row(
                              children: dates.map((date) {
                                final avail = _getAvailability(
                                  type.id,
                                  date,
                                  rooms,
                                  bookings,
                                  property,
                                );

                                // Cell Colors & Styles
                                Color cellBg;
                                Color textClr;
                                Border? border;

                                if (avail <= 0) {
                                  cellBg = const Color(0xFF0F172A); // Slate-900
                                  textClr = Colors.white;
                                } else if (avail <= 2) {
                                  cellBg = const Color(0xFFFEF3C7); // Amber-100
                                  textClr = const Color(
                                    0xFFB45309,
                                  ); // Amber-750
                                  border = Border.all(
                                    color: const Color(0xFFFDE68A),
                                  );
                                } else {
                                  cellBg = Colors.white;
                                  textClr = const Color(
                                    0xFF059669,
                                  ); // Emerald-600
                                  border = Border.all(
                                    color: ext.borderLight.withValues(
                                      alpha: 0.5,
                                    ),
                                  );
                                }

                                return Container(
                                  width: 65,
                                  height: 70,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: ext.borderLight.withValues(
                                          alpha: 0.3,
                                        ),
                                      ),
                                      bottom: BorderSide(
                                        color: ext.borderLight.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 44,
                                    height: 44,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: cellBg,
                                      border: border,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      '$avail',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: textClr,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesList(
    List<Query$GetRooms$rooms$RoomType> roomTypes,
    List<Query$GetRooms$rooms> rooms,
    AppColorsExtension ext,
  ) {
    final theme = Theme.of(context);

    if (roomTypes.isEmpty) {
      return Center(
        child: Text(
          'No categories found.',
          style: theme.textTheme.bodyMedium?.copyWith(color: ext.textMuted),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      itemCount: roomTypes.length,
      itemBuilder: (context, index) {
        final type = roomTypes[index];
        final count = rooms.where((r) => r.RoomType?.id == type.id).length;

        // Extract defaultPrice and handle double/num mapping safely
        final double basePrice = (type.defaultPrice as num?)?.toDouble() ?? 0.0;

        return Card(
          margin: const EdgeInsets.only(bottom: AppTheme.spacingMd),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.spacingLg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.bed,
                        color: theme.colorScheme.primary,
                        size: 24,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'NIGHTLY BASE',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: ext.textMuted,
                            fontWeight: FontWeight.w900,
                            fontSize: 9,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'INR ${basePrice.toStringAsFixed(2)}',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: ext.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingMd),
                Text(
                  type.name.toUpperCase(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: ext.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Premium guest accommodation with full amenities and high-speed Wi-Fi.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: ext.textMuted,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingLg),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '${type.capacity}',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: ext.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'MAX GUESTS',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: ext.textMuted,
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingMd),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '$count',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: ext.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'TOTAL UNITS',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: ext.textMuted,
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
