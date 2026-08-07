import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pms_admin/graphql/queries/dashboard.graphql.dart';
import 'package:pms_admin/graphql/schema.graphql.dart';

int differenceInCalendarDays(DateTime checkOut, DateTime checkIn) {
  final checkOutDate = DateTime(checkOut.year, checkOut.month, checkOut.day);
  final checkInDate = DateTime(checkIn.year, checkIn.month, checkIn.day);
  return checkOutDate.difference(checkInDate).inDays;
}

String amountToWords(double amount) {
  if (amount == 0) return 'Zero Rupees Only';

  final List<String> a = [
    '',
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten',
    'Eleven',
    'Twelve',
    'Thirteen',
    'Fourteen',
    'Fifteen',
    'Sixteen',
    'Seventeen',
    'Eighteen',
    'Nineteen',
  ];

  final List<String> b = [
    '',
    '',
    'Twenty',
    'Thirty',
    'Forty',
    'Fifty',
    'Sixty',
    'Seventy',
    'Eighty',
    'Ninety',
  ];

  int numVal = amount.floor();
  if (numVal.toString().length > 9) return 'Amount too large';

  String paddedStr = numVal.toString().padLeft(9, '0');

  final crore = int.parse(paddedStr.substring(0, 2));
  final lakh = int.parse(paddedStr.substring(2, 4));
  final thousand = int.parse(paddedStr.substring(4, 6));
  final hundred = int.parse(paddedStr.substring(6, 7));
  final units = int.parse(paddedStr.substring(7, 9));

  String getGroupText(int n) {
    if (n == 0) return '';
    if (n < 20) return a[n];
    final tens = n ~/ 10;
    final ones = n % 10;
    return b[tens] + (ones != 0 ? ' ${a[ones]}' : '');
  }

  String str = '';
  if (crore != 0) str += '${getGroupText(crore)} Crore ';
  if (lakh != 0) str += '${getGroupText(lakh)} Lakh ';
  if (thousand != 0) str += '${getGroupText(thousand)} Thousand ';
  if (hundred != 0) str += '${getGroupText(hundred)} Hundred ';
  if (units != 0) {
    str += (str.isNotEmpty ? 'and ' : '') + getGroupText(units);
  }

  return '${str.trim()} Rupees Only';
}

class InvoiceTotals {
  final int nights;
  final double roomTotal;
  final double serviceTotal;
  final double subtotal;
  final double discount;
  final double tax;
  final double total;
  final double totalPaid;
  final double balance;

  InvoiceTotals({
    required this.nights,
    required this.roomTotal,
    required this.serviceTotal,
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.total,
    required this.totalPaid,
    required this.balance,
  });
}

InvoiceTotals calculateBookingInvoiceTotals(
  Query$GetBookings$bookings booking,
  Query$GetProperties$properties property,
) {
  final checkIn = DateTime.parse(booking.checkInDate).toLocal();
  final checkOut = DateTime.parse(booking.checkOutDate).toLocal();

  int nights = differenceInCalendarDays(checkOut, checkIn);
  final checkOutTimeStr = DateFormat('HH:mm:ss').format(checkOut);

  Map<String, dynamic>? settings;
  if (property.settings != null) {
    try {
      settings = jsonDecode(property.settings!) as Map<String, dynamic>;
    } catch (_) {}
  }

  String propCheckOutTime = settings?['checkoutTime'] ?? '07:00:00';
  if (propCheckOutTime.split(':').length == 2) {
    propCheckOutTime = '$propCheckOutTime:00';
  }

  if (checkOutTimeStr.compareTo(propCheckOutTime) > 0) {
    nights += 1;
  }

  nights = math.max(1, nights);

  final roomCharges = booking.BookingRoom ?? [];
  double roomSubtotal = 0.0;
  for (final a in roomCharges) {
    if (a == null) continue;
    roomSubtotal += a.priceOverride ?? a.RoomType?.defaultPrice ?? 0.0;
  }

  final double totalRoomCharges = roomSubtotal * nights;
  double serviceSubtotal = 0.0;
  for (final s in booking.BookingService ?? []) {
    if (s != null) {
      serviceSubtotal += s.totalPrice;
    }
  }

  final double subtotal = totalRoomCharges + serviceSubtotal;

  double discountAmount = 0.0;
  if (booking.discountType == 'PERCENTAGE') {
    discountAmount = (subtotal * (booking.discountAmount ?? 0.0)) / 100;
  } else if (booking.discountType == 'FIXED') {
    discountAmount = booking.discountAmount ?? 0.0;
  }

  final double taxPercentage = property.taxPercentage ?? 0.0;
  final double taxRate = taxPercentage / 100;
  final double tax = (subtotal - discountAmount) * taxRate;

  final double grandTotal = subtotal - discountAmount + tax;

  final payments = booking.Payment ?? [];
  double totalPaid = 0.0;
  for (final p in payments) {
    if (p == null) continue;
    if (p.status == Enum$PaymentStatus.REFUNDED) {
      totalPaid -= p.amount;
    } else {
      totalPaid += p.amount;
    }
  }

  return InvoiceTotals(
    nights: nights,
    roomTotal: totalRoomCharges,
    serviceTotal: serviceSubtotal,
    subtotal: subtotal,
    discount: discountAmount,
    tax: tax,
    total: grandTotal,
    totalPaid: totalPaid,
    balance: grandTotal - totalPaid > 0 ? grandTotal - totalPaid : 0.0,
  );
}

Future<pw.Document> generateInvoicePDF({
  required Query$GetBookings$bookings booking,
  required Query$GetProperties$properties property,
}) async {
  final pdf = pw.Document();

  final checkIn = DateTime.parse(booking.checkInDate).toLocal();
  final checkOut = DateTime.parse(booking.checkOutDate).toLocal();
  final totals = calculateBookingInvoiceTotals(booking, property);

  // Load logo image
  final logoBytes = await rootBundle.load('assets/images/logo_large.png');
  final logoImage = pw.MemoryImage(logoBytes.buffer.asUint8List());

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(30),
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            // --- Header Block ---
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Image(
                  logoImage,
                  height: 60,
                  width: 160,
                  fit: pw.BoxFit.contain,
                ),
              ],
            ),
            pw.SizedBox(height: 15),
            pw.Center(
              child: pw.Text(
                property.name.toUpperCase(),
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColor.fromHex('#1e293b'),
                ),
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Center(
              child: pw.Text(
                property.address,
                style: pw.TextStyle(
                  fontSize: 9,
                  color: PdfColor.fromHex('#475569'),
                ),
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Center(
              child: pw.Text(
                [
                  if (property.phone != null) 'Ph: ${property.phone}',
                  if (property.email != null) 'Email: ${property.email}',
                ].join(' | '),
                style: pw.TextStyle(
                  fontSize: 9,
                  color: PdfColor.fromHex('#475569'),
                ),
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Divider(color: PdfColor.fromHex('#e2e8f0')),
            pw.SizedBox(height: 5),

            // INVOICE label
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'INVOICE',
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromHex('#1e293b'),
                  ),
                ),
                pw.Text(
                  'DATE: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                  style: pw.TextStyle(
                    fontSize: 10,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 10),

            // --- Booking Guest Details ---
            pw.Container(
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                color: PdfColor.fromHex('#f8fafc'),
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
              ),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow(
                          'Guest Name:',
                          booking.Guest?.name ?? 'Guest',
                        ),
                        if (booking.Guest?.gstin != null &&
                            booking.Guest!.gstin!.isNotEmpty)
                          _buildDetailRow('GSTIN:', booking.Guest!.gstin!),
                        _buildDetailRow(
                          'Phone:',
                          booking.Guest?.phone ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Address:',
                          booking.Guest?.address ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Guests:',
                          '${booking.adults ?? 0} Adults, ${booking.children ?? 0} Children',
                        ),
                        _buildDetailRow(
                          'Total Rooms:',
                          '${booking.BookingRoom?.length ?? 0}',
                        ),
                      ],
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow(
                          'Invoice ID:',
                          '#${booking.id.toUpperCase().substring(0, 8)}',
                        ),
                        _buildDetailRow('Channel:', 'Direct'),
                        _buildDetailRow(
                          'Check-In:',
                          DateFormat('dd MMM yyyy, hh:mm a').format(checkIn),
                        ),
                        _buildDetailRow(
                          'Check-Out:',
                          DateFormat('dd MMM yyyy, hh:mm a').format(checkOut),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 15),

            // --- Charges & Services ---
            pw.Text(
              'CHARGES & SERVICES',
              style: pw.TextStyle(
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
                color: PdfColor.fromHex('#1e293b'),
              ),
            ),
            pw.SizedBox(height: 5),

            // Table of Charges
            pw.Table(
              border: pw.TableBorder.all(
                color: PdfColor.fromHex('#e2e8f0'),
                width: 0.5,
              ),
              children: [
                // Head
                pw.TableRow(
                  decoration: pw.BoxDecoration(
                    color: PdfColor.fromHex('#f1f5f9'),
                  ),
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(
                        'Description',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 8,
                        ),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Align(
                        alignment: pw.Alignment.centerRight,
                        child: pw.Text(
                          'Amount',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Body rows for rooms
                ...(booking.BookingRoom ?? []).map((a) {
                  if (a == null) {
                    return pw.TableRow(
                      children: [pw.Container(), pw.Container()],
                    );
                  }
                  final roomNights = totals.nights;
                  final roomNum = a.Room?.roomNumber ?? 'N/A';
                  final roomType = a.RoomType?.name ?? 'Standard';
                  final rate =
                      a.priceOverride ?? a.RoomType?.defaultPrice ?? 0.0;
                  final total = rate * roomNights;
                  final datesStr =
                      '${DateFormat('dd MMM yyyy').format(checkIn)} - ${DateFormat('dd MMM yyyy').format(checkOut)}';

                  return pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text(
                          'Room $roomNum ($roomType) - $roomNights Night(s) [$datesStr] @ INR ${rate.toStringAsFixed(2)}/night',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(
                            'INR ${total.toStringAsFixed(2)}',
                            style: const pw.TextStyle(fontSize: 8),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                ...(booking.BookingService ?? []).map((s) {
                  if (s == null) {
                    return pw.TableRow(
                      children: [pw.Container(), pw.Container()],
                    );
                  }
                  final serviceName = s.Service?.name ?? 'Service';
                  final qty = s.quantity;
                  final unitPrice = s.Service?.price ?? 0.0;
                  final total = s.totalPrice;

                  return pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text(
                          '$serviceName x $qty @ INR ${unitPrice.toStringAsFixed(2)}',
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(
                            'INR ${total.toStringAsFixed(2)}',
                            style: const pw.TextStyle(fontSize: 8),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
            pw.SizedBox(height: 15),

            // --- Totals Section ---
            pw.Container(
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                color: PdfColor.fromHex('#f8fafc'),
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
              ),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Amount in Words
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Amount in Words:',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 8,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          amountToWords(totals.total),
                          style: const pw.TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                  // Totals breakdown
                  pw.Container(
                    width: 180,
                    child: pw.Column(
                      children: [
                        _buildTotalRow('Sub Total:', totals.subtotal),
                        if (totals.discount > 0)
                          _buildTotalRow('Discount:', -totals.discount),
                        if (totals.tax > 0)
                          _buildTotalRow(
                            'Tax (${property.taxPercentage}%):',
                            totals.tax,
                          ),
                        pw.Divider(
                          color: PdfColor.fromHex('#cbd5e1'),
                          thickness: 0.5,
                        ),
                        _buildTotalRow(
                          'Grand Total:',
                          totals.total,
                          isBold: true,
                        ),
                        _buildTotalRow('Paid Amount:', totals.totalPaid),
                        if (totals.balance > 0)
                          _buildTotalRow(
                            'Balance Due:',
                            totals.balance,
                            isBold: true,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 15),

            // --- Payment Breakup ---
            if (booking.Payment != null && booking.Payment!.isNotEmpty) ...[
              pw.Text(
                'PAYMENT BREAKUP',
                style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColor.fromHex('#1e293b'),
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Table(
                border: pw.TableBorder.all(
                  color: PdfColor.fromHex('#cbd5e1'),
                  width: 0.5,
                ),
                children: [
                  pw.TableRow(
                    decoration: pw.BoxDecoration(
                      color: PdfColor.fromHex('#f1f5f9'),
                    ),
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Date & Time',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 7,
                          ),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Payment Mode',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 7,
                          ),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Text(
                          'Reference ID',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 7,
                          ),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(4),
                        child: pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(
                            'Amount',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 7,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...booking.Payment!.map((p) {
                    if (p == null) {
                      return pw.TableRow(
                        children: [
                          pw.Container(),
                          pw.Container(),
                          pw.Container(),
                          pw.Container(),
                        ],
                      );
                    }
                    final dateStr = p.createdAt != null
                        ? DateFormat(
                            'dd MMM yyyy, hh:mm a',
                          ).format(DateTime.parse(p.createdAt!).toLocal())
                        : 'N/A';
                    final isRefunded = p.status == Enum$PaymentStatus.REFUNDED;
                    final modeStr = isRefunded
                        ? 'Refund (${p.method})'
                        : p.method;
                    final amtPrefix = isRefunded ? '- ' : '';

                    return pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Text(
                            dateStr,
                            style: const pw.TextStyle(fontSize: 7),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Text(
                            modeStr,
                            style: const pw.TextStyle(fontSize: 7),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Text(
                            '#${p.id.toUpperCase().substring(0, 8)}',
                            style: const pw.TextStyle(fontSize: 7),
                          ),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Align(
                            alignment: pw.Alignment.centerRight,
                            child: pw.Text(
                              '${amtPrefix}INR ${p.amount.toStringAsFixed(2)}',
                              style: const pw.TextStyle(fontSize: 7),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ],
            pw.Spacer(),
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Text(
                'TravelsPuri13 v1.2',
                style: pw.TextStyle(
                  fontSize: 8,
                  fontStyle: pw.FontStyle.italic,
                  color: PdfColor.fromHex('#94a3b8'),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );

  return pdf;
}

pw.Widget _buildDetailRow(String label, String value) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(vertical: 2),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: 70,
          child: pw.Text(
            label,
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 8,
              color: PdfColor.fromHex('#64748b'),
            ),
          ),
        ),
        pw.Expanded(
          child: pw.Text(
            value,
            style: pw.TextStyle(
              fontSize: 8,
              color: PdfColor.fromHex('#1e293b'),
            ),
          ),
        ),
      ],
    ),
  );
}

pw.Widget _buildTotalRow(String label, double value, {bool isBold = false}) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(vertical: 2),
    child: pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(
            fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
            fontSize: 8,
            color: isBold
                ? PdfColor.fromHex('#000000')
                : PdfColor.fromHex('#475569'),
          ),
        ),
        pw.Text(
          'INR ${value.toStringAsFixed(2)}',
          style: pw.TextStyle(
            fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
            fontSize: 8,
            color: isBold
                ? PdfColor.fromHex('#000000')
                : PdfColor.fromHex('#475569'),
          ),
        ),
      ],
    ),
  );
}

Future<void> shareInvoiceViaWhatsApp({
  required Query$GetBookings$bookings booking,
  required Query$GetProperties$properties property,
}) async {
  final pdf = await generateInvoicePDF(booking: booking, property: property);

  final output = await getTemporaryDirectory();
  final fileName =
      'Invoice_${booking.id.substring(0, 8)}_${(booking.Guest?.name ?? 'Guest').replaceAll(' ', '_')}.pdf';
  final file = File('${output.path}/$fileName');
  await file.writeAsBytes(await pdf.save());

  final shareText =
      'Here is your invoice for booking #${booking.id.substring(0, 8)} at ${property.name}.';
  await SharePlus.instance.share(
    ShareParams(
      files: [XFile(file.path)],
      text: shareText,
      subject: 'Invoice - ${property.name}',
    ),
  );
}
