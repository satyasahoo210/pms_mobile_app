import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pms_admin/core/theme/app_theme.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';
import 'package:pms_admin/features/bookings/presentation/bookings_controller.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

class BookingsListScreen extends ConsumerStatefulWidget {
  final String? tab;
  const BookingsListScreen({super.key, this.tab = 'ALL'});

  @override
  ConsumerState<BookingsListScreen> createState() => _BookingsListScreenState();
}

class _BookingsListScreenState extends ConsumerState<BookingsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedStatus = 'ALL';

  @override
  void initState() {
    super.initState();
    if ([
      'ALL',
      'CONFIRMED',
      'CHECKED_IN',
      'CHECKED_OUT',
      'CANCELLED',
    ].contains(widget.tab)) {
      _selectedStatus = widget.tab ?? 'ALL';
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Query$GetBookings$bookings> _filterBookings(
    List<Query$GetBookings$bookings> bookings,
  ) {
    return bookings.where((b) {
      // 1. Filter by Status
      if (_selectedStatus != 'ALL') {
        final statusStr = b.status?.name ?? 'CONFIRMED';
        if (statusStr != _selectedStatus) return false;
      }

      // 2. Filter by Search Query
      if (_searchQuery.isNotEmpty) {
        final query = _searchQuery.toLowerCase();
        final guestName = b.Guest?.name.toLowerCase() ?? '';
        final guestPhone = b.Guest?.phone?.toLowerCase() ?? '';
        final bookingId = b.id.toLowerCase();
        final shortId = b.id.toLowerCase().substring(0, 8);

        final matchesGuest =
            guestName.contains(query) || guestPhone.contains(query);
        final matchesId = bookingId.contains(query) || shortId.contains(query);

        // Check if matches any assigned room number
        final rooms = b.BookingRoom ?? [];
        final matchesRoom = rooms.any(
          (br) => br?.Room?.roomNumber.toLowerCase().contains(query) ?? false,
        );

        if (!matchesGuest && !matchesId && !matchesRoom) return false;
      }

      return true;
    }).toList();
  }

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;
    final bookingsAsync = ref.watch(bookingsListProvider);
    final selectedProperty = ref.watch(selectedPropertyProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BOOKINGS LIST',
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
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Search & Filter Header
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingMd),
            child: Column(
              children: [
                // Search Bar
                TextField(
                  controller: _searchController,
                  onChanged: (val) => setState(() => _searchQuery = val),
                  decoration: InputDecoration(
                    hintText: 'Search by Guest Name, Phone, Room or ID...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _searchQuery = '');
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
                const SizedBox(height: 12),

                // Horizontal Badges list for Status Filter
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildStatusFilterChip('ALL', 'All Bookings'),
                      const SizedBox(width: 8),
                      _buildStatusFilterChip('CONFIRMED', 'Confirmed'),
                      const SizedBox(width: 8),
                      _buildStatusFilterChip('CHECKED_IN', 'Checked In'),
                      const SizedBox(width: 8),
                      _buildStatusFilterChip('CHECKED_OUT', 'Checked Out'),
                      const SizedBox(width: 8),
                      _buildStatusFilterChip('CANCELLED', 'Cancelled'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bookings List content
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => ref.refresh(bookingsListProvider.future),
              child: bookingsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) =>
                    Center(child: Text('Error loading bookings: $err')),
                data: (bookings) {
                  final filteredBookings = _filterBookings(bookings);

                  if (filteredBookings.isEmpty) {
                    return ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.book_outlined,
                                size: 64,
                                color: ext.textMuted,
                              ),
                              const SizedBox(height: AppTheme.spacingMd),
                              Text(
                                'No bookings found',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ext.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Try resetting your search query or status filter',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: ext.textMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.spacingMd,
                    ),
                    itemCount: filteredBookings.length,
                    itemBuilder: (context, index) {
                      final b = filteredBookings[index];
                      return _buildBookingCard(context, b, ext);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/bookings'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatusFilterChip(String value, String label) {
    final theme = Theme.of(context);
    final isSelected = _selectedStatus == value;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() => _selectedStatus = value);
        }
      },
      labelStyle: theme.textTheme.bodySmall?.copyWith(
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        color: isSelected
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onSurfaceVariant,
      ),
      selectedColor: theme.colorScheme.primary,
      backgroundColor: theme.colorScheme.surfaceContainerHighest.withValues(
        alpha: 0.3,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      showCheckmark: false,
    );
  }

  Widget _buildBookingCard(
    BuildContext context,
    Query$GetBookings$bookings b,
    AppColorsExtension ext,
  ) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor(b.status);
    final statusLabel = _getStatusLabel(b.status);

    final checkIn = DateTime.parse(b.checkInDate).toLocal();
    final checkOut = DateTime.parse(b.checkOutDate).toLocal();
    final nights = checkOut.difference(checkIn).inDays;

    final roomInfo = b.BookingRoom != null && b.BookingRoom!.isNotEmpty
        ? b.BookingRoom!
              .map((br) {
                final roomNum = br?.Room?.roomNumber ?? 'TBD';
                final roomType = br?.RoomType?.name ?? 'Standard';
                return 'Room $roomNum ($roomType)';
              })
              .join(', ')
        : 'Unassigned';

    // Calculate payment status
    final totalAmount = b.totalAmount ?? 0.0;
    final totalPaid = (b.Payment ?? [])
        .where((p) => p != null && p.status == Enum$PaymentStatus.PAID)
        .fold<double>(0.0, (sum, p) => sum + (p?.amount ?? 0.0));

    final isPaid = totalPaid >= totalAmount;
    final paymentStatusLabel = isPaid
        ? 'Paid'
        : totalPaid > 0
        ? 'Partial'
        : 'Unpaid';
    final paymentColor = isPaid
        ? Colors.green
        : totalPaid > 0
        ? Colors.orange
        : Colors.red;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: InkWell(
        onTap: () => context.push('/bookings/details', extra: b),
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card Header: Guest & Status Badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      b.Guest?.name ?? 'Guest Name',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ext.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                      border: Border.all(color: statusColor, width: 0.5),
                    ),
                    child: Text(
                      statusLabel.toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Date Range & Duration
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: ext.textMuted),
                  const SizedBox(width: 6),
                  Text(
                    '${DateFormat('dd MMM').format(checkIn)} - ${DateFormat('dd MMM yyyy').format(checkOut)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: ext.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 1.5,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '$nights night${nights == 1 ? "" : "s"}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: ext.textMuted,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // Room Assignments
              Row(
                children: [
                  Icon(Icons.bed_outlined, size: 14, color: ext.textMuted),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      roomInfo,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: ext.textMuted,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              const Divider(height: 20),

              // Card Footer: Invoice short ID, Pricing & Payment Badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#${b.id.toUpperCase().substring(0, 8)}',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: ext.textMuted,
                      fontSize: 10,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: paymentColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusSm,
                          ),
                        ),
                        child: Text(
                          paymentStatusLabel.toUpperCase(),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: paymentColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 8,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'INR ${totalAmount.toStringAsFixed(2)}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
