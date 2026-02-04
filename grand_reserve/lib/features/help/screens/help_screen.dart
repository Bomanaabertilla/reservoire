import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'How can we help you?',
                hintStyle: const TextStyle(color: AppColors.textSecondary),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.textSecondary,
                ),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),

            const SizedBox(height: 32),

            // Browse Categories
            const Text(
              'Browse Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: const [
                _CategoryCard(
                  icon: Icons.confirmation_number,
                  label: 'Booking Issues',
                  color: Color(0xFF1E88E5), // Blue
                ),
                _CategoryCard(
                  icon: Icons.payments,
                  label: 'Payment &\nRefunds',
                  color: Color(0xFF43A047), // Green
                ),
                _CategoryCard(
                  icon: Icons.pool,
                  label: 'Hotel Amenities',
                  color: Color(0xFFE65100), // Orange
                ),
                _CategoryCard(
                  icon: Icons.account_circle,
                  label: 'Account Access',
                  color: Color(0xFF8E24AA), // Purple
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Top FAQs
            const Text(
              'Top FAQs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const _FaqTile(
              question: 'How do I cancel my booking?',
              answer:
                  'You can cancel your booking from the "My Bookings" tab. Select the trip you wish to cancel and tap on the "Cancel Booking" button. Please note that cancellation fees may apply depending on your fare type.',
            ),
            const SizedBox(height: 12),
            const _FaqTile(
              question: 'What is the check-in time?',
              answer:
                  'Standard check-in time is 3:00 PM. Early check-in is subject to availability and may incur an additional charge.',
            ),
            const SizedBox(height: 12),
            const _FaqTile(
              question: 'Is breakfast included in my stay?',
              answer:
                  'It depends on the package you selected. You can check your booking confirmation email or the "My Bookings" section to see if breakfast is included.',
            ),
            const SizedBox(height: 12),
            const _FaqTile(
              question: 'How can I request a late checkout?',
              answer:
                  'Late checkout can be requested through the "Staff Alerts" feature or by contacting the front desk directly. It is subject to availability.',
            ),

            const SizedBox(height: 32),
            const Text(
              'Contact Us',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _CategoryCard({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  final String question;
  final String answer;

  const _FaqTile({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            question,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          textColor: Colors.white,
          iconColor: Colors.white,
          collapsedIconColor: AppColors.textSecondary,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Text(
                answer,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
