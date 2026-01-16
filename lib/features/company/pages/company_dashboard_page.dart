import 'package:flutter/material.dart';
import 'package:tradelock_app/core/values/app_assets.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';

class CompanyDashboardPage extends StatelessWidget {
  const CompanyDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        height: 60,
        showBackButton: false,
        backgroundColor: Color(0xFF2C3E38),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(AppAssets.companyBg, fit: BoxFit.cover),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Company Dashboard',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B3B36),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Grid Menu
                  Row(
                    children: [
                      Expanded(
                        child: _buildMenuCard(
                          icon: Icons.business,
                          label: 'Set Up Jobs',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildMenuCard(
                          icon: Icons.handshake_outlined,
                          label: 'Sublet Jobs',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildMenuCard(
                          icon: Icons.check_box_outlined,
                          label: 'Active Jobs',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildMenuCard(
                          icon: Icons.calendar_today_outlined,
                          label: 'Calendar/Schedule',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildMenuCard(
                    icon: Icons.people_outline,
                    label: 'Manage Team',
                  ), // Full width
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildMenuCard(
                          icon: Icons.assignment_turned_in_outlined,
                          label: 'Completed Job',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildMenuCard(
                          icon: Icons.receipt_long_outlined,
                          label: 'Invoices',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildMenuCard(
                          icon: Icons.search,
                          label: 'Find Jobs',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildMenuCard(
                          icon: Icons.speed,
                          label: 'Mileage',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildMenuCard(
                          icon: Icons.description_outlined,
                          label: 'Documents',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildMenuCard(
                          icon: Icons.receipt_outlined,
                          label: 'Receipts',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1B3B36),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_empty),
            label: 'Clock in/out',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center_outlined),
            label: 'Team Manage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Pay Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F5), // Light grey background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF546E7A), size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF263238),
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFFB0BEC5), size: 20),
        ],
      ),
    );
  }
}
