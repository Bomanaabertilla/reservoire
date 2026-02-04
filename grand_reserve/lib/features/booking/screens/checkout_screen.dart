import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widgets/common/custom_text_field.dart';
import '../../../widgets/common/primary_button.dart';
import 'confirmation_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final String roomTitle;
  final double price;
  final String imageUrl;

  const CheckoutScreen({
    super.key,
    required this.roomTitle,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _selectedPaymentMethod = 0; // 0: Credit Card, 1: PayPal, 2: Pay at Hotel

  @override
  Widget build(BuildContext context) {
    double taxes = widget.price * 0.15; // 15% tax
    double total = widget.price + taxes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Booking Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.roomTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Oct 12 - Oct 15 • 3 Nights',
                          style: TextStyle(color: AppColors.primaryBlue),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '2 Adults • 1 King Bed',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            const Text(
              'Guest Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const CustomTextField(label: 'Full Name', hint: 'John Doe'),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'Email Address',
              hint: 'john@example.com',
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              label: 'Phone Number',
              hint: '+1 (555) 000-0000',
            ),

            const SizedBox(height: 32),
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _PaymentOption(
              icon: Icons.credit_card,
              label: 'Credit Card',
              isSelected: _selectedPaymentMethod == 0,
              onTap: () => setState(() => _selectedPaymentMethod = 0),
            ),
            const SizedBox(height: 12),
            _PaymentOption(
              icon: Icons.account_balance_wallet,
              label: 'PayPal',
              isSelected: _selectedPaymentMethod == 1,
              onTap: () => setState(() => _selectedPaymentMethod = 1),
            ),
            const SizedBox(height: 12),
            _PaymentOption(
              icon: Icons.store_mall_directory,
              label: 'Pay at Hotel',
              isSelected: _selectedPaymentMethod == 2,
              onTap: () => setState(() => _selectedPaymentMethod = 2),
            ),

            const SizedBox(height: 32),
            const Text(
              'Price Breakdown',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _PriceRow(
              label: 'Room Rate (1 night)',
              value: '\$${widget.price.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 8),
            _PriceRow(
              label: 'Taxes & Fees',
              value: '\$${taxes.toStringAsFixed(2)}',
            ),
            const Divider(height: 32, color: AppColors.surface),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),
            PrimaryButton(
              text: 'Confirm Reservation',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConfirmationScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'By clicking "Confirm Reservation", you agree to our Terms of Service.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentOption({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryBlue.withOpacity(0.1)
              : AppColors.surface,
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primaryBlue : AppColors.textPrimary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected
                  ? AppColors.primaryBlue
                  : AppColors.textPlaceholder,
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;

  const _PriceRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textSecondary)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
