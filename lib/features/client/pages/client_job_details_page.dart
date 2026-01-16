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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            // Info Box
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
            _buildDetailItem('Disposal', 'Dispose of old tiles and debris.'),
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

            const SizedBox(height: 30),

            // Applicants / Bids Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Applicants / Bids',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B3B36),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF9C4), // Yellowish background
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '3 Bids',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFBC02D), // Darker yellow text
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Bidders List
            _buildBidCard(
              paramContext: context,
              name: 'James Wilson',
              rating: 4.9,
              reviews: 124,
              timeAgo: '2h ago',
              amount: '£375',
              imagePath: 'assets/images/trad2.png',
            ),
            _buildBidCard(
              paramContext: context,
              name: 'Sarah Chen',
              rating: 4.8,
              reviews: 89,
              timeAgo: '5h ago',
              amount: '£420',
              imagePath: 'assets/images/userRoleBg.png', // Placeholder
            ),
            _buildBidCard(
              paramContext: context,
              name: 'Mike Ross',
              rating: 4.7,
              reviews: 56,
              timeAgo: '1d ago',
              amount: '£350',
              imagePath: 'assets/images/trad2.png', // Placeholder
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: CommonBottomHomeButton(
        onTap: () => context.go('/client-dashboard'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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

  Widget _buildBidCard({
    required BuildContext paramContext,
    required String name,
    required double rating,
    required int reviews,
    required String timeAgo,
    required String amount,
    required String imagePath,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(imagePath),
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B3B36),
                          ),
                        ),
                        Text(
                          amount,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B3B36),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Color(0xFFFBC02D),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$rating',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFBC02D),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '($reviews reviews)  •  $timeAgo',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {
              paramContext.push('/tradesman-public-profile');
            },
            child: const Text(
              'View Profile',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5A6B81), // Blue-greyish button text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
