import 'package:flutter/material.dart';
import '../../../widgets/cards/hotel_package_card.dart';

class FeaturedPackagesScreen extends StatelessWidget {
  const FeaturedPackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Featured Packages'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HotelPackageCard(
            title: 'Weekend Getaway',
            location: 'Manhattan, New York',
            price: 'GH₵299',
            rating: '5.0',
            reviewCount: '128',
            discountTag: '20% OFF',
            isHorizontal: false,
          ),
          SizedBox(height: 16),
          HotelPackageCard(
            title: 'Spa & Stay',
            location: 'Napa Valley, California',
            price: 'GH₵450',
            rating: '4.8',
            reviewCount: '94',
            discountTag: 'POPULAR',
            isHorizontal: false,
          ),
          SizedBox(height: 16),
          HotelPackageCard(
            title: 'Business Suite',
            location: 'London, UK',
            price: 'GH₵550',
            rating: '4.9',
            reviewCount: '210',
            discountTag: 'NEW',
            isHorizontal: false,
          ),
          SizedBox(height: 16),
          HotelPackageCard(
            title: 'Romantic Retreat',
            location: 'Paris, France',
            price: 'GH₵600',
            rating: '5.0',
            reviewCount: '156',
            discountTag: 'LIMITED',
            isHorizontal: false,
          ),
        ],
      ),
    );
  }
}
