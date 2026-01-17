import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/core/widgets/common_bottom_home_button.dart';

class ClientViewBidsPage extends StatelessWidget {
  const ClientViewBidsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryDarkColor = Color(0xFF1B3B36);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: primaryDarkColor,
        showBackButton: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Images
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: AspectRatio(
                          aspectRatio: 1.1,
                          child: Image.network(
                            'https://picsum.photos/seed/tiles1/400/300',
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                Container(color: Colors.grey[300]),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: AspectRatio(
                          aspectRatio: 1.1,
                          child: Image.network(
                            'https://picsum.photos/seed/tiles2/400/300',
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                Container(color: Colors.grey[300]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Title
                const Text(
                  'Lay Floor Tiles',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryDarkColor,
                  ),
                ),
                const SizedBox(height: 8),

                // Description
                const Text(
                  'Ceramic tile installation in kitchen, approximately 20 square meters.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),

                // Info Box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F8FA), // Light blue-grey
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      _buildInfoRow(Icons.location_on_outlined, 'Location: Manchester, UK'),
                      const SizedBox(height: 12),
                      _buildInfoRow(Icons.access_time, 'Start Date: ASAP'),
                      const SizedBox(height: 12),
                      _buildInfoRow(Icons.home_outlined, 'Property Type: 2-bedroom apartment'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Bullet Points
                _buildBulletPoint('Details:', 'Remove old tiles, level floor, and lay new ceramic tiles with light grey grout.'),
                _buildBulletPoint('Access:', 'Ground floor, easy access.'),
                _buildBulletPoint('Parking:', 'Street parking available.'),
                _buildBulletPoint('Disposal:', 'Dispose of old tiles and debris.'),
                _buildBulletPoint('Materials:', 'Light grey grout to be provided, tile adhesive supplied if needed.'),
                _buildBulletPoint('Timing:', 'Complete within 1-2 days.'),
                _buildBulletPoint('Rooms:', 'Kitchen (approx 20 square meters total).'),
                _buildBulletPoint('Rules:', 'No work before 8am or after 6pm.'),

                const SizedBox(height: 24),

                // Applicants / Bids Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Applicants / Bids',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryDarkColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9EDB3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '3 Bids',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5D4037),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Bids List
                _buildBidCard(
                  name: 'James Wilson',
                  rating: '4.9',
                  reviews: '124 reviews',
                  timeAgo: '2h ago',
                  price: '£375',
                  imageIndex: 1,
                  onViewProfile: () => context.push('/tradesman-public-profile'),
                ),
                _buildBidCard(
                  name: 'Sarah Chen',
                  rating: '4.8',
                  reviews: '89 reviews',
                  timeAgo: '5h ago',
                  price: '£420',
                  imageIndex: 2,
                  onViewProfile: () => context.push('/tradesman-public-profile'),
                ),
                _buildBidCard(
                  name: 'Mike Ross',
                  rating: '4.7',
                  reviews: '56 reviews',
                  timeAgo: '1d ago',
                  price: '£350',
                  imageIndex: 3,
                  onViewProfile: () => context.push('/tradesman-public-profile'),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: CommonBottomHomeButton(
                onTap: () => context.go('/client-dashboard'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[700]),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String label, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.4)),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
                children: [
                  TextSpan(
                    text: '$label ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: text),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBidCard({
    required String name,
    required String rating,
    required String reviews,
    required String timeAgo,
    required String price,
    required int imageIndex,
    required VoidCallback onViewProfile,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=$imageIndex'),
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
                      price,
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
                    const Icon(Icons.star, size: 16, color: Color(0xFFFBC02D)),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFBC02D),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '($reviews)',
                      style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '•  $timeAgo',
                      style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: onViewProfile,
                  child: const Text(
                    'View Profile',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5D7E75), // Muted teal color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
