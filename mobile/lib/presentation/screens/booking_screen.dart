import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../config/theme/app_theme.dart';

class BookingScreen extends StatefulWidget {
  final String hotelId;
  final String roomId;

  const BookingScreen({
    Key? key,
    required this.hotelId,
    required this.roomId,
  }) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int numberOfGuests = 1;
  int numberOfNights = 1;
  double roomPrice = 50000;
  String specialRequests = '';
  int currentStep = 0;

  double get subtotal => roomPrice * numberOfNights;
  double get taxes => subtotal * 0.1;
  double get totalPrice => subtotal + taxes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightDarkColor,
      appBar: AppBar(
        title: const Text('Complete Your Booking'),
        backgroundColor: AppTheme.lightDarkColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Booking card info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.dividerColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deluxe Room',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Grand Luxury Hotel',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${roomPrice.toStringAsFixed(0)} IQD/night',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '⭐ 4.8',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppTheme.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Check-in & Check-out
            Text(
              'Travel Dates',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: GlassmorphismContainer(
                    width: double.infinity,
                    height: 60,
                    borderRadius: 12,
                    blur: 20,
                    color: AppTheme.surfaceColor.withOpacity(0.1),
                    border: 1.5,
                    borderColor: AppTheme.dividerColor.withOpacity(0.5),
                    child: TextButton(
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (date != null) {
                          setState(() => checkInDate = date);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Check In',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            checkInDate != null
                                ? '${checkInDate!.day}/${checkInDate!.month}'
                                : 'Select',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: checkInDate != null
                                      ? AppTheme.primaryColor
                                      : AppTheme.textSecondaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GlassmorphismContainer(
                    width: double.infinity,
                    height: 60,
                    borderRadius: 12,
                    blur: 20,
                    color: AppTheme.surfaceColor.withOpacity(0.1),
                    border: 1.5,
                    borderColor: AppTheme.dividerColor.withOpacity(0.5),
                    child: TextButton(
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: checkInDate ?? DateTime.now().add(const Duration(days: 1)),
                          firstDate: checkInDate ?? DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (date != null) {
                          setState(() {
                            checkOutDate = date;
                            numberOfNights = checkOutDate!.difference(checkInDate!).inDays;
                          });
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Check Out',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            checkOutDate != null
                                ? '${checkOutDate!.day}/${checkOutDate!.month}'
                                : 'Select',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color: checkOutDate != null
                                      ? AppTheme.primaryColor
                                      : AppTheme.textSecondaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Guests
            Text(
              'Number of Guests',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.dividerColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: numberOfGuests > 1
                        ? () => setState(() => numberOfGuests--)
                        : null,
                    icon: const Icon(Icons.remove),
                    color: AppTheme.primaryColor,
                  ),
                  Text(
                    '$numberOfGuests Guest${numberOfGuests > 1 ? 's' : ''}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: numberOfGuests < 5
                        ? () => setState(() => numberOfGuests++)
                        : null,
                    icon: const Icon(Icons.add),
                    color: AppTheme.primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Special Requests
            Text(
              'Special Requests',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            TextField(
              onChanged: (value) => setState(() => specialRequests = value),
              decoration: InputDecoration(
                hintText: 'Add any special requests (optional)',
                hintStyle: const TextStyle(color: AppTheme.textSecondaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppTheme.dividerColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppTheme.primaryColor,
                    width: 2,
                  ),
                ),
              ),
              minLines: 3,
              maxLines: 5,
              style: const TextStyle(color: AppTheme.textColor),
            ),
            const SizedBox(height: 32),

            // Price breakdown
            Text(
              'Price Details',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.dividerColor),
              ),
              child: Column(
                children: [
                  _buildPriceRow(
                    context,
                    '${roomPrice.toStringAsFixed(0)} IQD × $numberOfNights nights',
                    '${subtotal.toStringAsFixed(0)} IQD',
                  ),
                  const SizedBox(height: 12),
                  Divider(color: AppTheme.dividerColor),
                  const SizedBox(height: 12),
                  _buildPriceRow(
                    context,
                    'Taxes & Fees (10%)',
                    '${taxes.toStringAsFixed(0)} IQD',
                    isSubtitle: true,
                  ),
                  const SizedBox(height: 12),
                  Divider(color: AppTheme.dividerColor),
                  const SizedBox(height: 12),
                  _buildPriceRow(
                    context,
                    'Total',
                    '${totalPrice.toStringAsFixed(0)} IQD',
                    isBold: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Continue button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: checkInDate != null && checkOutDate != null
                    ? () {
                        Navigator.pushNamed(context, '/payment', arguments: {
                          'bookingData': {
                            'hotelId': widget.hotelId,
                            'roomId': widget.roomId,
                            'checkInDate': checkInDate,
                            'checkOutDate': checkOutDate,
                            'numberOfGuests': numberOfGuests,
                            'numberOfNights': numberOfNights,
                            'totalPrice': totalPrice,
                            'subtotal': subtotal,
                            'taxes': taxes,
                            'specialRequests': specialRequests,
                          }
                        });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  disabledBackgroundColor: AppTheme.primaryColor.withOpacity(0.3),
                ),
                child: const Text(
                  'Continue to Payment',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(BuildContext context, String label, String price,
      {bool isBold = false, bool isSubtitle = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: isBold ? FontWeight.w700 : FontWeight.normal,
                fontSize: isBold ? 18 : 14,
              ),
        ),
        Text(
          price,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isBold ? AppTheme.primaryColor : AppTheme.textColor,
                fontWeight: isBold ? FontWeight.w700 : FontWeight.normal,
                fontSize: isBold ? 18 : 14,
              ),
        ),
      ],
    );
  }
}
