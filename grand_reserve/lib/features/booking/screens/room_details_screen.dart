import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widgets/common/primary_button.dart';
import 'checkout_screen.dart';

class RoomDetailsScreen extends StatefulWidget {
  final String title;
  final double price;
  final String imageUrl;

  const RoomDetailsScreen({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  int _selectedPackageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 350,
            child: Image.network(widget.imageUrl, fit: BoxFit.cover),
          ),

          // Back Button & Share
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(fontSize: 24),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.accentGold,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '4.9 (124 reviews)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Experience unparalleled luxury with floor-to-ceiling windows overlooking the turquoise ocean. This suite features a king-sized bed, private balcony, and high-end marble bathroom.',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(height: 1.6),
                    ),

                    const SizedBox(height: 24),
                    const Text(
                      'Room Amenities',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        _AmenityIcon(icon: Icons.wifi, label: 'Wi-Fi'),
                        _AmenityIcon(icon: Icons.wine_bar, label: 'Mini-bar'),
                        _AmenityIcon(icon: Icons.pool, label: 'Pool'),
                        _AmenityIcon(
                          icon: Icons.room_service,
                          label: '24/7 Service',
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),
                    const Text(
                      'Select Package',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    _PackageOption(
                      title: 'Standard Stay',
                      subtitle: 'Room only + Welcome drink',
                      priceDisplay: '+GH₵0',
                      isSelected: _selectedPackageIndex == 0,
                      onTap: () => setState(() => _selectedPackageIndex = 0),
                    ),
                    const SizedBox(height: 12),
                    _PackageOption(
                      title: 'Breakfast Included',
                      subtitle: 'Full buffet breakfast daily',
                      priceDisplay: '+GH₵45',
                      isSelected: _selectedPackageIndex == 1,
                      onTap: () => setState(() => _selectedPackageIndex = 1),
                    ),
                    const SizedBox(height: 12),
                    _PackageOption(
                      title: 'All-Inclusive Luxury',
                      subtitle: 'Full board + Spa access',
                      priceDisplay: '+GH₵120',
                      isPopular: true,
                      isSelected: _selectedPackageIndex == 2,
                      onTap: () => setState(() => _selectedPackageIndex = 2),
                    ),

                    const SizedBox(height: 100), // Space for bottom bar
                  ],
                ),
              ),
            ),
          ),

          // Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border(top: BorderSide(color: Colors.white10)),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total per night',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        'GH₵${widget.price.toInt()}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: PrimaryButton(
                      text: 'Book Now',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutScreen(
                              roomTitle: widget.title,
                              price:
                                  widget.price +
                                  (_selectedPackageIndex == 1
                                      ? 45
                                      : _selectedPackageIndex == 2
                                      ? 120
                                      : 0),
                              imageUrl: widget.imageUrl,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmenityIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _AmenityIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primaryBlue),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class _PackageOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final String priceDisplay;
  final bool isSelected;
  final bool isPopular;
  final VoidCallback onTap;

  const _PackageOption({
    required this.title,
    required this.subtitle,
    required this.priceDisplay,
    required this.isSelected,
    required this.onTap,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryBlue.withOpacity(0.1)
              : AppColors.surface,
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      if (isPopular) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'POPULAR',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  priceDisplay,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected
                      ? AppColors.primaryBlue
                      : AppColors.textPlaceholder,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
