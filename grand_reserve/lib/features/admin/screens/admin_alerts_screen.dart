import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AdminAlertsScreen extends StatefulWidget {
  const AdminAlertsScreen({super.key});

  @override
  State<AdminAlertsScreen> createState() => _AdminAlertsScreenState();
}

class _AdminAlertsScreenState extends State<AdminAlertsScreen> {
  int _selectedTab = 0; // 0: All, 1: Pending, 2: Assigned

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staff Alerts'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: [IconButton(icon: const Icon(Icons.tune), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: _AlertStatCard(
                      label: 'Total Active\nTasks',
                      value: '12',
                      icon: Icons.assignment,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _AlertStatCard(
                      label: 'High Priority',
                      value: '4',
                      icon: Icons.priority_high,
                      color: AppColors.error,
                    ),
                  ),
                ],
              ),
            ),

            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _TabButton(
                    'All Alerts',
                    _selectedTab == 0,
                    () => setState(() => _selectedTab = 0),
                  ),
                  _TabButton(
                    'Pending',
                    _selectedTab == 1,
                    () => setState(() => _selectedTab = 1),
                  ),
                  _TabButton(
                    'Assigned',
                    _selectedTab == 2,
                    () => setState(() => _selectedTab = 2),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
              child: Divider(color: AppColors.surface, thickness: 2),
            ),

            // Colored line under selected filter handled in _TabButton visually or simplistic approach here for now
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              children: [
                _AlertTile(
                  icon: Icons.calendar_today,
                  iconColor: AppColors.primaryBlue, // Blue
                  title: 'New Booking Confirmed',
                  subtitle: 'Room 104 - 3 Nights',
                  time: 'Received 2m ago',
                  priority: 'HIGH',
                  actionLabel: 'Acknowledge',
                  onAction: () {},
                ),
                _AlertTile(
                  icon: Icons.notifications_active,
                  iconColor: Colors.orange,
                  title: 'Guest Request: Extra Towels',
                  subtitle: 'Room 215 - Immediate attention',
                  time: 'Received 15m ago',
                  priority: 'MEDIUM',
                  actionLabel: 'Assign',
                  onAction: () {},
                ),
                _AlertTile(
                  icon: Icons.door_front_door,
                  iconColor: Colors.green,
                  title: 'Room 302: Checkout',
                  subtitle: 'Cleaning required for next guest',
                  time: 'Received 45m ago',
                  priority: 'LOW',
                  actionLabel: 'Assign',
                  onAction: () {},
                ),
                _AlertTile(
                  icon: Icons.water_drop,
                  iconColor: AppColors.primaryBlue,
                  title: 'Room 405: Leakage',
                  subtitle: 'Maintenance required',
                  time: 'Received 1h ago',
                  priority: 'HIGH',
                  actionLabel: 'Assign',
                  onAction: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AlertStatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _AlertStatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
              Icon(icon, color: color, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton(this.label, this.isSelected, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: isSelected
              ? const Border(
                  bottom: BorderSide(color: AppColors.primaryBlue, width: 2),
                )
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _AlertTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;
  final String priority;
  final String actionLabel;
  final VoidCallback onAction;

  const _AlertTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.priority,
    required this.actionLabel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(
          0.5,
        ), // Slightly lighter/transparent
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: _getPriorityColor(priority).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            priority,
                            style: TextStyle(
                              color: _getPriorityColor(priority),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 36,
              child: ElevatedButton(
                onPressed: onAction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: actionLabel == 'Acknowledge'
                      ? AppColors.primaryBlue
                      : AppColors.surface,
                  foregroundColor: actionLabel == 'Acknowledge'
                      ? Colors.white
                      : AppColors.textPrimary,
                  side: actionLabel == 'Assign'
                      ? const BorderSide(color: AppColors.textSecondary)
                      : null,
                ),
                child: Text(actionLabel),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'HIGH':
        return AppColors.error;
      case 'MEDIUM':
        return Colors.orange;
      case 'LOW':
        return AppColors.primaryBlue;
      default:
        return Colors.grey;
    }
  }
}
