import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:tradelock_app/core/values/app_assets.dart';
import 'package:tradelock_app/features/Tradsman/controller/tradesman_dashboard_controller.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';

class TradesmanDashboardPage extends StatelessWidget {
  const TradesmanDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TradesmanDashboardController());
    const Color primaryDarkColor = Color(0xFF1B3B36);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(showBackButton: false),
      body: Stack(
        children: [
          // Hero Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Image.asset(AppAssets.trad2bg, fit: BoxFit.cover),
          ),

          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 220), // Expose some part of the image
                // Card System
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Column(
                      children: [
                        // Traders Dashboard Header
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          color: primaryDarkColor,
                          child: const Text(
                            'Traders Dashboard',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // Grid Content
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              // Row 1
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: _buildDashboardItem(
                                        title: 'Community Fund',
                                        subtitle:
                                            'Protection for tools, theft & disputes',
                                        onTap: () =>
                                            context.push('/community-fund'),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: _buildDashboardItem(
                                        title: 'Set Up Jobs',
                                        onTap: () =>
                                            context.push('/setup-jobs'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Row 2
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: _buildDashboardItem(
                                        title: 'Calendar',
                                        onTap: () => context.push('/calendar'),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: _buildDashboardItem(
                                        title: 'Network Chat',
                                        onTap: () => context.push(
                                          '/trade-chat',
                                        ), // Assuming route
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Row 3
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: _buildDashboardItem(
                                        title: 'Active Jobs',
                                        badgeCount: 3,
                                        badgeColor: const Color(
                                          0xFF556B2F,
                                        ), // Olive green
                                        onTap: () =>
                                            context.push('/active-jobs'),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: _buildDashboardItem(
                                        title: 'Completed Jobs',
                                        badgeCount: 2,
                                        badgeColor: primaryDarkColor,
                                        onTap: () => context.push(
                                          '/active-jobs',
                                        ), // Usually same page with tab
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Row 4
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: _buildDashboardItem(
                                        title: 'Mileage',
                                        onTap: () => context.push('/mileage'),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: _buildDashboardItem(
                                        title: 'Receipts',
                                        onTap: () => context.push('/receipts'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Row 5
                              SizedBox(
                                width: double.infinity,
                                child: _buildDashboardItem(
                                  title: 'Documents',
                                  // onTap: () => context.push('/documents'), // Placeholder
                                ),
                              ),
                              const SizedBox(height: 40), // Bottom padding
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.bottomNavIndex.value,
          onTap: (index) {
            if (index == 0) {
              context.push('/find-jobs');
            } else if (index == 4) {
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
          selectedItemColor: Colors.grey,
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

  Widget _buildDashboardItem({
    required String title,
    String? subtitle,
    int? badgeCount,
    Color? badgeColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF1B3B36),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (subtitle != null && subtitle.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        height: 1.2,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (badgeCount != null)
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: badgeColor ?? const Color(0xFF1B3B36),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  badgeCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
