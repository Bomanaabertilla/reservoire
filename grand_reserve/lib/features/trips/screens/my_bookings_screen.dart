import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../widgets/common/primary_button.dart';
import '../../booking/screens/available_rooms_screen.dart';
import '../widgets/booking_card.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  int _selectedTab = 0; // 0: Upcoming, 1: Past, 2: Cancelled

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox.shrink(),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      _TabButton(
                        label: 'Upcoming',
                        isSelected: _selectedTab == 0,
                        onTap: () => setState(() => _selectedTab = 0),
                      ),
                      _TabButton(
                        label: 'Past',
                        isSelected: _selectedTab == 1,
                        onTap: () => setState(() => _selectedTab = 1),
                      ),
                      _TabButton(
                        label: 'Cancelled',
                        isSelected: _selectedTab == 2,
                        onTap: () => setState(() => _selectedTab = 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 100),
                    children: const [
                      BookingCard(
                        hotelName: 'Grand Hyatt Deluxe Room',
                        imageUrl:
                            'https://images.unsplash.com/photo-1611892440504-42a792e24d32?auto=format&fit=crop&w=800&q=80',
                        dateRange: 'Oct 12 - Oct 15, 2023',
                        referenceId: '#BK-8821',
                        status: BookingStatus.confirmed,
                        onModify: _dummyAction,
                        onCancel: _dummyAction,
                      ),
                      SizedBox(height: 24),
                      BookingCard(
                        hotelName: 'Ocean View Suite',
                        imageUrl:
                            'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80',
                        dateRange: 'Nov 05 - Nov 08, 2023',
                        referenceId: '#BK-9042',
                        status: BookingStatus.confirmed,
                        onModify: _dummyAction,
                        onCancel: _dummyAction,
                      ),
                      SizedBox(height: 24),
                      BookingCard(
                        hotelName: 'Boutique Garden Loft',
                        imageUrl:
                            'https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=800&q=80',
                        dateRange: 'Dec 20 - Dec 24, 2023',
                        referenceId: '#BK-9115',
                        status: BookingStatus.processing,
                        onModify: _dummyAction,
                        onCancel: _dummyAction,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 24,
            left: 20,
            right: 20,
            child: PrimaryButton(
              text: 'Book New Room',
              icon: Icons.add,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AvailableRoomsScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Function to fix 'const' error with tear-offs
void _dummyAction() {}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? AppColors.primaryBlue
                  : AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
