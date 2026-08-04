import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pms_admin/core/theme/app_theme.dart';
import 'package:pms_admin/core/utils/invoice_generator.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_controller.dart';
import 'package:pms_admin/features/bookings/presentation/bookings_controller.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

class BookingDetailsScreen extends ConsumerStatefulWidget {
  final Query$GetBookings$bookings booking;

  const BookingDetailsScreen({super.key, required this.booking});

  @override
  ConsumerState<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
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
    final success = await ref.read(bookingsControllerProvider.notifier).updateBooking(
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
        SnackBar(content: Text('Booking status updated to ${_getStatusLabel(status)}')),
      );
    }
  }

  Future<void> _cancelBooking() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Booking'),
        content: const Text('Are you sure you want to cancel this booking? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Go Back'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Cancel Booking', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      setState(() => _isLoading = true);
      final success = await ref.read(bookingsControllerProvider.notifier).cancelBooking(widget.booking.id);
      setState(() => _isLoading = false);

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Booking cancelled successfully')),
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
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: paymentMethod,
                decoration: const InputDecoration(labelText: 'Payment Method'),
                items: const [
                  DropdownMenuItem(value: 'CASH', child: Text('Cash')),
                  DropdownMenuItem(value: 'CARD', child: Text('Card')),
                  DropdownMenuItem(value: 'UPI', child: Text('UPI / QR')),
                  DropdownMenuItem(value: 'BANK_TRANSFER', child: Text('Bank Transfer')),
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
                          const SnackBar(content: Text('Payment recorded successfully')),
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to share invoice: $e')),
        );
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

    // Calculate billing
    final totalAmount = booking.totalAmount ?? 0.0;
    final totalPaid = (booking.Payment ?? [])
        .where((p) => p != null && p.status == Enum$PaymentStatus.PAID)
        .fold<double>(0.0, (sum, p) => sum + (p?.amount ?? 0.0));
    final balanceDue = totalAmount - totalPaid;
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
          if (booking.status != Enum$BookingStatus.CANCELLED && selectedProperty != null)
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
                      side: BorderSide(color: statusColor.withValues(alpha: 0.3), width: 1),
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
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: statusColor.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(AppTheme.radiusSm),
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
                                  icon: const Icon(Icons.call, color: Colors.blue),
                                  onPressed: () async {
                                    final uri = Uri.parse('tel:${booking.Guest!.phone}');
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
                            _buildInfoRow(Icons.phone_outlined, 'Phone', booking.Guest!.phone!, ext),
                            const SizedBox(height: 6),
                          ],
                          if (booking.Guest?.email != null) ...[
                            _buildInfoRow(Icons.email_outlined, 'Email', booking.Guest!.email!, ext),
                            const SizedBox(height: 6),
                          ],
                          if (booking.Guest?.address != null) ...[
                            _buildInfoRow(Icons.location_on_outlined, 'Address', booking.Guest!.address!, ext),
                            const SizedBox(height: 6),
                          ],
                          if (booking.Guest?.gstin != null) ...[
                            _buildInfoRow(Icons.receipt_long_outlined, 'GSTIN', booking.Guest!.gstin!, ext),
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
                          Text(
                            'STAY DETAILS',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: ext.textMuted,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildDateBlock('CHECK-IN', checkIn, ext),
                              Column(
                                children: [
                                  const Icon(Icons.arrow_forward, color: Colors.grey, size: 16),
                                  const SizedBox(height: 2),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.surfaceContainerHighest,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      '$nights Nights',
                                      style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
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
                          if (booking.BookingRoom == null || booking.BookingRoom!.isEmpty)
                            Text('No rooms assigned yet', style: theme.textTheme.bodySmall?.copyWith(color: ext.textMuted))
                          else
                            ...booking.BookingRoom!.map((br) {
                              if (br == null) return const SizedBox.shrink();
                              return Container(
                                margin: const EdgeInsets.only(bottom: 6),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: ext.borderLight, width: 0.5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.bed, size: 16, color: Colors.blue),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Room ${br.Room?.roomNumber ?? 'TBD'}',
                                          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          '(${br.RoomType?.name ?? 'Standard'})',
                                          style: theme.textTheme.bodySmall?.copyWith(color: ext.textMuted),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '₹${(br.priceOverride ?? br.RoomType?.defaultPrice ?? 0.0).toStringAsFixed(0)} / night',
                                      style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
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
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: isPaid ? Colors.green.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  isPaid ? 'PAID' : 'PENDING',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: isPaid ? Colors.green : Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          _buildBillingRow('Total Booking Amount', totalAmount, theme, ext, isBold: true),
                          const SizedBox(height: 6),
                          _buildBillingRow('Total Amount Paid', totalPaid, theme, ext, color: Colors.green),
                          const SizedBox(height: 6),
                          _buildBillingRow('Balance Due', balanceDue, theme, ext, color: balanceDue > 0 ? Colors.red : Colors.green, isBold: true),
                          
                          const SizedBox(height: 16),
                          if (balanceDue > 0 && booking.status != Enum$BookingStatus.CANCELLED)
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.add_card),
                                label: const Text('Record Payment'),
                                onPressed: () => _showRecordPaymentDialog(context, totalAmount, totalPaid),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                            ),

                          // Payments Log
                          if (booking.Payment != null && booking.Payment!.any((p) => p != null)) ...[
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
                                    border: Border(bottom: BorderSide(color: ext.borderLight)),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6),
                                      child: Text('DATE', style: theme.textTheme.labelSmall?.copyWith(color: ext.textMuted)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6),
                                      child: Text('METHOD', style: theme.textTheme.labelSmall?.copyWith(color: ext.textMuted)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6),
                                      child: Text('AMOUNT', style: theme.textTheme.labelSmall?.copyWith(color: ext.textMuted), textAlign: TextAlign.right),
                                    ),
                                  ],
                                ),
                                ...booking.Payment!.map((p) {
                                  if (p == null) return const TableRow(children: [SizedBox(), SizedBox(), SizedBox()]);
                                  final pDate = p.createdAt != null
                                      ? DateFormat('dd MMM hh:mm a').format(DateTime.parse(p.createdAt!).toLocal())
                                      : 'TBD';
                                  return TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 6),
                                        child: Text(pDate, style: theme.textTheme.bodySmall),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 6),
                                        child: Text(p.method, style: theme.textTheme.bodySmall),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 6),
                                        child: Text('₹${p.amount.toStringAsFixed(0)}', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.right),
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
                            if (booking.status == Enum$BookingStatus.CONFIRMED) ...[
                              ElevatedButton.icon(
                                icon: const Icon(Icons.login),
                                label: const Text('Check In Guest'),
                                onPressed: () => _updateStatus(Enum$BookingStatus.CHECKED_IN),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                            if (booking.status == Enum$BookingStatus.CHECKED_IN) ...[
                              ElevatedButton.icon(
                                icon: const Icon(Icons.logout),
                                label: const Text('Check Out Guest'),
                                onPressed: () => _updateStatus(Enum$BookingStatus.CHECKED_OUT),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[700],
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                            if (booking.status == Enum$BookingStatus.CONFIRMED)
                              OutlinedButton.icon(
                                icon: const Icon(Icons.cancel_outlined, color: Colors.red),
                                label: const Text('Cancel Booking', style: TextStyle(color: Colors.red)),
                                onPressed: _cancelBooking,
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  side: const BorderSide(color: Colors.red),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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

  Widget _buildInfoRow(IconData icon, String label, String value, AppColorsExtension ext) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: ext.textMuted),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: theme.textTheme.bodySmall?.copyWith(color: ext.textMuted, fontWeight: FontWeight.bold),
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
          style: theme.textTheme.labelSmall?.copyWith(color: ext.textMuted, fontWeight: FontWeight.bold, fontSize: 8),
        ),
        const SizedBox(height: 2),
        Text(
          DateFormat('dd MMM yyyy').format(date),
          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900),
        ),
        Text(
          DateFormat('EEEE, hh:mm a').format(date),
          style: theme.textTheme.labelSmall?.copyWith(color: ext.textMuted, fontSize: 9),
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
