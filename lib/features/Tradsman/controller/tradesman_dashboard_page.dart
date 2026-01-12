import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:tradelock_app/core/values/app_assets.dart';
import 'package:tradelock_app/features/Tradsman/controller/tradesman_dashboard_controller.dart';

import 'package:tradelock_app/core/widgets/common_app_bar.dart'; // Ensure import

class TradesmanDashboardPage extends StatelessWidget {
  const TradesmanDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TradesmanDashboardController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CommonAppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(AppAssets.tradsmanBg, fit: BoxFit.cover),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ), // Spacing for transparency effect
                  // Main Container
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFF1E2B27,
                      ).withOpacity(0.95), // Darker slate green
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white24, width: 0.5),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        // Header
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.white24),
                            ),
                          ),
                          child: const Text(
                            'Traders Dashboard',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFDD835), // Yellowish color
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // Grid Content
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: _buildDashboardItem(
                                        'Community Fund',
                                        'Protection for toold, theft & disputes',
                                        onTap: () =>
                                            context.push('/community-fund'),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: _buildDashboardItem(
                                        'Set Up Jobs',
                                        '',
                                        isSingleLine: true,
                                        onTap: () =>
                                            context.push('/setup-jobs'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: _buildDashboardItem(
                                        'Calendar',
                                        '',
                                        isSingleLine: true,
                                        onTap: () => context.push('/calendar'),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: _buildDashboardItem(
                                        'Network Chat',
                                        '',
                                        isSingleLine: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: _buildDashboardItem(
                                        'Active Jobs\n3',
                                        '',
                                        isSingleLine: false,
                                        onTap: () =>
                                            context.push('/active-jobs'),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: _buildDashboardItem(
                                        'Completed Jobs\n2',
                                        '',
                                        isSingleLine: false,
                                        onTap: () =>
                                            context.push('/active-jobs'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: _buildDashboardItem(
                                        'Receipts',
                                        '',
                                        isSingleLine: true,
                                        onTap: () => context.push('/receipts'),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: _buildDashboardItem(
                                        'Invoices',
                                        '',
                                        isSingleLine: true,
                                        onTap: () => context.push('/invoices'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.bottomNavIndex.value,
          onTap: (index) {
            if (index == 4) {
              context.push('/profile');
            } else if (index == 2) {
              context.push('/invoices');
            } else if (index == 3) {
              context.push('/pay-overview');
            } else if (index == 1) {
              context.push('/trade-chat');
            } else {
              controller.changeBottomNavIndex(index);
            }
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF1B3B36),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Find jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: 'Invoices',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: 'Pay Overview',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(
    String title,
    String subtitle, {
    bool isSingleLine = false,
    VoidCallback? onTap,
  }) {
    // Check if title has a number (e.g. "Active Jobs\n3")
    final hasNumber = title.contains('\n');
    final titleParts = hasNumber ? title.split('\n') : [title];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF2F3E38), // Lighter green for buttons
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white24, width: 0.5),
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Hug content
          children: [
            if (hasNumber) ...[
              Text(
                titleParts[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                titleParts[1],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ] else ...[
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
            if (subtitle.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  height: 1.1,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
