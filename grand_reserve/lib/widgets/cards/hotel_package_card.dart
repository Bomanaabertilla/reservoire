import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class HotelPackageCard extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String rating;
  final String reviewCount;
  final String? discountTag;
  final bool isHorizontal;

  const HotelPackageCard({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.reviewCount,
    this.discountTag,
    this.isHorizontal = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isHorizontal ? 300 : double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                color: Colors.grey[800], // Placeholder for image
                child: const Icon(Icons.image, size: 48, color: Colors.white24),
              ),
              if (discountTag != null)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      discountTag!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(fontSize: 18),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '/night',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: AppColors.accentGold,
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: AppColors.accentGold,
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: AppColors.accentGold,
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: AppColors.accentGold,
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: AppColors.accentGold,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '($reviewCount reviews)',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      'Book Room',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
