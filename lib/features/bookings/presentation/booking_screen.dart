import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/core/theme/app_theme.dart';
import 'package:pms_admin/features/bookings/presentation/bookings_controller.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';
import 'package:pms_admin/features/housekeeping/presentation/housekeeping_controller.dart';
import 'package:pms_admin/features/calendar/presentation/calendar_controller.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

class BookingScreen extends ConsumerStatefulWidget {
  final Query$GetBookings$bookings? existingBooking;

  const BookingScreen({super.key, this.existingBooking});

  @override
  ConsumerState<BookingScreen> createState() => _BookingScreenState();
}

class SelectedRoomState {
  String? roomTypeId;
  String? roomId;
  final TextEditingController priceOverrideController;

  SelectedRoomState({
    this.roomTypeId,
    this.roomId,
    TextEditingController? controller,
  }) : priceOverrideController = controller ?? TextEditingController();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isEdit = false;
  List<SelectedRoomState> _selectedRooms = [];

  // Room Grid selections for Create Mode
  final Set<String> _selectedRoomIds = {};
  final Map<String, String> _customRates = {};
  final Map<String, bool> _collapsedRoomTypes = {};

  // Guest fields
  bool _createNewGuest = false;
  String? _selectedGuestId;
  final _guestNameController = TextEditingController();
  final _guestPhoneController = TextEditingController();
  final _guestEmailController = TextEditingController();
  final _guestAddressController = TextEditingController();
  String? _guestIdProofType;
  final _guestIdProofNumberController = TextEditingController();

  // Booking fields
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  final _adultsController = TextEditingController(text: '1');
  final _childrenController = TextEditingController(text: '0');
  final _notesController = TextEditingController();

  // Financials
  final _advanceAmountController = TextEditingController();
  String _advanceMethod = 'CASH';

  // Status for edit mode
  Enum$BookingStatus _status = Enum$BookingStatus.CONFIRMED;

  TimeOfDay _getPropertyCheckInTime() {
    final property = ref.read(selectedPropertyProvider);
    if (property?.settings != null) {
      try {
        final settings = jsonDecode(property!.settings!) as Map<String, dynamic>;
        final checkInStr = settings['checkinTime'] as String?;
        if (checkInStr != null && checkInStr.isNotEmpty) {
          final parts = checkInStr.split(':');
          return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
        }
      } catch (_) {}
    }
    return const TimeOfDay(hour: 8, minute: 0); // Default check-in at 8:00 AM
  }

  TimeOfDay _getPropertyCheckOutTime() {
    final property = ref.read(selectedPropertyProvider);
    if (property?.settings != null) {
      try {
        final settings = jsonDecode(property!.settings!) as Map<String, dynamic>;
        final checkOutStr = settings['checkoutTime'] as String?;
        if (checkOutStr != null && checkOutStr.isNotEmpty) {
          final parts = checkOutStr.split(':');
          return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
        }
      } catch (_) {}
    }
    return const TimeOfDay(hour: 7, minute: 0); // Default check-out at 07:00 AM
  }

  @override
  void initState() {
    super.initState();
    if (widget.existingBooking != null) {
      _isEdit = true;
      final booking = widget.existingBooking!;

      _checkInDate = DateTime.tryParse(booking.checkInDate)?.toLocal();
      _checkOutDate = DateTime.tryParse(booking.checkOutDate)?.toLocal();

      if (booking.BookingRoom != null && booking.BookingRoom!.isNotEmpty) {
        _selectedRooms = booking.BookingRoom!.where((br) => br != null).map((
          br,
        ) {
          return SelectedRoomState(
            roomTypeId: br!.roomTypeId,
            roomId: br.roomId,
            controller: TextEditingController(
              text: br.priceOverride != null
                  ? br.priceOverride!.toStringAsFixed(0)
                  : '',
            ),
          );
        }).toList();
      } else {
        _selectedRooms = [SelectedRoomState()];
      }

      _adultsController.text = booking.adults?.toString() ?? '1';
      _childrenController.text = booking.children?.toString() ?? '0';
      _notesController.text = booking.notes ?? '';
      _status = booking.status ?? Enum$BookingStatus.CONFIRMED;
      _selectedGuestId = booking.guestId;
    } else {
      _selectedRooms = [SelectedRoomState()];

      final checkInTime = _getPropertyCheckInTime();
      final checkOutTime = _getPropertyCheckOutTime();
      final now = DateTime.now();

      _checkInDate = DateTime(
        now.year,
        now.month,
        now.day,
        checkInTime.hour,
        checkInTime.minute,
      );
      final tomorrow = now.add(const Duration(days: 1));
      _checkOutDate = DateTime(
        tomorrow.year,
        tomorrow.month,
        tomorrow.day,
        checkOutTime.hour,
        checkOutTime.minute,
      );
    }
  }

  @override
  void dispose() {
    _guestNameController.dispose();
    _guestPhoneController.dispose();
    _guestEmailController.dispose();
    _guestAddressController.dispose();
    _guestIdProofNumberController.dispose();
    for (final r in _selectedRooms) {
      r.priceOverrideController.dispose();
    }
    _adultsController.dispose();
    _childrenController.dispose();
    _notesController.dispose();
    _advanceAmountController.dispose();
    super.dispose();
  }

  Future<void> _selectCheckInDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _checkInDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      if (!mounted) return;
      final defaultTime = _getPropertyCheckInTime();
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: _checkInDate != null
            ? TimeOfDay(hour: _checkInDate!.hour, minute: _checkInDate!.minute)
            : defaultTime,
        helpText: 'SELECT CHECK-IN TIME',
      );

      final finalTime = pickedTime ?? defaultTime;
      setState(() {
        _checkInDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          finalTime.hour,
          finalTime.minute,
        );
        // Reset check-out date if it is before check-in
        if (_checkOutDate != null && _checkOutDate!.isBefore(_checkInDate!)) {
          _checkOutDate = null;
        }
      });
    }
  }

  Future<void> _selectCheckOutDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate:
          _checkOutDate ??
          (_checkInDate ?? DateTime.now()).add(const Duration(days: 1)),
      firstDate: _checkInDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      if (!mounted) return;
      final defaultTime = _getPropertyCheckOutTime();
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: _checkOutDate != null
            ? TimeOfDay(hour: _checkOutDate!.hour, minute: _checkOutDate!.minute)
            : defaultTime,
        helpText: 'SELECT CHECK-OUT TIME',
      );

      final finalTime = pickedTime ?? defaultTime;
      setState(() {
        _checkOutDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          finalTime.hour,
          finalTime.minute,
        );
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_checkInDate == null || _checkOutDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select check-in and check-out dates'),
        ),
      );
      return;
    }

    final selectedProperty = ref.read(selectedPropertyProvider);
    if (selectedProperty == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('No property selected')));
      return;
    }

    final controller = ref.read(bookingsControllerProvider.notifier);

    String finalGuestId = '';

    if (_isEdit) {
      finalGuestId = _selectedGuestId!;
    } else {
      if (_createNewGuest) {
        final guestInput = Input$CreateGuestInput(
          name: _guestNameController.text.trim(),
          phone: _guestPhoneController.text.trim(),
          email: _guestEmailController.text.trim().isEmpty
              ? null
              : _guestEmailController.text.trim(),
          address: _guestAddressController.text.trim().isEmpty
              ? null
              : _guestAddressController.text.trim(),
          idProofType: _guestIdProofType,
          idProofNumber: _guestIdProofNumberController.text.trim().isEmpty
              ? null
              : _guestIdProofNumberController.text.trim(),
          tenantId: selectedProperty.tenantId,
        );
        final guest = await controller.createGuest(guestInput);
        if (!mounted) return;
        if (guest == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to create guest. Check name & phone.'),
            ),
          );
          return;
        }
        finalGuestId = guest.id;
      } else {
        if (_selectedGuestId == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select a guest')),
          );
          return;
        }
        finalGuestId = _selectedGuestId!;
      }
    }

    if (!mounted) return;
    final checkInStr = _checkInDate!.toIso8601String();
    final checkOutStr = _checkOutDate!.toIso8601String();
    final adultsVal = int.tryParse(_adultsController.text) ?? 1;
    final childrenVal = int.tryParse(_childrenController.text) ?? 0;

    bool success = false;

    if (_isEdit) {
      final updateInput = Input$UpdateBookingInput(
        status: _status,
        checkInDate: checkInStr,
        checkOutDate: checkOutStr,
        adults: adultsVal,
        children: childrenVal,
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
      );
      success = await controller.updateBooking(
        widget.existingBooking!.id,
        updateInput,
      );
    } else {
      if (_selectedRoomIds.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select at least one room')),
        );
        return;
      }

      final rooms = ref.read(housekeepingControllerProvider).value ?? [];
      final List<Input$BookingRoomInput> roomInputs = [];
      for (final roomId in _selectedRoomIds) {
        final room = rooms.firstWhere(
          (r) => r.id == roomId,
          orElse: () => rooms.first,
        );
        final rateStr = _customRates[roomId];
        final double? priceOverrideVal =
            rateStr != null && rateStr.trim().isNotEmpty
            ? double.tryParse(rateStr)
            : null;
        roomInputs.add(
          Input$BookingRoomInput(
            roomTypeId: room.RoomType?.id ?? '',
            quantity: 1,
            roomId: roomId,
            priceOverride: priceOverrideVal,
          ),
        );
      }

      final double? advanceVal = double.tryParse(_advanceAmountController.text);

      final createInput = Input$CreateBookingInput(
        guestId: finalGuestId,
        propertyId: selectedProperty.id,
        checkInDate: checkInStr,
        checkOutDate: checkOutStr,
        rooms: roomInputs,
        adults: adultsVal,
        children: childrenVal,
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        advanceAmount: advanceVal != null && advanceVal > 0 ? advanceVal : null,
        advanceMethod: advanceVal != null && advanceVal > 0
            ? _advanceMethod
            : null,
      );

      success = await controller.createBooking(createInput);
    }

    if (!mounted) return;
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isEdit
                ? 'Booking updated successfully!'
                : 'Booking created successfully!',
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;

    final guestsAsync = ref.watch(guestsProvider);
    final roomsAsync = ref.watch(housekeepingControllerProvider);
    final bookingsState = ref.watch(bookingsControllerProvider);
    final calendarDataAsync = ref.watch(calendarDataProvider);
    final bookings = calendarDataAsync.value?.bookings ?? [];

    bool isRoomBooked(String roomId) {
      if (_checkInDate == null || _checkOutDate == null) return false;
      for (final b in bookings) {
        if (b.status == Enum$BookingStatus.CANCELLED) continue;
        if (b.BookingRoom == null) continue;
        for (final br in b.BookingRoom!) {
          if (br == null || br.roomId != roomId) continue;

          final startStr = br.checkInDate ?? b.checkInDate;
          final endStr = br.checkOutDate ?? b.checkOutDate;

          final startVal = DateTime.tryParse(startStr)?.toLocal();
          final endVal = DateTime.tryParse(endStr)?.toLocal();
          if (startVal == null || endVal == null) continue;

          if (_checkInDate!.isBefore(endVal) &&
              _checkOutDate!.isAfter(startVal)) {
            return true;
          }
        }
      }
      return false;
    }

    final rooms = roomsAsync.value ?? [];

    // Group rooms by Room Type
    final Map<String, List<Query$GetRooms$rooms>> roomsByRoomType = {};
    for (final r in rooms) {
      if (r.RoomType != null) {
        roomsByRoomType.putIfAbsent(r.RoomType!.name, () => []).add(r);
      }
    }

    final roomTypesMap = <String, Query$GetRooms$rooms$RoomType>{};
    for (final r in rooms) {
      if (r.RoomType != null) {
        roomTypesMap[r.RoomType!.id] = r.RoomType!;
      }
    }
    final roomTypes = roomTypesMap.values.toList();

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          _isEdit ? 'Edit Booking' : 'New Booking',
          style: theme.textTheme.titleMedium?.copyWith(
            color: ext.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      bottomNavigationBar: bookingsState.isLoading
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingGutter,
                  vertical: AppTheme.spacingMd,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                  ),
                  onPressed: _submit,
                  child: Text(
                    _isEdit ? 'UPDATE BOOKING' : 'CREATE BOOKING',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
      body: bookingsState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(AppTheme.spacingGutter),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 1. Stay Dates Card
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppTheme.spacingMd),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'STAY DATES',
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.primary,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: AppTheme.spacingMd),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: _isEdit ? null : _selectCheckInDate,
                                    child: InputDecorator(
                                      decoration: const InputDecoration(
                                        labelText: 'Check-In Date *',
                                        prefixIcon: Icon(Icons.calendar_today),
                                      ),
                                      child: Text(
                                        _checkInDate == null
                                            ? 'Select'
                                            : DateFormat(
                                                'dd MMM yyyy, hh:mm a',
                                              ).format(_checkInDate!),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: AppTheme.spacingMd),
                                Expanded(
                                  child: InkWell(
                                    onTap: _isEdit ? null : _selectCheckOutDate,
                                    child: InputDecorator(
                                      decoration: const InputDecoration(
                                        labelText: 'Check-Out Date *',
                                        prefixIcon: Icon(Icons.calendar_today),
                                      ),
                                      child: Text(
                                        _checkOutDate == null
                                            ? 'Select'
                                            : DateFormat(
                                                'dd MMM yyyy, hh:mm a',
                                              ).format(_checkOutDate!),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingMd),

                    // 2. Room Selection / Display
                    if (_isEdit)
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(AppTheme.spacingMd),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ASSIGNED ROOMS',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                              ..._selectedRooms.map((roomState) {
                                final room = rooms.firstWhere(
                                  (r) => r.id == roomState.roomId,
                                  orElse: () => rooms.first,
                                );
                                final roomType = roomTypes.firstWhere(
                                  (rt) => rt.id == roomState.roomTypeId,
                                  orElse: () => roomTypes.first,
                                );
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                    backgroundColor: ext.surfaceContainerLow,
                                    child: const Icon(Icons.meeting_room),
                                  ),
                                  title: Text(
                                    roomState.roomId != null
                                        ? 'Room ${room.roomNumber}'
                                        : 'Auto-Assign',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    roomState.roomTypeId != null
                                        ? roomType.name
                                        : 'No Room Type',
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      )
                    else
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(AppTheme.spacingMd),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SELECT ROOMS *',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                              if (roomsByRoomType.isEmpty)
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 24),
                                    child: Text(
                                      'No rooms available.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              else
                                ...roomsByRoomType.entries.map((entry) {
                                  final typeName = entry.key;
                                  final typeRooms = entry.value;
                                  final isCollapsed =
                                      _collapsedRoomTypes[typeName] ?? false;
                                  final allSelected = typeRooms.every(
                                    (r) => _selectedRoomIds.contains(r.id),
                                  );

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _collapsedRoomTypes[typeName] =
                                                !isCollapsed;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8.0,
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                isCollapsed
                                                    ? Icons.keyboard_arrow_down
                                                    : Icons.keyboard_arrow_up,
                                                color:
                                                    theme.colorScheme.primary,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  '$typeName (${typeRooms.length})',
                                                  style: theme
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: theme
                                                            .colorScheme
                                                            .primary,
                                                      ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (allSelected) {
                                                      for (final r
                                                          in typeRooms) {
                                                        _selectedRoomIds.remove(
                                                          r.id,
                                                        );
                                                        _customRates.remove(
                                                          r.id,
                                                        );
                                                      }
                                                    } else {
                                                      for (final r
                                                          in typeRooms) {
                                                        _selectedRoomIds.add(
                                                          r.id,
                                                        );
                                                      }
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  allSelected
                                                      ? 'Deselect All'
                                                      : 'Select All',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (!isCollapsed) ...[
                                        const SizedBox(height: 8),
                                        GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 12,
                                                mainAxisSpacing: 12,
                                                childAspectRatio: 1.4,
                                              ),
                                          itemCount: typeRooms.length,
                                          itemBuilder: (context, idx) {
                                            final room = typeRooms[idx];
                                            final isSelected = _selectedRoomIds
                                                .contains(room.id);
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (isSelected) {
                                                    _selectedRoomIds.remove(
                                                      room.id,
                                                    );
                                                    _customRates.remove(
                                                      room.id,
                                                    );
                                                  } else {
                                                    _selectedRoomIds.add(
                                                      room.id,
                                                    );
                                                  }
                                                });
                                              },
                                              child: AnimatedContainer(
                                                duration: const Duration(
                                                  milliseconds: 200,
                                                ),
                                                padding: const EdgeInsets.all(
                                                  AppTheme.spacingMd,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  border: Border.all(
                                                    color: isSelected
                                                        ? theme
                                                              .colorScheme
                                                              .primary
                                                        : theme
                                                              .colorScheme
                                                              .outlineVariant,
                                                    width: isSelected ? 2 : 1,
                                                  ),
                                                  color: isSelected
                                                      ? theme
                                                            .colorScheme
                                                            .primaryContainer
                                                            .withValues(alpha: 0.15)
                                                      : theme
                                                            .colorScheme
                                                            .surface,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Room ${room.roomNumber}',
                                                        style: theme
                                                            .textTheme
                                                            .titleMedium
                                                            ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '₹${room.RoomType?.defaultPrice?.toStringAsFixed(0) ?? '0'}/night',
                                                          style: theme
                                                              .textTheme
                                                              .bodySmall
                                                              ?.copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        if (isRoomBooked(
                                                          room.id,
                                                        )) ...[
                                                          const SizedBox(
                                                            height: 4,
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal: 6,
                                                                  vertical: 2,
                                                                ),
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    6,
                                                                  ),
                                                              color: Colors
                                                                  .amber
                                                                  .shade50,
                                                              border: Border.all(
                                                                color: Colors
                                                                    .amber
                                                                    .shade200,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .warning_amber_rounded,
                                                                  size: 8,
                                                                  color: Colors
                                                                      .amber
                                                                      .shade800,
                                                                ),
                                                                const SizedBox(
                                                                  width: 4,
                                                                ),
                                                                Text(
                                                                  'ALREADY BOOKED',
                                                                  style: TextStyle(
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .amber
                                                                        .shade900,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                      const SizedBox(
                                        height: AppTheme.spacingMd,
                                      ),
                                    ],
                                  );
                                }),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: AppTheme.spacingMd),

                    // 3. Custom Rates Card (only Create mode + rooms selected)
                    if (!_isEdit && _selectedRoomIds.isNotEmpty) ...[
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(AppTheme.spacingMd),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CUSTOM RATES',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                              ..._selectedRoomIds.map((roomId) {
                                final room = rooms.firstWhere(
                                  (r) => r.id == roomId,
                                  orElse: () => rooms.first,
                                );
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: AppTheme.spacingMd,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Room ${room.roomNumber}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              room.RoomType?.name ?? '',
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: AppTheme.spacingMd),
                                      SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          initialValue:
                                              _customRates[roomId] ?? '',
                                          decoration: InputDecoration(
                                            labelText: 'Rate / Night',
                                            hintText:
                                                'Default: ₹${room.RoomType?.defaultPrice?.toStringAsFixed(0)}',
                                            prefixIcon: const Icon(
                                              Icons.currency_rupee,
                                              size: 16,
                                            ),
                                          ),
                                          keyboardType:
                                              const TextInputType.numberWithOptions(
                                                decimal: true,
                                              ),
                                          onChanged: (val) {
                                            _customRates[roomId] = val;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingMd),
                    ],

                    // 4. Guest Information Card
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppTheme.spacingMd),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GUEST INFORMATION',
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.primary,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: AppTheme.spacingMd),
                            if (!_isEdit) ...[
                              SegmentedButton<bool>(
                                segments: const [
                                  ButtonSegment<bool>(
                                    value: false,
                                    label: Text('Select Existing'),
                                    icon: Icon(Icons.people_outline, size: 16),
                                  ),
                                  ButtonSegment<bool>(
                                    value: true,
                                    label: Text('Create New Guest'),
                                    icon: Icon(
                                      Icons.person_add_alt_1_outlined,
                                      size: 16,
                                    ),
                                  ),
                                ],
                                selected: {_createNewGuest},
                                onSelectionChanged: (Set<bool> newSelection) {
                                  setState(() {
                                    _createNewGuest = newSelection.first;
                                  });
                                },
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                            ],
                            if (_isEdit)
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundColor: ext.surfaceContainerLow,
                                  child: const Icon(Icons.person),
                                ),
                                title: Text(
                                  widget.existingBooking!.Guest?.name ??
                                      'Guest',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  widget.existingBooking!.Guest?.phone ??
                                      'No Phone',
                                ),
                              )
                            else if (_createNewGuest) ...[
                              TextFormField(
                                controller: _guestNameController,
                                decoration: const InputDecoration(
                                  labelText: 'Full Name *',
                                  prefixIcon: Icon(Icons.person_outline),
                                ),
                                validator: (val) =>
                                    val == null || val.trim().isEmpty
                                    ? 'Enter full name'
                                    : null,
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                              TextFormField(
                                controller: _guestPhoneController,
                                decoration: const InputDecoration(
                                  labelText: 'Phone Number *',
                                  prefixIcon: Icon(Icons.phone_outlined),
                                ),
                                keyboardType: TextInputType.phone,
                                validator: (val) =>
                                    val == null || val.trim().isEmpty
                                    ? 'Enter phone number'
                                    : null,
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                              TextFormField(
                                controller: _guestEmailController,
                                decoration: const InputDecoration(
                                  labelText: 'Email Address',
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                              TextFormField(
                                controller: _guestAddressController,
                                decoration: const InputDecoration(
                                  labelText: 'Address',
                                  prefixIcon: Icon(Icons.location_on_outlined),
                                ),
                                maxLines: 2,
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                              DropdownButtonFormField<String>(
                                initialValue: _guestIdProofType,
                                decoration: const InputDecoration(
                                  labelText: 'ID Proof Type',
                                  prefixIcon: Icon(Icons.badge_outlined),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'AADHAAR',
                                    child: Text('Aadhaar Card'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'PAN',
                                    child: Text('PAN Card'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'PASSPORT',
                                    child: Text('Passport'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'DRIVING_LICENSE',
                                    child: Text('Driving License'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'VOTER_ID',
                                    child: Text('Voter ID'),
                                  ),
                                ],
                                onChanged: (val) {
                                  setState(() {
                                    _guestIdProofType = val;
                                  });
                                },
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                              TextFormField(
                                controller: _guestIdProofNumberController,
                                decoration: const InputDecoration(
                                  labelText: 'ID Proof Number',
                                  prefixIcon: Icon(Icons.fingerprint),
                                ),
                              ),
                            ] else ...[
                              guestsAsync.when(
                                loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                error: (err, _) =>
                                    Text('Error loading guests: $err'),
                                data: (guests) {
                                  if (guests.isEmpty) {
                                    return const Text(
                                      'No guests found. Please create one.',
                                    );
                                  }
                                  final Query$GetGuests$guests? initialGuest =
                                      _selectedGuestId != null
                                      ? guests.firstWhere(
                                          (g) => g.id == _selectedGuestId,
                                        )
                                      : null;

                                  return Autocomplete<Query$GetGuests$guests>(
                                    displayStringForOption: (g) =>
                                        '${g.name} (${g.phone ?? ''})',
                                    initialValue: initialGuest != null
                                        ? TextEditingValue(
                                            text:
                                                '${initialGuest.name} (${initialGuest.phone ?? ''})',
                                          )
                                        : null,
                                    optionsBuilder:
                                        (TextEditingValue textEditingValue) {
                                          if (textEditingValue.text.isEmpty) {
                                            return guests;
                                          }
                                          final query = textEditingValue.text
                                              .toLowerCase();
                                          return guests.where((g) {
                                            return g.name
                                                    .toLowerCase()
                                                    .contains(query) ||
                                                (g.phone?.contains(query) ??
                                                    false);
                                          });
                                        },
                                    onSelected: (g) {
                                      setState(() {
                                        _selectedGuestId = g.id;
                                      });
                                    },
                                    fieldViewBuilder:
                                        (
                                          context,
                                          controller,
                                          focusNode,
                                          onSubmitted,
                                        ) {
                                          return TextFormField(
                                            controller: controller,
                                            focusNode: focusNode,
                                            decoration: InputDecoration(
                                              labelText: 'Select Guest *',
                                              prefixIcon: const Icon(
                                                Icons.search,
                                              ),
                                              suffixIcon:
                                                  _selectedGuestId == null
                                                  ? null
                                                  : IconButton(
                                                      icon: const Icon(
                                                        Icons.close,
                                                      ),
                                                      onPressed: () {
                                                        controller.clear();
                                                        setState(() {
                                                          _selectedGuestId =
                                                              null;
                                                        });
                                                      },
                                                    ),
                                            ),
                                            onChanged: (val) {
                                              if (val.isEmpty) {
                                                setState(() {
                                                  _selectedGuestId = null;
                                                });
                                              }
                                            },
                                            validator: (val) {
                                              if (_selectedGuestId == null) {
                                                return 'Please select a guest';
                                              }
                                              return null;
                                            },
                                          );
                                        },
                                    optionsViewBuilder:
                                        (context, onSelected, options) {
                                          return Align(
                                            alignment: Alignment.topLeft,
                                            child: Material(
                                              elevation: 8,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              clipBehavior: Clip.antiAlias,
                                              child: Container(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width -
                                                    48,
                                                constraints:
                                                    const BoxConstraints(
                                                      maxHeight: 250,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color:
                                                      theme.colorScheme.surface,
                                                  border: Border.all(
                                                    color: theme
                                                        .colorScheme
                                                        .outlineVariant,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  itemCount: options.length,
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const Divider(
                                                            height: 1,
                                                          ),
                                                  itemBuilder: (context, index) {
                                                    final guest = options
                                                        .elementAt(index);
                                                    return ListTile(
                                                      leading: const CircleAvatar(
                                                        child: Icon(
                                                          Icons.person_outline,
                                                          size: 18,
                                                        ),
                                                      ),
                                                      title: Text(
                                                        guest.name,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        guest.phone ??
                                                            'No Phone',
                                                      ),
                                                      onTap: () =>
                                                          onSelected(guest),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                  );
                                },
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingMd),

                    // 5. Guest Count & Notes Card
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppTheme.spacingMd),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GUEST COUNT & NOTES',
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.primary,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: AppTheme.spacingMd),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _adultsController,
                                    decoration: const InputDecoration(
                                      labelText: 'Adults *',
                                      prefixIcon: Icon(Icons.group_outlined),
                                    ),
                                    keyboardType: TextInputType.number,
                                    validator: (val) =>
                                        val == null || val.trim().isEmpty
                                        ? 'Required'
                                        : null,
                                  ),
                                ),
                                const SizedBox(width: AppTheme.spacingMd),
                                Expanded(
                                  child: TextFormField(
                                    controller: _childrenController,
                                    decoration: const InputDecoration(
                                      labelText: 'Children',
                                      prefixIcon: Icon(
                                        Icons.child_care_outlined,
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppTheme.spacingMd),
                            TextFormField(
                              controller: _notesController,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                labelText: 'Special Notes / Preferences',
                                alignLabelWithHint: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingMd),

                    // 6. Payments / Status Card
                    if (!_isEdit)
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(AppTheme.spacingMd),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PAYMENT INFORMATION',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                              TextFormField(
                                controller: _advanceAmountController,
                                decoration: const InputDecoration(
                                  labelText: 'Advance Payment Amount',
                                  prefixIcon: Icon(Icons.payment),
                                ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                              DropdownButtonFormField<String>(
                                initialValue: _advanceMethod,
                                decoration: const InputDecoration(
                                  labelText: 'Payment Method',
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'CASH',
                                    child: Text('Cash'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'CARD',
                                    child: Text('Card'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'UPI',
                                    child: Text('UPI / QR'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'BANK_TRANSFER',
                                    child: Text('Bank Transfer'),
                                  ),
                                ],
                                onChanged: (val) {
                                  if (val != null) {
                                    setState(() {
                                      _advanceMethod = val;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(AppTheme.spacingMd),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'BOOKING STATUS',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                              DropdownButtonFormField<Enum$BookingStatus>(
                                initialValue: _status,
                                decoration: const InputDecoration(
                                  labelText: 'Status',
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: Enum$BookingStatus.CONFIRMED,
                                    child: Text('Confirmed'),
                                  ),
                                  DropdownMenuItem(
                                    value: Enum$BookingStatus.CHECKED_IN,
                                    child: Text('Checked In'),
                                  ),
                                  DropdownMenuItem(
                                    value: Enum$BookingStatus.CHECKED_OUT,
                                    child: Text('Checked Out'),
                                  ),
                                  DropdownMenuItem(
                                    value: Enum$BookingStatus.CANCELLED,
                                    child: Text('Cancelled'),
                                  ),
                                ],
                                onChanged: (val) {
                                  if (val != null) {
                                    setState(() {
                                      _status = val;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: AppTheme.spacingXl),
                  ],
                ),
              ),
            ),
    );
  }
}
