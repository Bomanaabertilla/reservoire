import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'dining_checkout_screen.dart';

class DiningScreen extends StatefulWidget {
  const DiningScreen({super.key});

  @override
  State<DiningScreen> createState() => _DiningScreenState();
}

class _DiningScreenState extends State<DiningScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isDineIn = true;
  int _cartCount = 1;
  double _cartTotal = 29.00;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        primaryColor: const Color(0xFFE97631),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          title: const Text(
            'Hotel Dining',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 16),
            // Toggle Switch
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEDF0F3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isDineIn = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _isDineIn
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: _isDineIn
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Text(
                            'Dine-In',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _isDineIn
                                  ? const Color(0xFFE97631)
                                  : const Color(0xFF7D848D),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isDineIn = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: !_isDineIn
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: !_isDineIn
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Text(
                            'Room Service',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: !_isDineIn
                                  ? const Color(0xFFE97631)
                                  : const Color(0xFF7D848D),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Selector bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDEEE6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.restaurant, color: Color(0xFFE97631)),
                    const SizedBox(width: 8),
                    const Text('Select your table'),
                    const Spacer(),
                    const Text(
                      'Table 12',
                      style: TextStyle(
                        color: Color(0xFFE97631),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.expand_more, color: Color(0xFFE97631)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Our Restaurants',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 240,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 20),
                      children: const [
                        _RestaurantCard(
                          title: 'The Azure Lounge',
                          subtitle: 'Contemporary Fine Dining',
                          rating: '4.9',
                          price: '\$\$\$',
                          imageUrl: 'assets/images/restaurant_azure.png',
                          isOpen: true,
                        ),
                        SizedBox(width: 16),
                        _RestaurantCard(
                          title: 'Grand Bistro',
                          subtitle: 'International Cuisine',
                          rating: '4.7',
                          price: '\$\$',
                          imageUrl: 'assets/images/restaurant_bistro.png',
                          isOpen: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Categories
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    indicatorColor: const Color(0xFFE97631),
                    labelColor: const Color(0xFFE97631),
                    unselectedLabelColor: const Color(0xFF7D848D),
                    tabs: const [
                      Tab(text: 'Appetizers'),
                      Tab(text: 'Main Course'),
                      Tab(text: 'Desserts'),
                      Tab(text: 'Drinks'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'APPETIZERS',
                      style: TextStyle(
                        color: Color(0xFF7D848D),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const _MenuItem(
                    title: 'Citrus Salmon Carpaccio',
                    description:
                        'Thinly sliced fresh salmon with yuzu dressing, capers, and dill microgreens.',
                    price: 'GH₵18.50',
                    imageUrl: 'assets/images/food_salmon.png',
                    tags: ['veg', 'halal'],
                  ),
                  const _MenuItem(
                    title: 'Heirloom Tomato Bruschetta',
                    description:
                        'Garlic-rubbed sourdough topped with multi-colored tomatoes, basil, and...',
                    price: 'GH₵14.00',
                    imageUrl: 'assets/images/food_bruschetta.png',
                    tags: ['veg'],
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'MAIN COURSE',
                      style: TextStyle(
                        color: Color(0xFF7D848D),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const _MenuItem(
                    title: 'Angus Ribeye Steak',
                    description:
                        '250g premium beef served with truffle mash, seasonal vegetables and...',
                    price: 'GH₵42.00',
                    imageUrl: 'assets/images/food_steak.png',
                    tags: ['spicy'],
                  ),
                  _MenuItem(
                    title: 'Wild Mushroom Risotto',
                    description:
                        'Creamy Arborio rice with porcini mushrooms, parmesan, and a drizzle o...',
                    price: 'GH₵29.00',
                    imageUrl: 'assets/images/food_risotto.png',
                    tags: ['veg'],
                    showQty: true,
                    qty: _cartCount,
                  ),
                  const SizedBox(height: 100), // Space for bottom bar
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DiningCheckoutScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE97631),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Text(_cartCount.toString()),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'View Cart',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    'GH₵${_cartTotal.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RestaurantCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String rating;
  final String price;
  final String imageUrl;
  final bool isOpen;

  const _RestaurantCard({
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.price,
    required this.imageUrl,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                child: Image.asset(
                  imageUrl,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (isOpen)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'OPEN NOW',
                      style: TextStyle(
                        color: Color(0xFFE97631),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
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
                    color: Color(0xFF7D848D),
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('|', style: TextStyle(color: Color(0xFF7D848D))),
                    const SizedBox(width: 8),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFF7D848D),
                        fontSize: 12,
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

class _MenuItem extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;
  final List<String> tags;
  final bool showQty;
  final int qty;

  const _MenuItem({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.tags = const [],
    this.showQty = false,
    this.qty = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFFE97631),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF7D848D),
                    fontSize: 11,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ...tags.map((tag) {
                      IconData icon;
                      Color color;
                      if (tag == 'veg') {
                        icon = Icons.eco;
                        color = Colors.green;
                      } else if (tag == 'spicy') {
                        icon = Icons.whatshot;
                        color = Colors.orange;
                      } else if (tag == 'halal') {
                        icon = Icons.verified;
                        color = Colors.blue;
                      } else {
                        icon = Icons.circle;
                        color = Colors.grey;
                      }
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          icon,
                          color: color.withOpacity(0.5),
                          size: 14,
                        ),
                      );
                    }).toList(),
                    const Spacer(),
                    if (!showQty)
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE97631),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                      )
                    else
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFDEEE6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            qty.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE97631),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ],
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
