import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pms_admin/core/theme/app_theme.dart';
import 'package:pms_admin/core/utils/invoice_generator.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';
import 'package:pms_admin/features/bookings/presentation/bookings_controller.dart';
import 'package:pms_admin/features/housekeeping/presentation/housekeeping_controller.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

class BookingDetailsScreen extends ConsumerStatefulWidget {
  final Query$GetBookings$bookings booking;

  const BookingDetailsScreen({super.key, required this.booking});

  @override
  ConsumerState<BookingDetailsScreen> createState() =>
      _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends ConsumerState<BookingDetailsScreen> {
  bool _isLoading = false;

  Color _getStatusColor(Enum$BookingStatus? status) {
    switch (status) {
      case Enum$BookingStatus.CONFIRMED:
        return Colors.blue;
      case Enum$BookingStatus.CHECKED_IN:
        return Colors.green;
      case Enum$BookingStatus.CHECKED_OUT:
        return Colors.grey;
      case Enum$BookingStatus.CANCELLED:
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  String _getStatusLabel(Enum$BookingStatus? status) {
    switch (status) {
      case Enum$BookingStatus.CONFIRMED:
        return 'Confirmed';
      case Enum$BookingStatus.CHECKED_IN:
        return 'Checked In';
      case Enum$BookingStatus.CHECKED_OUT:
        return 'Checked Out';
      case Enum$BookingStatus.CANCELLED:
        return 'Cancelled';
      default:
        return 'Confirmed';
    }
  }

  Future<void> _updateStatus(Enum$BookingStatus status) async {
    setState(() => _isLoading = true);
    final success = await ref
        .read(bookingsControllerProvider.notifier)
        .updateBooking(
          widget.booking.id,
          Input$UpdateBookingInput(
            status: status,
            checkInDate: widget.booking.checkInDate,
            checkOutDate: widget.booking.checkOutDate,
            adults: widget.booking.adults,
            children: widget.booking.children,
          ),
        );
    setState(() => _isLoading = false);

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Booking status updated to ${_getStatusLabel(status)}'),
        ),
      );
    }
  }

  Future<void> _cancelBooking() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Booking'),
        content: const Text(
          'Are you sure you want to cancel this booking? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Go Back'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              'Cancel Booking',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirm == true) {
      setState(() => _isLoading = true);
      final success = await ref
          .read(bookingsControllerProvider.notifier)
          .cancelBooking(widget.booking.id);
      setState(() => _isLoading = false);

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Booking cancelled successfully')),
        );
      }
    }
  }
  Future<void> _showEditDatesDialog(Query$GetBookings$bookings booking) async {
    final theme = Theme.of(context);
    
    DateTime tempCheckIn = DateTime.parse(booking.checkInDate).toLocal();
    DateTime tempCheckOut = DateTime.parse(booking.checkOutDate).toLocal();

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Change Stay Dates'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: tempCheckIn,
                              firstDate: DateTime.now().subtract(const Duration(days: 365)),
                              lastDate: DateTime.now().add(const Duration(days: 365)),
                            );
                            if (pickedDate != null) {
                              if (!context.mounted) return;
                              final defaultTime = TimeOfDay(hour: tempCheckIn.hour, minute: tempCheckIn.minute);
                              final pickedTime = await showTimePicker(
                                context: context,
                                initialTime: defaultTime,
                                helpText: 'SELECT CHECK-IN TIME',
                              );
                              final finalTime = pickedTime ?? defaultTime;
                              setDialogState(() {
                                tempCheckIn = DateTime(
                                  pickedDate.year,
                                  pickedDate.month,
                                  pickedDate.day,
                                  finalTime.hour,
                                  finalTime.minute,
                                );
                                if (tempCheckOut.isBefore(tempCheckIn)) {
                                  tempCheckOut = tempCheckIn.add(const Duration(days: 1));
                                }
                              });
                            }
                          },
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'Check-In *',
                              prefixIcon: Icon(Icons.calendar_today, size: 16),
                            ),
                            child: Text(
                              DateFormat('dd MMM yyyy, hh:mm a').format(tempCheckIn),
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final pickedDate = await showDatePicker(
                              context: context,
                              initialDate: tempCheckOut,
                              firstDate: tempCheckIn,
                              lastDate: DateTime.now().add(const Duration(days: 365)),
                            );
                            if (pickedDate != null) {
                              if (!context.mounted) return;
                              final defaultTime = TimeOfDay(hour: tempCheckOut.hour, minute: tempCheckOut.minute);
                              final pickedTime = await showTimePicker(
                                context: context,
                                initialTime: defaultTime,
                                helpText: 'SELECT CHECK-OUT TIME',
                              );
                              final finalTime = pickedTime ?? defaultTime;
                              setDialogState(() {
                                tempCheckOut = DateTime(
                                  pickedDate.year,
                                  pickedDate.month,
                                  pickedDate.day,
                                  finalTime.hour,
                                  finalTime.minute,
                                );
                              });
                            }
                          },
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'Check-Out *',
                              prefixIcon: Icon(Icons.calendar_today, size: 16),
                            ),
                            child: Text(
                              DateFormat('dd MMM yyyy, hh:mm a').format(tempCheckOut),
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(dialogContext).pop();
                    setState(() => _isLoading = true);
                    final success = await ref
                        .read(bookingsControllerProvider.notifier)
                        .updateBooking(
                          booking.id,
                          Input$UpdateBookingInput(
                            checkInDate: tempCheckIn.toIso8601String(),
                            checkOutDate: tempCheckOut.toIso8601String(),
                          ),
                        );
                    setState(() => _isLoading = false);
                    if (success && mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Stay dates updated successfully')),
                      );
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _showAddRoomDialog(Query$GetBookings$bookings booking) async {
    final theme = Theme.of(context);
    final roomsAsync = ref.read(housekeepingControllerProvider);
    final rooms = roomsAsync.value ?? [];

    final roomTypesMap = <String, Query$GetRooms$rooms$RoomType>{};
    for (final r in rooms) {
      if (r.RoomType != null) {
        roomTypesMap[r.RoomType!.id] = r.RoomType!;
      }
    }
    final roomTypes = roomTypesMap.values.toList();

    if (roomTypes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No room types available')),
      );
      return;
    }

    String? selectedRoomTypeId = roomTypes.first.id;
    String? selectedRoomId;
    final priceController = TextEditingController(
      text: (roomTypes.first.defaultPrice ?? 0.0).toStringAsFixed(0),
    );

    final bookingCheckIn = DateTime.parse(booking.checkInDate).toLocal();
    final bookingCheckOut = DateTime.parse(booking.checkOutDate).toLocal();

    DateTime tempCheckIn = bookingCheckIn;
    DateTime tempCheckOut = bookingCheckOut;

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            final filteredRooms = rooms
                .where((r) => r.RoomType?.id == selectedRoomTypeId)
                .toList();

            return AlertDialog(
              title: const Text('Add Room to Booking'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedRoomTypeId,
                      decoration: const InputDecoration(labelText: 'Room Type *'),
                      items: roomTypes.map((type) {
                        return DropdownMenuItem<String>(
                          value: type.id,
                          child: Text(type.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          final selectedType = roomTypes.firstWhere((t) => t.id == val);
                          setDialogState(() {
                            selectedRoomTypeId = val;
                            selectedRoomId = null;
                            priceController.text = (selectedType.defaultPrice ?? 0.0).toStringAsFixed(0);
                          });
                        }
                      },
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    DropdownButtonFormField<String?>(
                      value: selectedRoomId,
                      decoration: const InputDecoration(labelText: 'Room (Optional)'),
                      items: [
                        const DropdownMenuItem<String?>(
                          value: null,
                          child: Text('TBD (Assign Later)'),
                        ),
                        ...filteredRooms.map((room) {
                          return DropdownMenuItem<String?>(
                            value: room.id,
                            child: Text('Room ${room.roomNumber}'),
                          );
                        }),
                      ],
                      onChanged: (val) {
                        setDialogState(() {
                          selectedRoomId = val;
                        });
                      },
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    TextField(
                      controller: priceController,
                      decoration: const InputDecoration(
                        labelText: 'Price override per night (INR)',
                        prefixIcon: Icon(Icons.currency_rupee, size: 16),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    InkWell(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: tempCheckIn,
                          firstDate: bookingCheckIn,
                          lastDate: bookingCheckOut,
                        );
                        if (pickedDate != null) {
                          if (!context.mounted) return;
                          final defaultTime = TimeOfDay(hour: tempCheckIn.hour, minute: tempCheckIn.minute);
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: defaultTime,
                            helpText: 'SELECT ROOM CHECK-IN TIME',
                          );
                          final finalTime = pickedTime ?? defaultTime;
                          setDialogState(() {
                            tempCheckIn = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              finalTime.hour,
                              finalTime.minute,
                            );
                            if (tempCheckOut.isBefore(tempCheckIn)) {
                              tempCheckOut = tempCheckIn.add(const Duration(days: 1));
                            }
                          });
                        }
                      },
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Room Check-In *',
                          helperText: 'Must be within booking check-in/out dates',
                        ),
                        child: Text(
                          DateFormat('dd MMM yyyy, hh:mm a').format(tempCheckIn),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    InkWell(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: tempCheckOut,
                          firstDate: tempCheckIn,
                          lastDate: bookingCheckOut,
                        );
                        if (pickedDate != null) {
                          if (!context.mounted) return;
                          final defaultTime = TimeOfDay(hour: tempCheckOut.hour, minute: tempCheckOut.minute);
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: defaultTime,
                            helpText: 'SELECT ROOM CHECK-OUT TIME',
                          );
                          final finalTime = pickedTime ?? defaultTime;
                          setDialogState(() {
                            tempCheckOut = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              finalTime.hour,
                              finalTime.minute,
                            );
                          });
                        }
                      },
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Room Check-Out *',
                          helperText: 'Must be within booking check-in/out dates',
                        ),
                        child: Text(
                          DateFormat('dd MMM yyyy, hh:mm a').format(tempCheckOut),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (tempCheckIn.isBefore(bookingCheckIn) || tempCheckOut.isAfter(bookingCheckOut)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Room dates must be within overall checkin & checkout dates')),
                      );
                      return;
                    }
                    final double? priceOverrideVal = double.tryParse(priceController.text);

                    Navigator.of(dialogContext).pop();
                    setState(() => _isLoading = true);
                    final success = await ref
                        .read(bookingsControllerProvider.notifier)
                        .addBookingRoom(
                          bookingId: booking.id,
                          roomId: selectedRoomId,
                          roomTypeId: selectedRoomTypeId!,
                          checkInDate: tempCheckIn.toIso8601String(),
                          checkOutDate: tempCheckOut.toIso8601String(),
                          priceOverride: priceOverrideVal,
                        );
                    setState(() => _isLoading = false);
                    if (success && mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Room added to booking successfully')),
                      );
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _showSwitchRoomDialog(
    Query$GetBookings$bookings booking,
    Query$GetBookings$bookings$BookingRoom bookingRoom,
  ) async {
    final theme = Theme.of(context);
    final roomsAsync = ref.read(housekeepingControllerProvider);
    final rooms = roomsAsync.value ?? [];

    final roomTypesMap = <String, Query$GetRooms$rooms$RoomType>{};
    for (final r in rooms) {
      if (r.RoomType != null) {
        roomTypesMap[r.RoomType!.id] = r.RoomType!;
      }
    }
    final roomTypes = roomTypesMap.values.toList();

    String? selectedRoomTypeId = bookingRoom.roomTypeId;
    String? selectedRoomId = bookingRoom.roomId;
    final priceController = TextEditingController(
      text: (bookingRoom.priceOverride ?? bookingRoom.RoomType?.defaultPrice ?? 0.0).toStringAsFixed(0),
    );

    final bookingCheckIn = DateTime.parse(booking.checkInDate).toLocal();
    final bookingCheckOut = DateTime.parse(booking.checkOutDate).toLocal();

    DateTime tempCheckIn = bookingRoom.checkInDate != null 
        ? DateTime.parse(bookingRoom.checkInDate!).toLocal() 
        : bookingCheckIn;
    DateTime tempCheckOut = bookingRoom.checkOutDate != null 
        ? DateTime.parse(bookingRoom.checkOutDate!).toLocal() 
        : bookingCheckOut;

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            final filteredRooms = rooms
                .where((r) => r.RoomType?.id == selectedRoomTypeId)
                .toList();

            return AlertDialog(
              title: const Text('Switch Room / Edit Details'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedRoomTypeId,
                      decoration: const InputDecoration(labelText: 'Room Type *'),
                      items: roomTypes.map((type) {
                        return DropdownMenuItem<String>(
                          value: type.id,
                          child: Text(type.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          final selectedType = roomTypes.firstWhere((t) => t.id == val);
                          setDialogState(() {
                            selectedRoomTypeId = val;
                            selectedRoomId = null;
                            priceController.text = (selectedType.defaultPrice ?? 0.0).toStringAsFixed(0);
                          });
                        }
                      },
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    DropdownButtonFormField<String?>(
                      value: selectedRoomId,
                      decoration: const InputDecoration(labelText: 'Room (Optional)'),
                      items: [
                        const DropdownMenuItem<String?>(
                          value: null,
                          child: Text('TBD (Assign Later)'),
                        ),
                        ...filteredRooms.map((room) {
                          return DropdownMenuItem<String?>(
                            value: room.id,
                            child: Text('Room ${room.roomNumber}'),
                          );
                        }),
                      ],
                      onChanged: (val) {
                        setDialogState(() {
                          selectedRoomId = val;
                        });
                      },
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    TextField(
                      controller: priceController,
                      decoration: const InputDecoration(
                        labelText: 'Price override per night (INR)',
                        prefixIcon: Icon(Icons.currency_rupee, size: 16),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    InkWell(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: tempCheckIn,
                          firstDate: bookingCheckIn,
                          lastDate: bookingCheckOut,
                        );
                        if (pickedDate != null) {
                          if (!context.mounted) return;
                          final defaultTime = TimeOfDay(hour: tempCheckIn.hour, minute: tempCheckIn.minute);
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: defaultTime,
                            helpText: 'SELECT ROOM CHECK-IN TIME',
                          );
                          final finalTime = pickedTime ?? defaultTime;
                          setDialogState(() {
                            tempCheckIn = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              finalTime.hour,
                              finalTime.minute,
                            );
                            if (tempCheckOut.isBefore(tempCheckIn)) {
                              tempCheckOut = tempCheckIn.add(const Duration(days: 1));
                            }
                          });
                        }
                      },
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Room Check-In *',
                          helperText: 'Must be within booking check-in/out dates',
                        ),
                        child: Text(
                          DateFormat('dd MMM yyyy, hh:mm a').format(tempCheckIn),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    InkWell(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: tempCheckOut,
                          firstDate: tempCheckIn,
                          lastDate: bookingCheckOut,
                        );
                        if (pickedDate != null) {
                          if (!context.mounted) return;
                          final defaultTime = TimeOfDay(hour: tempCheckOut.hour, minute: tempCheckOut.minute);
                          final pickedTime = await showTimePicker(
                            context: context,
                            initialTime: defaultTime,
                            helpText: 'SELECT ROOM CHECK-OUT TIME',
                          );
                          final finalTime = pickedTime ?? defaultTime;
                          setDialogState(() {
                            tempCheckOut = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              finalTime.hour,
                              finalTime.minute,
                            );
                          });
                        }
                      },
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Room Check-Out *',
                          helperText: 'Must be within booking check-in/out dates',
                        ),
                        child: Text(
                          DateFormat('dd MMM yyyy, hh:mm a').format(tempCheckOut),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (tempCheckIn.isBefore(bookingCheckIn) || tempCheckOut.isAfter(bookingCheckOut)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Room dates must be within overall checkin & checkout dates')),
                      );
                      return;
                    }
                    final double? priceOverrideVal = double.tryParse(priceController.text);

                    Navigator.of(dialogContext).pop();
                    setState(() => _isLoading = true);
                    final success = await ref
                        .read(bookingsControllerProvider.notifier)
                        .updateBookingRoom(
                          bookingRoom.id,
                          Input$UpdateBookingRoomInput(
                            roomId: selectedRoomId,
                            roomTypeId: selectedRoomTypeId,
                            checkInDate: tempCheckIn.toIso8601String(),
                            checkOutDate: tempCheckOut.toIso8601String(),
                            priceOverride: priceOverrideVal,
                          ),
                        );
                    setState(() => _isLoading = false);
                    if (success && mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Room details switched successfully')),
                      );
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _deleteBookingRoom(Query$GetBookings$bookings$BookingRoom bookingRoom) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Room'),
        content: const Text(
          'Are you sure you want to remove this room from the booking? This will update the invoice details.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              'Remove',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirm == true) {
      setState(() => _isLoading = true);
      final success = await ref
          .read(bookingsControllerProvider.notifier)
          .deleteBookingRoom(bookingRoom.id);
      setState(() => _isLoading = false);

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Room removed successfully')),
        );
      }
    }
  }

  Future<void> _showDiscountDialog(Query$GetBookings$bookings booking) async {
    String discountType = booking.discountType ?? 'PERCENTAGE';
    final amountController = TextEditingController(
      text: (booking.discountAmount ?? 0.0).toStringAsFixed(0),
    );

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Apply / Modify Discount'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: discountType,
                    decoration: const InputDecoration(labelText: 'Discount Type'),
                    items: const [
                      DropdownMenuItem(
                        value: 'PERCENTAGE',
                        child: Text('Percentage (%)'),
                      ),
                      DropdownMenuItem(
                        value: 'FIXED',
                        child: Text('Fixed Amount (INR)'),
                      ),
                    ],
                    onChanged: (val) {
                      if (val != null) {
                        setDialogState(() {
                          discountType = val;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  TextField(
                    controller: amountController,
                    decoration: const InputDecoration(
                      labelText: 'Discount Value',
                      prefixIcon: Icon(Icons.percent, size: 16),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              actions: [
                if (booking.discountAmount != null && booking.discountAmount! > 0)
                  TextButton(
                    onPressed: () async {
                      Navigator.of(dialogContext).pop();
                      setState(() => _isLoading = true);
                      final success = await ref
                          .read(bookingsControllerProvider.notifier)
                          .updateBooking(
                            booking.id,
                            Input$UpdateBookingInput(
                              discountAmount: 0.0,
                              discountType: null,
                            ),
                          );
                      setState(() => _isLoading = false);
                      if (success && mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Discount removed successfully')),
                        );
                      }
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    child: const Text('Remove Discount'),
                  ),
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final double discountVal = double.tryParse(amountController.text) ?? 0.0;
                    Navigator.of(dialogContext).pop();
                    setState(() => _isLoading = true);
                    final success = await ref
                        .read(bookingsControllerProvider.notifier)
                        .updateBooking(
                          booking.id,
                          Input$UpdateBookingInput(
                            discountAmount: discountVal,
                            discountType: discountType,
                          ),
                        );
                    setState(() => _isLoading = false);
                    if (success && mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Discount updated successfully')),
                      );
                    }
                  },
                  child: const Text('Apply'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _showAddServiceDialog(Query$GetBookings$bookings booking) async {
    final servicesAsync = ref.read(servicesProvider);
    final services = servicesAsync.value ?? [];

    if (services.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No service items configured for this property')),
      );
      return;
    }

    Query$GetServices$services selectedService = services.first;
    final qtyController = TextEditingController(text: '1');
    final totalController = TextEditingController(
      text: selectedService.price.toStringAsFixed(0),
    );

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            void updateTotalPrice() {
              final qty = int.tryParse(qtyController.text) ?? 1;
              totalController.text = (qty * selectedService.price).toStringAsFixed(0);
            }

            return AlertDialog(
              title: const Text('Add Service Item'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<Query$GetServices$services>(
                    value: selectedService,
                    decoration: const InputDecoration(labelText: 'Service Item *'),
                    items: services.map((s) {
                      return DropdownMenuItem(
                        value: s,
                        child: Text('${s.name} (INR ${s.price.toStringAsFixed(0)})'),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setDialogState(() {
                          selectedService = val;
                          updateTotalPrice();
                        });
                      }
                    },
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  TextField(
                    controller: qtyController,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      prefixIcon: Icon(Icons.production_quantity_limits, size: 16),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (_) => setDialogState(updateTotalPrice),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  TextField(
                    controller: totalController,
                    decoration: const InputDecoration(
                      labelText: 'Total Price (INR)',
                      prefixIcon: Icon(Icons.currency_rupee, size: 16),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final int qty = int.tryParse(qtyController.text) ?? 1;
                    final double total = double.tryParse(totalController.text) ?? (qty * selectedService.price);

                    Navigator.of(dialogContext).pop();
                    setState(() => _isLoading = true);
                    final success = await ref
                        .read(bookingsControllerProvider.notifier)
                        .addBookingService(
                          bookingId: booking.id,
                          serviceId: selectedService.id,
                          quantity: qty,
                          totalPrice: total,
                        );
                    setState(() => _isLoading = false);
                    if (success && mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Service item added successfully')),
                      );
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _showEditServiceDialog(
    Query$GetBookings$bookings booking,
    Query$GetBookings$bookings$BookingService serviceItem,
  ) async {
    final qtyController = TextEditingController(text: serviceItem.quantity.toString());
    final totalController = TextEditingController(text: serviceItem.totalPrice.toStringAsFixed(0));
    final unitPrice = serviceItem.Service?.price ?? 0.0;

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            void updateTotalPrice() {
              final qty = int.tryParse(qtyController.text) ?? 1;
              totalController.text = (qty * unitPrice).toStringAsFixed(0);
            }

            return AlertDialog(
              title: Text('Edit ${serviceItem.Service?.name ?? 'Service'}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: qtyController,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      prefixIcon: Icon(Icons.production_quantity_limits, size: 16),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (_) => setDialogState(updateTotalPrice),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  TextField(
                    controller: totalController,
                    decoration: const InputDecoration(
                      labelText: 'Total Price (INR)',
                      prefixIcon: Icon(Icons.currency_rupee, size: 16),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final int qty = int.tryParse(qtyController.text) ?? 1;
                    final double total = double.tryParse(totalController.text) ?? (qty * unitPrice);

                    Navigator.of(dialogContext).pop();
                    setState(() => _isLoading = true);
                    final success = await ref
                        .read(bookingsControllerProvider.notifier)
                        .updateBookingService(
                          serviceItem.id,
                          Input$UpdateBookingServiceInput(
                            quantity: qty,
                            totalPrice: total,
                          ),
                        );
                    setState(() => _isLoading = false);
                    if (success && mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Service item updated successfully')),
                      );
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _deleteBookingService(Query$GetBookings$bookings$BookingService serviceItem) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Service Item'),
        content: const Text(
          'Are you sure you want to remove this service item from the booking?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              'Remove',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirm == true) {
      setState(() => _isLoading = true);
      final success = await ref
          .read(bookingsControllerProvider.notifier)
          .deleteBookingService(serviceItem.id);
      setState(() => _isLoading = false);

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Service item removed successfully')),
        );
      }
    }
  }

  void _showRecordPaymentDialog(
    BuildContext context,
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
                        bookingId: widget.booking.id,
                        tenantId: widget.booking.propertyId,
                        amount: amt,
                        method: paymentMethod,
                        status: Enum$PaymentStatus.PAID,
                      ),
                    )
                    .then((success) {
                      if (success && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Payment recorded successfully'),
                          ),
                        );
                      }
                    });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Record'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _shareInvoice(Query$GetProperties$properties property) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Generating and sharing invoice...')),
    );

    try {
      await shareInvoiceViaWhatsApp(
        booking: widget.booking,
        property: property,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to share invoice: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;
    final selectedProperty = ref.watch(selectedPropertyProvider);
    final bookingsAsync = ref.watch(bookingsListProvider);

    // Reactively watch this specific booking to automatically update UI on invalidation
    final booking = bookingsAsync.maybeWhen(
      data: (list) => list.firstWhere(
        (b) => b.id == widget.booking.id,
        orElse: () => widget.booking,
      ),
      orElse: () => widget.booking,
    );

    final statusColor = _getStatusColor(booking.status);
    final statusLabel = _getStatusLabel(booking.status);

    final checkIn = DateTime.parse(booking.checkInDate).toLocal();
    final checkOut = DateTime.parse(booking.checkOutDate).toLocal();
    final nights = checkOut.difference(checkIn).inDays;

    final totals = selectedProperty != null
        ? calculateBookingInvoiceTotals(booking, selectedProperty)
        : null;

    // Calculate billing
    final totalAmount = totals?.total ?? booking.totalAmount ?? 0.0;
    final totalPaid = totals?.totalPaid ?? (booking.Payment ?? [])
        .where((p) => p != null && p.status == Enum$PaymentStatus.PAID)
        .fold<double>(0.0, (sum, p) => sum + (p?.amount ?? 0.0));
    final balanceDue = totals?.balance ?? (totalAmount - totalPaid);
    final isPaid = totalPaid >= totalAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BOOKING DETAILS',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          if (booking.status != Enum$BookingStatus.CANCELLED &&
              selectedProperty != null)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => _shareInvoice(selectedProperty),
              tooltip: 'Share Invoice',
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header Card: Status & ID
                  Card(
                    color: statusColor.withValues(alpha: 0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                      side: BorderSide(
                        color: statusColor.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppTheme.spacingMd),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'BOOKING ID',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: ext.textMuted,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: statusColor.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(
                                    AppTheme.radiusSm,
                                  ),
                                ),
                                child: Text(
                                  statusLabel.toUpperCase(),
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: statusColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              booking.id.toUpperCase(),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ext.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),

                  // Guest Information Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppTheme.spacingMd),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'GUEST PROFILE',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: ext.textMuted,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              if (booking.Guest?.phone != null)
                                IconButton(
                                  icon: const Icon(
                                    Icons.call,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () async {
                                    final uri = Uri.parse(
                                      'tel:${booking.Guest!.phone}',
                                    );
                                    if (await canLaunchUrl(uri)) {
                                      await launchUrl(uri);
                                    }
                                  },
                                  tooltip: 'Call Guest',
                                ),
                            ],
                          ),
                          const Divider(),
                          Text(
                            booking.Guest?.name ?? 'Guest Name',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ext.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (booking.Guest?.phone != null) ...[
                            _buildInfoRow(
                              Icons.phone_outlined,
                              'Phone',
                              booking.Guest!.phone!,
                              ext,
                            ),
                            const SizedBox(height: 6),
                          ],
                          if (booking.Guest?.email != null) ...[
                            _buildInfoRow(
                              Icons.email_outlined,
                              'Email',
                              booking.Guest!.email!,
                              ext,
                            ),
                            const SizedBox(height: 6),
                          ],
                          if (booking.Guest?.address != null) ...[
                            _buildInfoRow(
                              Icons.location_on_outlined,
                              'Address',
                              booking.Guest!.address!,
                              ext,
                            ),
                            const SizedBox(height: 6),
                          ],
                          if (booking.Guest?.gstin != null) ...[
                            _buildInfoRow(
                              Icons.receipt_long_outlined,
                              'GSTIN',
                              booking.Guest!.gstin!,
                              ext,
                            ),
                            const SizedBox(height: 6),
                          ],
                          _buildInfoRow(
                            Icons.people_alt_outlined,
                            'Guests Count',
                            '${booking.adults} Adults, ${booking.children} Children',
                            ext,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),

                  // Stay & Room Details Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppTheme.spacingMd),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'STAY DETAILS',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: ext.textMuted,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              if (booking.status != Enum$BookingStatus.CANCELLED)
                                IconButton(
                                  icon: const Icon(Icons.edit_calendar, size: 18),
                                  onPressed: () => _showEditDatesDialog(booking),
                                  visualDensity: VisualDensity.compact,
                                  tooltip: 'Change stay dates',
                                ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildDateBlock('CHECK-IN', checkIn, ext),
                              Column(
                                children: [
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                  const SizedBox(height: 2),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: theme
                                          .colorScheme
                                          .surfaceContainerHighest,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      '$nights Nights',
                                      style: theme.textTheme.labelSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              _buildDateBlock('CHECK-OUT', checkOut, ext),
                            ],
                          ),
                          const SizedBox(height: AppTheme.spacingLg),
                          Text(
                            'ASSIGNED ROOMS',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: ext.textMuted,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          if (booking.BookingRoom == null ||
                              booking.BookingRoom!.isEmpty)
                            Text(
                              'No rooms assigned yet',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: ext.textMuted,
                              ),
                            )
                          else
                            ...booking.BookingRoom!.map((br) {
                              if (br == null) return const SizedBox.shrink();
                              return Container(
                                margin: const EdgeInsets.only(bottom: 6),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: theme
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: ext.borderLight,
                                    width: 0.5,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.bed,
                                            size: 16,
                                            color: Colors.blue,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Room ${br.Room?.roomNumber ?? 'TBD'}',
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          const SizedBox(width: 6),
                                          Expanded(
                                            child: Text(
                                              '(${br.RoomType?.name ?? 'Standard'})',
                                              style: theme.textTheme.bodySmall
                                                  ?.copyWith(
                                                    color: ext.textMuted,
                                                  ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '₹${(br.priceOverride ?? br.RoomType?.defaultPrice ?? 0.0).toStringAsFixed(0)}/n',
                                      style: theme.textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    if (booking.status != Enum$BookingStatus.CANCELLED) ...[
                                      IconButton(
                                        icon: const Icon(Icons.edit_outlined, size: 16),
                                        onPressed: () => _showSwitchRoomDialog(booking, br),
                                        visualDensity: VisualDensity.compact,
                                        tooltip: 'Switch room / edit price',
                                      ),
                                      if (booking.BookingRoom!.length > 1)
                                        IconButton(
                                          icon: const Icon(Icons.delete_outline, size: 16, color: Colors.red),
                                          onPressed: () => _deleteBookingRoom(br),
                                          visualDensity: VisualDensity.compact,
                                          tooltip: 'Remove room',
                                        ),
                                    ],
                                  ],
                                ),
                              );
                            }),
                          if (booking.status != Enum$BookingStatus.CANCELLED) ...[
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.add, size: 16),
                                label: const Text('Add Room to Booking'),
                                onPressed: () => _showAddRoomDialog(booking),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),

                  // Service Charges Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppTheme.spacingMd),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SERVICE CHARGES',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: ext.textMuted,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              if (booking.status != Enum$BookingStatus.CANCELLED)
                                IconButton(
                                  icon: const Icon(Icons.add, size: 18),
                                  onPressed: () => _showAddServiceDialog(booking),
                                  visualDensity: VisualDensity.compact,
                                  tooltip: 'Add service item',
                                ),
                            ],
                          ),
                          const Divider(),
                          if (booking.BookingService == null ||
                              booking.BookingService!.isEmpty)
                            Text(
                              'No service items added yet',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: ext.textMuted,
                              ),
                            )
                          else
                            ...booking.BookingService!.map((s) {
                              if (s == null) return const SizedBox.shrink();
                              return Container(
                                margin: const EdgeInsets.only(bottom: 6),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: ext.borderLight,
                                    width: 0.5,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            s.Service?.name ?? 'Service',
                                            style: theme.textTheme.bodyMedium?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'Qty: ${s.quantity} @ ₹${(s.Service?.price ?? 0.0).toStringAsFixed(0)}',
                                            style: theme.textTheme.bodySmall?.copyWith(
                                              color: ext.textMuted,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '₹${s.totalPrice.toStringAsFixed(0)}',
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    if (booking.status != Enum$BookingStatus.CANCELLED) ...[
                                      IconButton(
                                        icon: const Icon(Icons.edit_outlined, size: 16),
                                        onPressed: () => _showEditServiceDialog(booking, s),
                                        visualDensity: VisualDensity.compact,
                                        tooltip: 'Edit service',
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete_outline, size: 16, color: Colors.red),
                                        onPressed: () => _deleteBookingService(s),
                                        visualDensity: VisualDensity.compact,
                                        tooltip: 'Remove service',
                                      ),
                                    ],
                                  ],
                                ),
                              );
                            }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),

                  // Billing & Payments Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppTheme.spacingMd),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'BILLING & PAYMENTS',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: ext.textMuted,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: isPaid
                                      ? Colors.green.withValues(alpha: 0.1)
                                      : Colors.orange.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  isPaid ? 'PAID' : 'PENDING',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: isPaid
                                        ? Colors.green
                                        : Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          if (totals != null) ...[
                            _buildBillingRow(
                              'Room Charges (${totals.nights} nights)',
                              totals.roomTotal,
                              theme,
                              ext,
                            ),
                            if (totals.serviceTotal > 0) ...[
                              const SizedBox(height: 6),
                              _buildBillingRow(
                                'Service Charges',
                                totals.serviceTotal,
                                theme,
                                ext,
                              ),
                            ],
                            const SizedBox(height: 6),
                            _buildBillingRow(
                              'Subtotal',
                              totals.subtotal,
                              theme,
                              ext,
                              isBold: true,
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Discount',
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        color: ext.textMuted,
                                      ),
                                    ),
                                    if (booking.status != Enum$BookingStatus.CANCELLED)
                                      IconButton(
                                        icon: const Icon(Icons.edit, size: 14),
                                        onPressed: () => _showDiscountDialog(booking),
                                        visualDensity: VisualDensity.compact,
                                        tooltip: 'Apply/Modify Discount',
                                      ),
                                  ],
                                ),
                                Text(
                                  '-₹${totals.discount.toStringAsFixed(0)}',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            if (totals.tax > 0) ...[
                              const SizedBox(height: 6),
                              _buildBillingRow(
                                'Tax (${selectedProperty?.taxPercentage ?? 0}%)',
                                totals.tax,
                                theme,
                                ext,
                              ),
                            ],
                            const Divider(),
                            _buildBillingRow(
                              'Grand Total',
                              totals.total,
                              theme,
                              ext,
                              isBold: true,
                            ),
                            const SizedBox(height: 6),
                            _buildBillingRow(
                              'Total Amount Paid',
                              totals.totalPaid,
                              theme,
                              ext,
                              color: Colors.green,
                            ),
                            const SizedBox(height: 6),
                            _buildBillingRow(
                              'Balance Due',
                              totals.balance,
                              theme,
                              ext,
                              color: totals.balance > 0 ? Colors.red : Colors.green,
                              isBold: true,
                            ),
                          ] else ...[
                            _buildBillingRow(
                              'Total Booking Amount',
                              totalAmount,
                              theme,
                              ext,
                              isBold: true,
                            ),
                            const SizedBox(height: 6),
                            _buildBillingRow(
                              'Total Amount Paid',
                              totalPaid,
                              theme,
                              ext,
                              color: Colors.green,
                            ),
                            const SizedBox(height: 6),
                            _buildBillingRow(
                              'Balance Due',
                              balanceDue,
                              theme,
                              ext,
                              color: balanceDue > 0 ? Colors.red : Colors.green,
                              isBold: true,
                            ),
                          ],

                          const SizedBox(height: 16),
                          if (balanceDue > 0 &&
                              booking.status != Enum$BookingStatus.CANCELLED)
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.add_card),
                                label: const Text('Record Payment'),
                                onPressed: () => _showRecordPaymentDialog(
                                  context,
                                  totalAmount,
                                  totalPaid,
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),

                          // Payments Log
                          if (booking.Payment != null &&
                              booking.Payment!.any((p) => p != null)) ...[
                            const SizedBox(height: 16),
                            Text(
                              'PAYMENT HISTORY',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: ext.textMuted,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Table(
                              columnWidths: const {
                                0: FlexColumnWidth(2.5),
                                1: FlexColumnWidth(2),
                                2: FlexColumnWidth(2.5),
                              },
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: ext.borderLight,
                                      ),
                                    ),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                      ),
                                      child: Text(
                                        'DATE',
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(color: ext.textMuted),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                      ),
                                      child: Text(
                                        'METHOD',
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(color: ext.textMuted),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                      ),
                                      child: Text(
                                        'AMOUNT',
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(color: ext.textMuted),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                                ...booking.Payment!.map((p) {
                                  if (p == null) {
                                    return const TableRow(
                                      children: [
                                        SizedBox(),
                                        SizedBox(),
                                        SizedBox(),
                                      ],
                                    );
                                  }
                                  final pDate = p.createdAt != null
                                      ? DateFormat('dd MMM hh:mm a').format(
                                          DateTime.parse(
                                            p.createdAt!,
                                          ).toLocal(),
                                        )
                                      : 'TBD';
                                  return TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                        ),
                                        child: Text(
                                          pDate,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                        ),
                                        child: Text(
                                          p.method,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                        ),
                                        child: Text(
                                          '₹${p.amount.toStringAsFixed(0)}',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingXl),

                  // Operations Actions Card
                  if (booking.status != Enum$BookingStatus.CANCELLED)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppTheme.spacingMd),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'STAY ACTIONS',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: ext.textMuted,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Divider(),
                            if (booking.status ==
                                Enum$BookingStatus.CONFIRMED) ...[
                              ElevatedButton.icon(
                                icon: const Icon(Icons.login),
                                label: const Text('Check In Guest'),
                                onPressed: () => _updateStatus(
                                  Enum$BookingStatus.CHECKED_IN,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                            if (booking.status ==
                                Enum$BookingStatus.CHECKED_IN) ...[
                              ElevatedButton.icon(
                                icon: const Icon(Icons.logout),
                                label: const Text('Check Out Guest'),
                                onPressed: () => _updateStatus(
                                  Enum$BookingStatus.CHECKED_OUT,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[700],
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                            if (booking.status == Enum$BookingStatus.CONFIRMED)
                              OutlinedButton.icon(
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.red,
                                ),
                                label: const Text(
                                  'Cancel Booking',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: _cancelBooking,
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  side: const BorderSide(color: Colors.red),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value,
    AppColorsExtension ext,
  ) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: ext.textMuted),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: theme.textTheme.bodySmall?.copyWith(
            color: ext.textMuted,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: theme.textTheme.bodySmall?.copyWith(color: ext.textPrimary),
          ),
        ),
      ],
    );
  }

  Widget _buildDateBlock(String title, DateTime date, AppColorsExtension ext) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.labelSmall?.copyWith(
            color: ext.textMuted,
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          DateFormat('dd MMM yyyy').format(date),
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          DateFormat('EEEE, hh:mm a').format(date),
          style: theme.textTheme.labelSmall?.copyWith(
            color: ext.textMuted,
            fontSize: 9,
          ),
        ),
      ],
    );
  }

  Widget _buildBillingRow(
    String label,
    double amount,
    ThemeData theme,
    AppColorsExtension ext, {
    Color? color,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isBold ? ext.textPrimary : ext.textMuted,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          '₹${amount.toStringAsFixed(2)}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: color ?? ext.textPrimary,
            fontWeight: isBold ? FontWeight.w900 : FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
