import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AdminRoomTile extends StatelessWidget {
  final String roomNumber;
  final String roomType;
  final String status;
  final Color statusColor;
  final bool isAvailable;
  final ValueChanged<bool> onToggle;

  const AdminRoomTile({
    super.key,
    required this.roomNumber,
    required this.roomType,
    required this.status,
    required this.statusColor,
    required this.isAvailable,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: _getRoomNumberColor(roomNumber),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                roomNumber,
                style: const TextStyle(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomType,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.circle, size: 8, color: statusColor),
                    const SizedBox(width: 6),
                    Text(
                      status,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Switch(
            value: isAvailable,
            onChanged: onToggle,
            activeColor: AppColors.primaryBlue,
            activeTrackColor: AppColors.primaryBlue.withOpacity(0.4),
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey[800],
          ),
        ],
      ),
    );
  }

  Color _getRoomNumberColor(String number) {
    // Just a visual helper to differentiate floors/types subtly if needed
    // Using a light blue tint for all background
    return const Color(0xFFE3F2FD);
  }
}
