import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pms_admin/core/utils/invoice_generator.dart';
import 'package:pms_admin/core/theme/app_theme.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';
import 'package:pms_admin/features/calendar/presentation/calendar_controller.dart';
import 'package:pms_admin/features/bookings/presentation/bookings_controller.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  final bool scrollToToday;

  const CalendarScreen({super.key, this.scrollToToday = false});

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
  bool _hasScrolledToToday = false;

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

    void foucusOnDate(DateTime date) {
      ref.read(calendarStartDateProvider.notifier).state = DateTime(
        date.year,
        date.month,
        date.day,
      ).subtract(const Duration(days: 7));
      _gridHorizontalScrollController.animateTo(
        _dateColumnWidth * 6,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

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
            onPressed: () => foucusOnDate(DateTime.now()),
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
                if (widget.scrollToToday && !_hasScrolledToToday) {
                  _hasScrolledToToday = true;
                  final now = DateTime.now();
                  final todayDate = DateTime(now.year, now.month, now.day);

                  Future.microtask(() {
                    ref.read(calendarStartDateProvider.notifier).state =
                        todayDate.subtract(const Duration(days: 7));
                  });

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Future.delayed(const Duration(milliseconds: 300), () {
                      if (_gridHorizontalScrollController.hasClients) {
                        _gridHorizontalScrollController.animateTo(
                          _dateColumnWidth * 6,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    });
                  });
                }

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

    final today = DateTime.now();
    final todayDateOnly = DateTime(today.year, today.month, today.day);
    final checkInDateOnly = DateTime(checkIn.year, checkIn.month, checkIn.day);
    final limitDate = todayDateOnly.add(const Duration(days: 1));
    final isFutureBooking = checkInDateOnly.isAfter(limitDate);

    final List<Widget> actionButtons = [];

    if (booking.status != Enum$BookingStatus.CANCELLED &&
        booking.status != Enum$BookingStatus.CHECKED_OUT) {
      if (isFutureBooking && booking.status == Enum$BookingStatus.CONFIRMED) {
        actionButtons.add(
          TextButton.icon(
            icon: const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
              size: 16,
            ),
            label: const Text(
              'Cancel Booking',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (confirmContext) {
                  return AlertDialog(
                    title: const Text('Cancel Booking'),
                    content: const Text(
                      'Are you sure you want to cancel this booking?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(confirmContext).pop(),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(confirmContext).pop();
                          ref
                              .read(bookingsControllerProvider.notifier)
                              .cancelBooking(booking.id)
                              .then((success) {
                                if (success && context.mounted) {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Booking cancelled successfully',
                                      ),
                                    ),
                                  );
                                }
                              });
                        },
                        child: const Text(
                          'Yes, Cancel',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        );
      } else if (booking.status == Enum$BookingStatus.CONFIRMED) {
        actionButtons.add(
          TextButton.icon(
            icon: const Icon(Icons.login, size: 16),
            label: const Text('Check In'),
            onPressed: () {
              ref
                  .read(bookingsControllerProvider.notifier)
                  .updateBooking(
                    booking.id,
                    Input$UpdateBookingInput(
                      status: Enum$BookingStatus.CHECKED_IN,
                    ),
                  )
                  .then((success) {
                    if (success && context.mounted) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Booking checked in successfully'),
                        ),
                      );
                    }
                  });
            },
          ),
        );
      } else if (booking.status == Enum$BookingStatus.CHECKED_IN) {
        if (!isPaid) {
          actionButtons.add(
            TextButton.icon(
              icon: const Icon(Icons.payment, size: 16),
              label: const Text('Record Payment'),
              onPressed: () => _showRecordPaymentDialog(
                context,
                booking,
                totalAmount,
                totalPaid,
              ),
            ),
          );
        } else {
          actionButtons.add(
            TextButton.icon(
              icon: const Icon(Icons.logout, size: 16),
              label: const Text('Check Out'),
              onPressed: () {
                ref
                    .read(bookingsControllerProvider.notifier)
                    .updateBooking(
                      booking.id,
                      Input$UpdateBookingInput(
                        status: Enum$BookingStatus.CHECKED_OUT,
                      ),
                    )
                    .then((success) {
                      if (success && context.mounted) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Booking checked out successfully'),
                          ),
                        );
                      }
                    });
              },
            ),
          );
        }
      }
    }

    if (booking.status != Enum$BookingStatus.CANCELLED) {
      actionButtons.add(
        TextButton.icon(
          icon: const Icon(Icons.share, color: Colors.green, size: 16),
          label: const Text(
            'Share Invoice',
            style: TextStyle(color: Colors.green),
          ),
          onPressed: () async {
            final property = ref.read(selectedPropertyProvider);
            if (property == null) return;

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Generating and sharing invoice...'),
              ),
            );

            try {
              await shareInvoiceViaWhatsApp(
                booking: booking,
                property: property,
              );
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to share invoice: $e')),
                );
              }
            }
          },
        ),
      );
    }

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
                    Expanded(
                      child: Column(
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
                    ),
                    if (booking.Guest?.phone != null &&
                        booking.Guest!.phone!.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.phone, color: Colors.green),
                        onPressed: () async {
                          final phone = booking.Guest!.phone!;
                          final url = Uri.parse('tel:$phone');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Could not launch call to $phone',
                                  ),
                                ),
                              );
                            }
                          }
                        },
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
                        'Room ${br.Room?.roomNumber ?? 'TBD'} ${br.RoomType?.name != null ? '(${br.RoomType!.name})' : ''}',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
            ...actionButtons,
            TextButton.icon(
              icon: const Icon(Icons.info_outline, size: 16),
              label: const Text('View Details'),
              onPressed: () {
                Navigator.of(context).maybePop();
                context.push('/bookings/details', extra: booking);
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

  void _showRecordPaymentDialog(
    BuildContext context,
    Query$GetBookings$bookings booking,
    double totalAmount,
    double totalPaid,
  ) {
    final amountController = TextEditingController(
      text: (totalAmount - totalPaid).toStringAsFixed(0),
    );
    String paymentMethod = 'CASH';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Record Payment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount (₹)',
                  prefixIcon: Icon(Icons.currency_rupee),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: paymentMethod,
                decoration: const InputDecoration(labelText: 'Payment Method'),
                items: const [
                  DropdownMenuItem(value: 'CASH', child: Text('Cash')),
                  DropdownMenuItem(value: 'CARD', child: Text('Card')),
                  DropdownMenuItem(value: 'UPI', child: Text('UPI / QR')),
                  DropdownMenuItem(
                    value: 'BANK_TRANSFER',
                    child: Text('Bank Transfer'),
                  ),
                ],
                onChanged: (val) {
                  if (val != null) {
                    paymentMethod = val;
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final amt = double.tryParse(amountController.text) ?? 0.0;
                if (amt <= 0) return;

                Navigator.of(context).pop();

                ref
                    .read(bookingsControllerProvider.notifier)
                    .createPayment(
                      Input$CreatePaymentInput(
                        bookingId: booking.id,
                        tenantId: booking.propertyId,
                        amount: amt,
                        method: paymentMethod,
                        status: Enum$PaymentStatus.PAID,
                      ),
                    )
                    .then((success) {
                      if (success && context.mounted) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Payment recorded successfully'),
                          ),
                        );
                      }
                    });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.primary,
                ),
                foregroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.onPrimary,
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: const Text('Record'),
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
