import 'package:flutter/material.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color headerBgColor = Color(0xFF23322E);

    final List<Map<String, String>> notifications = [
      {
        'category': 'Payment Received',
        'title': 'Earn 5% Cashback on Grocery Purchases this Weekend!',
        'time': '34 Minutes ago',
      },
      {
        'category': 'Payment Reminder',
        'title': 'Diversify Your Portfolio with Emerging Markets Fund',
        'time': '15 Minutes ago',
      },
      {
        'category': 'Payment Reminder',
        'title': 'Diversify Your Portfolio with Emerging Markets Fund',
        'time': '15 Minutes ago',
      },
      {
        'category': 'Payment Received',
        'title': 'Earn 5% Cashback on Grocery Purchases this Weekend!',
        'time': '34 Minutes ago',
      },
      {
        'category': 'Payment Reminder',
        'title': 'Diversify Your Portfolio with Emerging Markets Fund',
        'time': '15 Minutes ago',
      },
      {
        'category': 'Payment Received',
        'title': 'Earn 5% Cashback on Grocery Purchases this Weekend!',
        'time': '34 Minutes ago',
      },
      {
        'category': 'Payment Reminder',
        'title': 'Diversify Your Portfolio with Emerging Markets Fund',
        'time': '15 Minutes ago',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: headerBgColor,
        showBackButton: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: notifications.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 1, color: Colors.black12),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: Color(0xFF424242),
                    size: 24,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification['category']!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  notification['title']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212121),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification['time']!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: const TradersBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
