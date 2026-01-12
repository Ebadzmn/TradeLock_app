import 'package:flutter/material.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class JobDetailsPage extends StatelessWidget {
  const JobDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryDarkColor = Color(0xFF1B3B36);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: primaryDarkColor,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=1000&auto=format&fit=crop',
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Jhon Bryan',
                      style: TextStyle(
                        fontSize: 22,
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
                      children: const [
                        Icon(Icons.star, color: Color(0xFFFDD835), size: 18),
                        Icon(Icons.star, color: Color(0xFFFDD835), size: 18),
                        Icon(Icons.star, color: Color(0xFFFDD835), size: 18),
                        Icon(Icons.star, color: Color(0xFFFDD835), size: 18),
                        Icon(Icons.star, color: Color(0xFFFDD835), size: 18),
                        SizedBox(width: 4),
                        Text(
                          '4.8 (28 Reviews)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Image Gallery
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1513694203232-719a280e022f?q=80&w=1000&auto=format&fit=crop',
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1581242163695-19d0acfd486f?q=80&w=1000&auto=format&fit=crop',
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Job Title and Description
            const Text(
              'Lay Floor Tiles',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B3B36),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Ceramic tile installation in kitchen, approximately 20 square meters.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),

            // Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F9F9),
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

            // Details List
            _buildDetailBullet(
              'Details: ',
              'Remove old tiles, level floor, and lay new ceramic tiles with light grey grout.',
            ),
            _buildDetailBullet('Access: ', 'Ground floor, easy access.'),
            _buildDetailBullet('Parking: ', 'Street parking available.'),
            _buildDetailBullet(
              'Disposal: ',
              'Dispose of old tiles and debris.',
            ),
            _buildDetailBullet(
              'Materials: ',
              'Light grey grout to be provided, tile adhesive supplied if needed.',
            ),
            _buildDetailBullet('Timing: ', 'Complete within 1-2 days.'),
            _buildDetailBullet(
              'Rooms: ',
              'Kitchen (approx 20 square meters total).',
            ),
            _buildDetailBullet('Rules: ', 'No work before 8am or after 6pm.'),

            const SizedBox(height: 100), // Space for bottom nav bar
          ],
        ),
      ),
      floatingActionButton: const TradersBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 24, color: const Color(0xFF1B3B36)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Color(0xFF34495E)),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailBullet(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Icon(Icons.circle, size: 6, color: Colors.black87),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text: label,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
