import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AdminPricingScreen extends StatelessWidget {
  const AdminPricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pricing & Packages'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.primaryBlue,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Room Base Pricing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.king_bed, color: AppColors.primaryBlue),
                    SizedBox(width: 8),
                    Text(
                      'Room Base Pricing',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(color: AppColors.textLink),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const _PricingCard(
              title: 'Deluxe Ocean View',
              stats: 'King Bed • Balcony • 45sqm',
              price: 'GH₵299',
            ),
            const SizedBox(height: 16),
            const _PricingCard(
              title: 'Executive Suite',
              stats: 'Living Room • Kitchen • 80sqm',
              price: 'GH₵450',
            ),

            const SizedBox(height: 32),

            // Active Multipliers
            Row(
              children: const [
                Icon(Icons.trending_up, color: AppColors.accentGold),
                SizedBox(width: 8),
                Text(
                  'Active Multipliers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _MultiplierCard(
                    title: 'SUMMER PEAK',
                    value: '1.25x',
                    subtitle: 'Ends Aug 31',
                    color: AppColors.accentGold,
                    bgColor: AppColors.accentGold.withOpacity(0.1),
                  ),
                  const SizedBox(width: 12),
                  _MultiplierCard(
                    title: 'WEEKEND SURGE',
                    value: '1.10x',
                    subtitle: 'Sat - Sun only',
                    color: const Color(0xFF7C4DFF), // Purple accent
                    bgColor: const Color(0xFF7C4DFF).withOpacity(0.1),
                  ),
                  const SizedBox(width: 12),
                  const _MultiplierCard(
                    title: 'JAZZ FEST',
                    value: '1.50x',
                    subtitle: 'July 12-14',
                    color: AppColors.success,
                    bgColor: Color(0xFFE8F5E9),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Create Bundle Form Placeholder
            const Text(
              'FEATURED_SEASONAL',
              style: TextStyle(
                color: Colors.red,
                fontSize: 24,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'PACKAGE NAME',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'e.g. Honeymoon Special',
                      hintStyle: const TextStyle(
                        color: AppColors.textPlaceholder,
                      ),
                      fillColor: AppColors.background,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'BASE ROOM',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButton<String>(
                                value: 'Deluxe Ocean',
                                isExpanded: true,
                                underline: const SizedBox(),
                                dropdownColor: AppColors.background,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Deluxe Ocean',
                                    child: Text('Deluxe Ocean'),
                                  ),
                                ],
                                onChanged: (v) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'UPCHARGE',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              initialValue: '50',
                              decoration: InputDecoration(
                                prefixText: 'GH₵ ',
                                fillColor: AppColors.background,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Radio(value: false, groupValue: false, onChanged: (v) {}),
                      const Text(
                        'Percentage based instead of fixed',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.background, // Dark button as per design
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Create Bundle'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            const Text(
              'ACTIVE BUNDLES',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const _BundleTile(
              icon: Icons.favorite,
              color: Colors.pink,
              title: 'Honeymoon Special',
              subtitle: 'DELUXE OCEAN + CHAMPAGNE + SPA',
              price: '+GH₵120',
            ),
            const SizedBox(height: 12),
            const _BundleTile(
              icon: Icons.restaurant_menu,
              color: Colors.blue,
              title: 'Breakfast & Spa',
              subtitle: 'ANY ROOM + FULL BOARD + 1HR MASSAGE',
              price: '+GH₵85',
            ),
          ],
        ),
      ),
    );
  }
}

class _PricingCard extends StatelessWidget {
  final String title;
  final String stats;
  final String price;

  const _PricingCard({
    required this.title,
    required this.stats,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    stats,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: price,
                      style: const TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const TextSpan(
                      text: '/night',
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
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, size: 16),
                  label: const Text('Edit Base'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.bolt, size: 16),
                  label: const Text('Seasonal'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MultiplierCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color color;
  final Color bgColor;

  const _MultiplierCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(color: color.withOpacity(0.8), fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class _BundleTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String price;

  const _BundleTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Text(
                'Active',
                style: TextStyle(color: AppColors.success, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
