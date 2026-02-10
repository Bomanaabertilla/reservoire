import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/room_list_card.dart';
import 'room_details_screen.dart';

class AvailableRoomsScreen extends StatelessWidget {
  const AvailableRoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Rooms'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Column(
        children: [
          // Filter Bar
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _FilterChip(label: 'Price', hasDropdown: true),
                const SizedBox(width: 12),
                _FilterChip(label: 'Room Type', hasDropdown: true),
                const SizedBox(width: 12),
                _FilterChip(label: 'Amenities', hasDropdown: true),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                RoomListCard(
                  title: 'Executive Sea View Suite',
                  description:
                      'Spacious suite with floor-to-ceiling windows and a private sunrise balcony.',
                  price: 'GH₵450',
                  imageUrl:
                      'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?auto=format&fit=crop&w=800&q=80',
                  amenities: const ['Free Wifi', 'Central AC', 'King Size'],
                  onBookNow: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoomDetailsScreen(
                          title: 'Executive Sea View Suite',
                          price: 450,
                          imageUrl:
                              'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?auto=format&fit=crop&w=800&q=80',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                RoomListCard(
                  title: 'Deluxe Garden View Room',
                  description:
                      'Quiet, minimalist room overlooking the historic botanical gardens.',
                  price: 'GH₵280',
                  imageUrl:
                      'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=800&q=80',
                  amenities: const ['Free Wifi', 'Queen Size'],
                  onBookNow: () {
                    // Navigate
                  },
                ),
                const SizedBox(height: 24),
                RoomListCard(
                  title: 'Skyline Presidential Loft',
                  description:
                      'Top-floor luxury with 360-degree views and private pool access.',
                  price: 'GH₵620',
                  imageUrl:
                      'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80',
                  amenities: const ['Free Wifi', 'King Size', 'Breakfast'],
                  onBookNow: () {
                    // Navigate
                  },
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
  final bool hasDropdown;

  const _FilterChip({required this.label, this.hasDropdown = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          if (hasDropdown) ...[
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 16),
          ],
        ],
      ),
    );
  }
}
