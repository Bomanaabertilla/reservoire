import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/cards/hotel_package_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.apartment,
                          color: AppColors.primaryBlue,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Grand Reserve',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontFamily: 'Playfair Display',
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const CircleAvatar(
                          backgroundColor: AppColors.surface,
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.textPlaceholder,
                    ),
                    hintText: 'Destination, Dates, Guests',
                    hintStyle: const TextStyle(
                      color: AppColors.textPlaceholder,
                    ),
                    fillColor: AppColors.surface,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Hero Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                      ), // Placeholder
                      fit: BoxFit.cover,
                      opacity: 0.6,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Experience\nUnmatched Luxury',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Book your dream stay at our flagship location',
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBlue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: const Text('Explore Now'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    _CategoryChip(
                      label: 'Luxury Suites',
                      icon: Icons.bed,
                      isSelected: true,
                    ),
                    const SizedBox(width: 12),
                    _CategoryChip(
                      label: 'Deluxe Rooms',
                      icon: Icons.chair,
                      isSelected: false,
                    ),
                    const SizedBox(width: 12),
                    _CategoryChip(
                      label: 'Villas',
                      icon: Icons.home,
                      isSelected: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Featured Packages
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Packages',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(fontSize: 22),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View all',
                        style: TextStyle(color: AppColors.textLink),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 380, // Height for card
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: const [
                    HotelPackageCard(
                      title: 'Weekend Getaway',
                      location: 'Manhattan, New York',
                      price: '\$299',
                      rating: '5.0',
                      reviewCount: '128',
                      discountTag: '20% OFF',
                    ),
                    SizedBox(width: 16),
                    HotelPackageCard(
                      title: 'Spa & Stay',
                      location: 'Napa Valley, California',
                      price: '\$450',
                      rating: '4.8',
                      reviewCount: '94',
                      discountTag: 'POPULAR',
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;

  const _CategoryChip({
    required this.label,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryBlue : AppColors.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
