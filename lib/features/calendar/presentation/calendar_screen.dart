import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/core/theme/app_theme.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';
import 'package:pms_admin/features/calendar/presentation/calendar_controller.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  late final ScrollController _roomsScrollController;
  late final ScrollController _gridVerticalScrollController;
  late final ScrollController _datesScrollController;
  late final ScrollController _gridHorizontalScrollController;

  static const double _roomColumnWidth = 110.0;
  static const double _dateColumnWidth = 75.0;
  static const double _rowHeight = 65.0;
  static const double _headerHeight = 55.0;
  static const int _daysToShow = 30;

  @override
  void initState() {
    super.initState();
    _roomsScrollController = ScrollController();
    _gridVerticalScrollController = ScrollController();
    _datesScrollController = ScrollController();
    _gridHorizontalScrollController = ScrollController();

    _roomsScrollController.addListener(() {
      if (_gridVerticalScrollController.hasClients &&
          _gridVerticalScrollController.offset !=
              _roomsScrollController.offset) {
        _gridVerticalScrollController.jumpTo(_roomsScrollController.offset);
      }
    });

    _gridVerticalScrollController.addListener(() {
      if (_roomsScrollController.hasClients &&
          _roomsScrollController.offset !=
              _gridVerticalScrollController.offset) {
        _roomsScrollController.jumpTo(_gridVerticalScrollController.offset);
      }
    });

    _datesScrollController.addListener(() {
      if (_gridHorizontalScrollController.hasClients &&
          _gridHorizontalScrollController.offset !=
              _datesScrollController.offset) {
        _gridHorizontalScrollController.jumpTo(_datesScrollController.offset);
      }
    });

    _gridHorizontalScrollController.addListener(() {
      if (_datesScrollController.hasClients &&
          _datesScrollController.offset !=
              _gridHorizontalScrollController.offset) {
        _datesScrollController.jumpTo(_gridHorizontalScrollController.offset);
      }
    });
  }

  @override
  void dispose() {
    _roomsScrollController.dispose();
    _gridVerticalScrollController.dispose();
    _datesScrollController.dispose();
    _gridHorizontalScrollController.dispose();
    super.dispose();
  }

  DateTime _dateOnly(DateTime dt) {
    return DateTime(dt.year, dt.month, dt.day);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    final selectedProperty = ref.watch(selectedPropertyProvider);
    final propertiesAsync = ref.watch(propertiesProvider);
    final calendarDataAsync = ref.watch(calendarDataProvider);
    final startDate = ref.watch(calendarStartDateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              ),
              child: const Icon(
                Icons.calendar_month,
                size: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            if (propertiesAsync.isLoading)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else if (propertiesAsync.hasError)
              Text('Error loading', style: theme.textTheme.titleMedium)
            else if (selectedProperty != null)
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedProperty.id,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: theme.colorScheme.primary,
                  ),
                  onChanged: (id) {
                    if (id != null) {
                      final properties = propertiesAsync.value ?? [];
                      ref.read(selectedPropertyProvider.notifier).state =
                          properties.firstWhere((p) => p.id == id);
                    }
                  },
                  items: (propertiesAsync.value ?? []).map((p) {
                    return DropdownMenuItem<String>(
                      value: p.id,
                      child: Text(p.name),
                    );
                  }).toList(),
                ),
              )
            else
              Text('No Property', style: theme.textTheme.titleMedium),
          ],
        ),
        centerTitle: false,
        actions: [
          // Today button
          TextButton.icon(
            icon: const Icon(Icons.today, size: 18),
            label: const Text('Today'),
            onPressed: () {
              final now = DateTime.now();
              ref.read(calendarStartDateProvider.notifier).state = DateTime(
                now.year,
                now.month,
                now.day,
              ).subtract(const Duration(days: 7));
            },
          ),
          // Date Picker
          IconButton(
            icon: const Icon(Icons.date_range_outlined),
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: startDate,
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (picked != null) {
                ref.read(calendarStartDateProvider.notifier).state = picked
                    .subtract(const Duration(days: 2));
              }
            },
          ),
        ],
      ),
      body: selectedProperty == null
          ? const Center(child: Text('Select a property to view tape chart'))
          : calendarDataAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (data) {
                if (data.rooms.isEmpty) {
                  return const Center(
                    child: Text(
                      'No rooms found. Please add rooms in the dashboard/admin panel first.',
                    ),
                  );
                }

                // Generate dates list
                final dates = List.generate(
                  _daysToShow,
                  (i) => startDate.add(Duration(days: i)),
                );

                return LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      decoration: BoxDecoration(
                        color: ext.surfaceContainerLowest,
                        border: Border.all(color: ext.borderLight),
                      ),
                      child: Column(
                        children: [
                          // 1. HEADER ROW (Rooms indicator + sticky dates row)
                          Row(
                            children: [
                              // Sticky Corner Box
                              Container(
                                width: _roomColumnWidth,
                                height: _headerHeight,
                                decoration: BoxDecoration(
                                  color: ext.surfaceContainerLow,
                                  border: Border(
                                    right: BorderSide(color: ext.borderLight),
                                    bottom: BorderSide(color: ext.borderLight),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'ROOMS',
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    color: ext.textMuted,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // Horizontally Scrollable Dates Header
                              Expanded(
                                child: SingleChildScrollView(
                                  controller: _datesScrollController,
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: dates.map((date) {
                                      final isToday =
                                          _dateOnly(date) ==
                                          _dateOnly(DateTime.now());
                                      return Container(
                                        width: _dateColumnWidth,
                                        height: _headerHeight,
                                        decoration: BoxDecoration(
                                          color: isToday
                                              ? theme
                                                    .colorScheme
                                                    .primaryContainer
                                                    .withValues(alpha: 0.2)
                                              : ext.surfaceContainerLow,
                                          border: Border(
                                            right: BorderSide(
                                              color: ext.borderLight,
                                            ),
                                            bottom: BorderSide(
                                              color: ext.borderLight,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              DateFormat(
                                                'EEE',
                                              ).format(date).toUpperCase(),
                                              style: theme.textTheme.labelLarge
                                                  ?.copyWith(
                                                    color: isToday
                                                        ? theme
                                                              .colorScheme
                                                              .primary
                                                        : ext.textMuted,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              DateFormat('d MMM').format(date),
                                              style: theme.textTheme.bodySmall
                                                  ?.copyWith(
                                                    color: isToday
                                                        ? theme
                                                              .colorScheme
                                                              .primary
                                                        : ext.textPrimary,
                                                    fontWeight: isToday
                                                        ? FontWeight.bold
                                                        : FontWeight.normal,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // 2. MAIN GRID AREA (Sticky Rooms Column + Bi-scrollable Grid)
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Sticky Rooms Column
                                Container(
                                  width: _roomColumnWidth,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: ext.borderLight),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    controller: _roomsScrollController,
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: data.rooms.map((room) {
                                        return Container(
                                          width: _roomColumnWidth,
                                          height: _rowHeight,
                                          decoration: BoxDecoration(
                                            color: ext.surfaceContainerLowest,
                                            border: Border(
                                              bottom: BorderSide(
                                                color: ext.borderLight,
                                              ),
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 6,
                                          ),
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Room ${room.roomNumber}',
                                                style: theme
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ext.textPrimary,
                                                    ),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                room.RoomType?.name ??
                                                    'Standard',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme.textTheme.bodySmall
                                                    ?.copyWith(
                                                      fontSize: 10,
                                                      color: ext.textMuted,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                // Bi-scrollable Grid (Vertical + Horizontal Scroll)
                                Expanded(
                                  child: SingleChildScrollView(
                                    controller: _gridVerticalScrollController,
                                    scrollDirection: Axis.vertical,
                                    child: SingleChildScrollView(
                                      controller:
                                          _gridHorizontalScrollController,
                                      scrollDirection: Axis.horizontal,
                                      child: Stack(
                                        children: [
                                          // Background Grid Lines
                                          Column(
                                            children: data.rooms.map((room) {
                                              return Row(
                                                children: List.generate(
                                                  _daysToShow,
                                                  (i) {
                                                    final date = dates[i];
                                                    final isToday =
                                                        _dateOnly(date) ==
                                                        _dateOnly(
                                                          DateTime.now(),
                                                        );
                                                    return Container(
                                                      width: _dateColumnWidth,
                                                      height: _rowHeight,
                                                      decoration: BoxDecoration(
                                                        color: isToday
                                                            ? theme
                                                                  .colorScheme
                                                                  .primaryContainer
                                                                  .withValues(
                                                                    alpha: 0.05,
                                                                  )
                                                            : ext.surfaceContainerLowest,
                                                        border: Border(
                                                          right: BorderSide(
                                                            color:
                                                                ext.borderLight,
                                                          ),
                                                          bottom: BorderSide(
                                                            color:
                                                                ext.borderLight,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                          // Overlay Booking Blocks
                                          ..._buildBookingBlocks(
                                            context,
                                            data.rooms,
                                            data.bookings,
                                            startDate,
                                            dates,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  List<Widget> _buildBookingBlocks(
    BuildContext context,
    List<Query$GetRooms$rooms> rooms,
    List<Query$GetBookings$bookings> bookings,
    DateTime viewStart,
    List<DateTime> visibleDates,
  ) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;
    final List<Widget> blocks = [];

    // Map room ID to row index for quick lookup
    final Map<String, int> roomIndexMap = {};
    for (int i = 0; i < rooms.length; i++) {
      roomIndexMap[rooms[i].id] = i;
    }

    final viewEnd = visibleDates.last.add(
      const Duration(days: 1),
    ); // inclusive end date boundary

    for (final booking in bookings) {
      if (booking.status == Enum$BookingStatus.CANCELLED) {
        continue; // Skip cancelled bookings on tape chart
      }

      final checkIn = DateTime.parse(booking.checkInDate);
      final checkOut = DateTime.parse(booking.checkOutDate);

      // Check if booking overlaps with our 30-day window
      if (checkOut.isBefore(viewStart) || checkIn.isAfter(viewEnd)) {
        continue;
      }

      // Render block for each room assigned in this booking
      final bookingRooms = booking.BookingRoom ?? [];
      for (final br in bookingRooms) {
        if (br == null || br.Room == null) continue;

        final roomId = br.Room!.id;
        final rowIndex = roomIndexMap[roomId];
        if (rowIndex == null) continue; // Room not in active view

        // Calculate overlap boundaries
        final spanStart = checkIn.isBefore(viewStart) ? viewStart : checkIn;
        final spanEnd = checkOut.isAfter(viewEnd) ? viewEnd : checkOut;

        final startOffsetDays = _dateOnly(
          spanStart,
        ).difference(_dateOnly(viewStart)).inDays;
        final durationDays = _dateOnly(
          spanEnd,
        ).difference(_dateOnly(spanStart)).inDays;

        if (durationDays <= 0) continue;

        // Position calculations
        final left = startOffsetDays * _dateColumnWidth;
        final width = durationDays * _dateColumnWidth;
        final top = rowIndex * _rowHeight;

        // Determine coloring based on status
        Color statusColor = theme.colorScheme.primary;
        String statusText = 'CONFIRMED';

        switch (booking.status) {
          case Enum$BookingStatus.CONFIRMED:
            statusColor = theme.colorScheme.primary;
            statusText = 'CONFIRMED';
            break;
          case Enum$BookingStatus.CHECKED_IN:
            statusColor = ext.statusClean;
            statusText = 'CHECKED IN';
            break;
          case Enum$BookingStatus.CHECKED_OUT:
            statusColor = ext.textMuted;
            statusText = 'CHECKED OUT';
            break;
          case Enum$BookingStatus.NO_SHOW:
            statusColor = ext.statusInspect;
            statusText = 'NO SHOW';
            break;
          default:
            break;
        }

        blocks.add(
          Positioned(
            left: left + 2, // Slight padding to separate blocks
            top: top + 8, // Vertical padding inside the row
            width: width - 4,
            height: _rowHeight - 16,
            child: GestureDetector(
              onTap: () => _showBookingDetails(
                context,
                booking,
                statusColor,
                statusText,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.15),
                  border: Border.all(color: statusColor, width: 1.5),
                  borderRadius: BorderRadius.circular(AppTheme.radiusDefault),
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: [
                    // Solid indicator line on left
                    Container(width: 4, color: statusColor),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            booking.Guest?.name ?? 'Guest',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ext.textPrimary,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            '${DateFormat('d').format(checkIn)}-${DateFormat('d MMM').format(checkOut)}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: ext.textMuted,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }

    return blocks;
  }

  void _showBookingDetails(
    BuildContext context,
    Query$GetBookings$bookings booking,
    Color statusColor,
    String statusText,
  ) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    final checkIn = DateTime.parse(booking.checkInDate);
    final checkOut = DateTime.parse(booking.checkOutDate);
    final totalAmount = booking.totalAmount ?? 0.0;

    // Calculate total paid
    final payments = booking.Payment ?? [];
    final totalPaid = payments
        .where((p) => p != null && p.status == Enum$PaymentStatus.PAID)
        .fold<double>(0.0, (sum, p) => sum + (p?.amount ?? 0.0));

    final isPaid = totalPaid >= totalAmount;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Booking Overview',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                  border: Border.all(color: statusColor, width: 0.5),
                ),
                child: Text(
                  statusText,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: statusColor,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Guest Info
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: Icon(
                        Icons.person,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          booking.Guest?.name ?? 'Guest',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (booking.Guest?.phone != null)
                          Text(
                            booking.Guest!.phone!,
                            style: theme.textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ],
                ),
                const Divider(height: 24),
                // Dates
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CHECK IN',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: ext.textMuted,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            DateFormat('dd MMM yyyy').format(checkIn),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_rounded, size: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'CHECK OUT',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: ext.textMuted,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            DateFormat('dd MMM yyyy').format(checkOut),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24),
                // Assigned Rooms
                Text(
                  'ASSIGNED ROOMS',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: ext.textMuted,
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: (booking.BookingRoom ?? []).map((br) {
                    if (br == null) return const SizedBox.shrink();
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: ext.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                        border: Border.all(color: ext.borderLight),
                      ),
                      child: Text(
                        'Room ${br.Room?.roomNumber ?? 'TBD'} (${br.RoomType?.name ?? 'Standard'})',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const Divider(height: 24),
                // Billing
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TOTAL AMOUNT',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: ext.textMuted,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '₹${totalAmount.toLocaleString('en-IN')}',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ext.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'PAYMENT STATUS',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: ext.textMuted,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: isPaid
                                ? ext.statusClean.withValues(alpha: 0.1)
                                : ext.statusInspect.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            isPaid ? 'PAID' : 'PENDING / PARTIAL',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: isPaid
                                  ? ext.statusClean
                                  : ext.statusInspect,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton.icon(
              icon: const Icon(Icons.edit, size: 16),
              label: const Text('Edit'),
              onPressed: () {
                Navigator.of(context).pop();
                context.push('/bookings', extra: booking);
              },
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

// Helper utility for currency format
extension DoubleFormatting on double {
  String toLocaleString(String locale) {
    return NumberFormat.decimalPattern(locale).format(this);
  }
}
