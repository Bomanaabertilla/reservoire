import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widgets/common/primary_button.dart';

class RoomListCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl; // Placeholder for now
  final List<String> amenities;
  final VoidCallback onBookNow;

  const RoomListCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.amenities,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
                opacity: 0.8,
              ),
            ),
            child: const Center(
              child: Icon(Icons.image, size: 50, color: Colors.white24),
            ),
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
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$price /night',
                        style: const TextStyle(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(height: 1.4),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),

                // Amenities Row
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: amenities
                      .map((amenity) => _AmenityChip(label: amenity))
                      .toList(),
                ),

                const SizedBox(height: 20),
                PrimaryButton(
                  text: 'Book Now',
                  onPressed: onBookNow,
                  backgroundColor: AppColors.primaryBlue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AmenityChip extends StatelessWidget {
  final String label;

  const _AmenityChip({required this.label});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (label.toLowerCase()) {
      case 'free wifi':
        icon = Icons.wifi;
        break;
      case 'central ac':
        icon = Icons.ac_unit;
        break;
      case 'king size':
        icon = Icons.king_bed;
        break;
      case 'queen size':
        icon = Icons.bathtub;
        break; // Placeholder
      case 'breakfast':
        icon = Icons.restaurant;
        break;
      default:
        icon = Icons.check_circle_outline;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.textSecondary),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
