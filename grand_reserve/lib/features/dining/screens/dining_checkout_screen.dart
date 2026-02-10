import 'package:flutter/material.dart';

class DiningCheckoutScreen extends StatelessWidget {
  const DiningCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F1A),
        primaryColor: const Color(0xFF5A4CFF),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.1),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          title: const Text(
            'Checkout',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Live Status Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1B2A),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'LIVE STATUS',
                        style: TextStyle(
                          color: Color(0xFF5A4CFF),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'ETA ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            TextSpan(
                              text: '12-15 min',
                              style: TextStyle(
                                color: Color(0xFF5A4CFF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Preparing your order',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  const _StatusLine(
                    isCompleted: true,
                    title: 'Order Received',
                    subtitle: '12:30 PM',
                    showConnector: true,
                  ),
                  const _StatusLine(
                    isCompleted: false,
                    title: 'Preparing',
                    subtitle: 'Chef is crafting your meal',
                    isActive: true,
                    showConnector: true,
                  ),
                  const _StatusLine(
                    isCompleted: false,
                    isFaded: true,
                    title: 'Out for Delivery',
                    subtitle: 'To Room 402',
                    icon: Icons.directions_bike,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order Summary',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit Bag',
                    style: TextStyle(color: Color(0xFF5A4CFF)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1B1B2A),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: const [
                  _OrderItem(
                    title: 'Wagyu Beef Burger',
                    price: 'GH₵32.00',
                    qty: 1,
                    desc: 'No onions, Medium rare',
                    imageUrl:
                        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
                  ),
                  Divider(color: Colors.white10, height: 1),
                  _OrderItem(
                    title: 'Iced Truffle Latte',
                    price: 'GH₵14.00',
                    qty: 2,
                    desc: 'Oat milk',
                    imageUrl:
                        'https://images.unsplash.com/photo-1517701604599-bb29b565090c',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'SPECIAL INSTRUCTIONS',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1B2A),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "Please leave the tray on the side table by the door. No need to knock, I'm on a business call.",
                style: TextStyle(color: Colors.white70, height: 1.5),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'PAYMENT METHOD',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F0F3D),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF5A4CFF),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: const [
                        Icon(Icons.king_bed, color: Color(0xFF5A4CFF)),
                        SizedBox(height: 12),
                        Text(
                          'Charge to Room',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Room 402',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B1B2A),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: const [
                        Icon(Icons.credit_card, color: Colors.white54),
                        SizedBox(height: 12),
                        Text(
                          'Saved Card',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Visa •••• 4242',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const _PriceRow(label: 'Subtotal', value: 'GH₵60.00'),
            const _PriceRow(
              label: 'Delivery Fee (Hotel Service)',
              value: 'Free',
              isGreen: true,
            ),
            const _PriceRow(label: 'Taxes', value: 'GH₵5.40'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'GH₵65.40',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.headset_mic_outlined,
                  color: Colors.grey,
                  size: 18,
                ),
                label: const Text(
                  'Contact Concierge for assistance',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF432BFF),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Place Order • GH₵65.40',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.arrow_forward, size: 18),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _StatusLine extends StatelessWidget {
  final bool isCompleted;
  final bool isActive;
  final bool isFaded;
  final String title;
  final String subtitle;
  final IconData icon;
  final bool showConnector;

  const _StatusLine({
    required this.isCompleted,
    this.isActive = false,
    this.isFaded = false,
    required this.title,
    required this.subtitle,
    this.icon = Icons.check,
    this.showConnector = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: isCompleted
                      ? const Color(0xFF432BFF)
                      : (isActive
                            ? const Color(0xFF432BFF).withOpacity(0.1)
                            : Colors.transparent),
                  shape: BoxShape.circle,
                  border: !isCompleted && !isActive
                      ? Border.all(color: Colors.white10, width: 2)
                      : null,
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: const Color(0xFF432BFF).withOpacity(0.4),
                            blurRadius: 10,
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: isActive
                      ? Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xFF432BFF),
                            shape: BoxShape.circle,
                          ),
                        )
                      : Icon(
                          icon,
                          color: isCompleted
                              ? Colors.white
                              : (isFaded ? Colors.white10 : Colors.white24),
                          size: 16,
                        ),
                ),
              ),
              if (showConnector)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: isCompleted
                        ? const Color(0xFF432BFF)
                        : Colors.white10,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: isFaded ? Colors.white24 : Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isFaded ? Colors.white10 : Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  final String title;
  final String price;
  final int qty;
  final String desc;
  final String imageUrl;

  const _OrderItem({
    required this.title,
    required this.price,
    required this.qty,
    required this.desc,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 60,
              width: 60,
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
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF15144A),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'x$qty',
                        style: const TextStyle(
                          color: Color(0xFF5A4CFF),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      desc,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
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

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isGreen;

  const _PriceRow({
    required this.label,
    required this.value,
    this.isGreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white54)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isGreen ? Colors.green : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
