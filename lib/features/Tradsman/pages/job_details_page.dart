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

            // Job Price Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F9F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Job Price',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF34495E),
                    ),
                  ),
                  Text(
                    '£750.00',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B3B36),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Add Extras Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showAddExtrasDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B3B36),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Add Extras',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
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

  void _showAddExtrasDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Confirm & Send',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF70889E),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Description',
                style: TextStyle(
                  color: Color(0xFF8BA3B7),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  maxLines: 6,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B3B36),
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: '£50.00',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B3B36),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Additional Amount',
                style: TextStyle(
                  color: Color(0xFF8BA3B7),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B3B36),
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: '£50.00',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B3B36),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF3F4F6),
                        foregroundColor: Colors.black87,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF434343),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF32413C),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
