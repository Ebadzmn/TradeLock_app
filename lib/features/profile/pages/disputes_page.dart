import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class DisputesPage extends StatelessWidget {
  const DisputesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color headerBgColor = Color(0xFF23322E);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: headerBgColor,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDisputeCard(
              timestamp: '2hours ago',
              title: 'Dispute Title - Stuck Money',
              description:
                  'The payment for this job has been deducted but is still held in escrow and has not been released to my earnings. The job has been completed, but the funds remain stuck. Please review and assist in resolving this issue.',
            ),
            const SizedBox(height: 16),
            _buildDisputeCard(
              timestamp: '2hours ago',
              title: 'Dispute Title - Stuck Money',
              description:
                  'The payment for this job has been deducted but is still held in escrow and has not been released to my earnings. The job has been completed, but the funds remain stuck. Please review and assist in resolving this issue.',
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 180,
              height: 45,
              child: ElevatedButton(
                onPressed: () => context.push('/create-dispute'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: headerBgColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Create Dispute',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 120), // Spacing for floating button
          ],
        ),
      ),
      floatingActionButton: const TradersBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildDisputeCard({
    required String timestamp,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              timestamp,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 40,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Payment failed',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'An error occurred while processing your transaction. Please try again or use a different payment method.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 4),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: const Text(
                          'Try Again',
                          style: TextStyle(color: Colors.white, fontSize: 6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF424242),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF616161),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
