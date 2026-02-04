import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/admin_room_tile.dart';

class AdminRoomsScreen extends StatefulWidget {
  const AdminRoomsScreen({super.key});

  @override
  State<AdminRoomsScreen> createState() => _AdminRoomsScreenState();
}

class _AdminRoomsScreenState extends State<AdminRoomsScreen> {
  int _selectedFloor = 0; // 0: All, 1: Floor 1...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooms'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
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
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.textPlaceholder,
                ),
                hintText: 'Search room number...',
                hintStyle: const TextStyle(color: AppColors.textPlaceholder),
                fillColor: AppColors.surface,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                _FilterChip(
                  'All Floors',
                  _selectedFloor == 0,
                  () => setState(() => _selectedFloor = 0),
                ),
                const SizedBox(width: 12),
                _FilterChip(
                  'Floor 1',
                  _selectedFloor == 1,
                  () => setState(() => _selectedFloor = 1),
                ),
                const SizedBox(width: 12),
                _FilterChip(
                  'Floor 2',
                  _selectedFloor == 2,
                  () => setState(() => _selectedFloor = 2),
                ),
                const SizedBox(width: 12),
                _FilterChip(
                  'Floor 3',
                  _selectedFloor == 3,
                  () => setState(() => _selectedFloor = 3),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Room List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                AdminRoomTile(
                  roomNumber: '101',
                  roomType: 'Deluxe King',
                  status: 'Available',
                  statusColor: AppColors.success,
                  isAvailable: true,
                  onToggle: (val) {},
                ),
                AdminRoomTile(
                  roomNumber: '102',
                  roomType: 'Standard Twin',
                  status: 'Occupied',
                  statusColor: Colors.orange,
                  isAvailable: false,
                  onToggle: (val) {},
                ),
                AdminRoomTile(
                  roomNumber: '103',
                  roomType: 'Executive Suite',
                  status: 'Cleaning in Progress',
                  statusColor: AppColors.textLink,
                  isAvailable: false,
                  onToggle: (val) {},
                ),

                const SizedBox(height: 12),

                AdminRoomTile(
                  roomNumber: '201',
                  roomType: 'Deluxe King',
                  status: 'Available',
                  statusColor: AppColors.success,
                  isAvailable: true,
                  onToggle: (val) {},
                ),
                AdminRoomTile(
                  roomNumber: '202',
                  roomType: 'Premium Suite',
                  status: 'Occupied',
                  statusColor: Colors.orange,
                  isAvailable: false,
                  onToggle: (val) {},
                ),
                AdminRoomTile(
                  roomNumber: '205',
                  roomType: 'Standard Single',
                  status: 'Cleaning in Progress',
                  statusColor: AppColors.textLink,
                  isAvailable: false,
                  onToggle: (val) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip(this.label, this.isSelected, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : AppColors.surface,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
