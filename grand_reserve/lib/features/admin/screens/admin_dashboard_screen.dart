import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/admin_metric_card.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          const SizedBox(width: 8),
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              backgroundColor: AppColors.surface,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Metrics Grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.3,
              children: const [
                AdminMetricCard(
                  title: 'Revenue',
                  value: 'GH₵42.5k',
                  trend: '12.5%',
                  icon: Icons.account_balance_wallet,
                ),
                AdminMetricCard(
                  title: 'Occupancy',
                  value: '84.2%',
                  trend: '4.3%',
                  icon: Icons.king_bed,
                ),
                AdminMetricCard(
                  title: 'New',
                  value: '128',
                  trend: 'Past 24h',
                  icon: Icons.calendar_today,
                  isTrendPositive:
                      false, // Neutral actually, but using color for diff
                  subtext: '',
                ),
                AdminMetricCard(
                  title: 'Pending',
                  value: '14',
                  trend: 'Needs action',
                  isTrendPositive: false,
                  icon: Icons.pending_actions,
                  subtext: '',
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Revenue Chart
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Revenue Trend',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Last 6 Months',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _ChartBar(
                        label: 'JAN',
                        heightFactor: 0.4,
                        isSelected: false,
                      ),
                      _ChartBar(
                        label: 'FEB',
                        heightFactor: 0.6,
                        isSelected: false,
                      ),
                      _ChartBar(
                        label: 'MAR',
                        heightFactor: 0.35,
                        isSelected: false,
                      ),
                      _ChartBar(
                        label: 'APR',
                        heightFactor: 0.5,
                        isSelected: false,
                      ),
                      _ChartBar(
                        label: 'MAY',
                        heightFactor: 0.9,
                        isSelected: true,
                      ),
                      _ChartBar(
                        label: 'JUN',
                        heightFactor: 0.55,
                        isSelected: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Recent Activity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Activity',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(color: AppColors.textLink),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const _ActivityTile(
              icon: Icons.check_circle,
              color: AppColors.success,
              title: 'Booking Confirmed',
              subtitle: 'Deluxe Suite #402 - Sarah J.',
              time: '2M AGO',
            ),
            const SizedBox(height: 12),
            const _ActivityTile(
              icon: Icons.cleaning_services,
              color: AppColors.primaryBlue,
              title: 'Room Status Change',
              subtitle: '#201 changed to \'Cleaning\'',
              time: '15M AGO',
            ),
            const SizedBox(height: 12),
            const _ActivityTile(
              icon: Icons.edit,
              color: AppColors.accentGold,
              title: 'Pricing Updated',
              subtitle: 'Weekend rates for Standard Kings',
              time: '1H AGO',
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _ChartBar extends StatelessWidget {
  final String label;
  final double heightFactor;
  final bool isSelected;

  const _ChartBar({
    required this.label,
    required this.heightFactor,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 150 * heightFactor,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryBlue
                : AppColors.primaryBlue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _ActivityTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String time;

  const _ActivityTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
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
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
