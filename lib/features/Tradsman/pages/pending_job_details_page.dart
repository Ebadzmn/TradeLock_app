import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class PendingJobDetailsPage extends StatelessWidget {
  const PendingJobDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(titleText: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Status Bar
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9EDB3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.lock_outline, color: Color(0xFF5D4037), size: 20),
                    SizedBox(width: 8),
                    Text(
                      'AWAITING CLIENT PAYMENT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5D4037),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Images
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Image.network(
                          'https://picsum.photos/seed/tiles1/400/300',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(color: Colors.grey[300]),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Image.network(
                          'https://picsum.photos/seed/tiles2/400/300',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(color: Colors.grey[300]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Title and Description
              const Text(
                'Lay Floor Tiles',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3B36),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ceramic tile installation in kitchen, approximately 20 square meters.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),

              // Client Info
              Row(
                children: [
                  const Icon(Icons.account_circle_outlined, color: Colors.grey),
                  const SizedBox(width: 8),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'John Matthews - Client',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B3B36),
                          ),
                        ),
                        TextSpan(text: '  ·  Manchester, UK'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Price Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8E1), // Light beige/yellow
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF9EDB3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Text(
                          '£675.00',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5D4037),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Pending client payment',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8D6E63),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Your fee: You will receive £675.00 once the client completes payment.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF8D6E63),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Action Buttons
              _buildActionButton(
                icon: Icons.notifications_none,
                label: 'Notify client to pay',
                color: const Color(0xFFF9EDB3),
                textColor: const Color(0xFF5D4037),
                hasArrow: true,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildActionButton(
                icon: Icons.mail_outline,
                label: 'Send reminder',
                color: const Color(0xFFF5F5F5),
                textColor: Colors.black87,
                hasArrow: false,
                onTap: () {},
              ),
              const SizedBox(height: 30),

              // Job Details Header
              const Text(
                'Job Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3B36),
                ),
              ),
              const SizedBox(height: 16),

              // Details Content
              const Text(
                'Remove existing tiles, level floor, and lay new tiles',
                style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: 16),
              const Text(
                'High-quality ceramic tiles, light gray color\n'
                '20 square meter kitchen floor area\n'
                'Grout and seal tiles\n'
                'Remove all debris and clean up the worksite',
                style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.8),
              ),
              const SizedBox(height: 20),

              // Schedule & Costs
              _buildDetailRow('Schedule:', 'ASAP, date to be provided after approval'),
              const SizedBox(height: 8),
              _buildDetailRow('£675.00', 'total cost.', isBoldLabel: true),
              const SizedBox(height: 8),
              _buildDetailRow('Payment Schedule:', 'Full payment upfront of £675.00'),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: const TradersBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color textColor,
    required bool hasArrow,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: textColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            if (hasArrow)
              Icon(Icons.chevron_right, color: textColor),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBoldLabel = true}) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Colors.black87),
        children: [
          TextSpan(
            text: '$label ',
            style: TextStyle(
              fontWeight: isBoldLabel ? FontWeight.bold : FontWeight.normal,
              color: const Color(0xFF1B3B36),
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
