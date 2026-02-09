import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/core/widgets/common_bottom_home_button.dart';
import 'package:tradelock_app/core/values/app_assets.dart';

class ClientJobDetailsPage extends StatelessWidget {
  const ClientJobDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: Color(0xFF2C3E38),
        showBackButton: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                _buildProfileSection(),
                const SizedBox(height: 20),

                // Job Images
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AppAssets.clientdeshboard, // Placeholder
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AppAssets.clientdeshboard, // Placeholder
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Job Title
                const Text(
                  'Lay Floor Tiles',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B3B36),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Ceramic tile installation in kitchen, approximately 20 square meters.',
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                ),

                const SizedBox(height: 24),

                // Job Price Box
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FCFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Job Price',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1B3B36),
                        ),
                      ),
                      Text(
                        '£750.00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B3B36),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Action Buttons (Add Extras / Release Funds)
                Row(
                  children: [
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            context.push('/release-payment');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2F3E38),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Release Funds',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Info Box (Location, Date, Type)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FCFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      _buildInfoRow(
                        Icons.location_on_outlined,
                        'Location: Manchester, UK',
                      ),
                      const SizedBox(height: 12),
                      _buildInfoRow(Icons.access_time, 'Start Date: ASAP'),
                      const SizedBox(height: 12),
                      _buildInfoRow(
                        Icons.home_outlined,
                        'Property Type: 2-bedroom apartment',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Detailed List
                _buildDetailItem(
                  'Details',
                  'Remove old tiles, level floor, and lay new ceramic tiles with light grey grout.',
                ),
                _buildDetailItem('Access', 'Ground floor, easy access.'),
                _buildDetailItem('Parking', 'Street parking available.'),
                _buildDetailItem(
                  'Disposal',
                  'Dispose of old tiles and debris.',
                ),
                _buildDetailItem(
                  'Materials',
                  'Light grey grout to be provided, tile adhesive supplied if needed.',
                ),
                _buildDetailItem('Timing', 'Complete within 1-2 days.'),
                _buildDetailItem(
                  'Rooms',
                  'Kitchen (approx 20 square meters total).',
                ),
                _buildDetailItem('Rules', 'No work before 8am or after 6pm.'),

                const SizedBox(height: 100), // Space for FAB
              ],
            ),
          ),

          // Chat FAB at bottom right
        ],
      ),
      floatingActionButton: CommonBottomHomeButton(
        onTap: () => context.go('/client-dashboard'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildProfileSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: const AssetImage('assets/images/trad2.png'),
          backgroundColor: Colors.grey[200],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jhon Bryan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B3B36),
              ),
            ),
            const Text(
              'Cleaner',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const Text(
              'Grimsby, UK',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Row(
                  children: List.generate(
                    4,
                    (index) => const Icon(
                      Icons.star,
                      size: 16,
                      color: Color(0xFFFBC02D),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '4.8 (28 Reviews)',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF1B3B36)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem(String label, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: content),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
