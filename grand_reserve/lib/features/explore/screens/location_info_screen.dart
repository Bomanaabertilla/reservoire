import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widgets/common/primary_button.dart';

class LocationInfoScreen extends StatelessWidget {
  const LocationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location & Info'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox.shrink(), // Hides back button if main tab
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Map Placeholder
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&w=800&q=80',
                  ), // Map placeholder
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_on,
                    color: AppColors.primaryBlue,
                    size: 32,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '123 Luxury Way, Seaside Heights, Santa Monica, California, 90210',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(height: 1.5),
            ),
            const SizedBox(height: 16),

            PrimaryButton(
              text: 'Get Directions',
              onPressed: () {},
              icon: Icons.navigation,
            ),

            const SizedBox(height: 32),
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _ContactButton(icon: Icons.call, label: 'Call', onTap: () {}),
                const SizedBox(width: 16),
                _ContactButton(icon: Icons.email, label: 'Email', onTap: () {}),
                const SizedBox(width: 16),
                _ContactButton(
                  icon: Icons.chat,
                  label: 'WhatsApp',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 32),
            const Text(
              'About the Hotel',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Hotel Azure offers a refined coastal experience in the heart of Santa Monica. Combining modern luxury with the relaxed spirit of California, our property features panoramic ocean views and world-class service.',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(height: 1.6),
            ),

            const SizedBox(height: 24),
            const Text(
              'AMENITIES',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),

            const _AmenityRow(
              icon: Icons.support_agent,
              label: '24-hour Front Desk',
            ),
            const SizedBox(height: 12),
            const _AmenityRow(icon: Icons.local_parking, label: 'Free Parking'),
            const SizedBox(height: 12),
            const _AmenityRow(
              icon: Icons.room_service,
              label: 'Concierge Service',
            ),
            const SizedBox(height: 12),
            const _AmenityRow(icon: Icons.wifi, label: 'High-speed Free Wi-Fi'),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            children: [
              Icon(icon, color: AppColors.primaryBlue),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

class _AmenityRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const _AmenityRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primaryBlue, size: 20),
        const SizedBox(width: 16),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
