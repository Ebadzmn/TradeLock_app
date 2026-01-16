import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/core/values/app_assets.dart';
import 'package:tradelock_app/features/client/widgets/job_listing_card.dart';
import 'package:tradelock_app/core/widgets/common_bottom_home_button.dart';

// Placeholder asset path - ensuring we use something that likely exists or use a generic one
// Assuming existing abstract assets usage or just string paths for now.
// IMPORTANT: Adjust image paths to real assets if available. Using a placeholder logic.

class MyJobListingsPage extends StatelessWidget {
  const MyJobListingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: Color(0xFF2C3E38), // Dark Green matching header
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Listings',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B3B36),
              ),
            ),
            const SizedBox(height: 20),

            // Job Cards
            JobListingCard(
              title: 'Garden Landscaping',
              budget: '£2,000',
              timeLeft: '8h 10m',
              location: 'York',
              offers: 4,
              listedTime: '2d ago',
              imagePath: AppAssets.clientdeshboard,
              onEditTap: () => context.push('/edit-listing'),
              onViewBidsTap: () => context.push('/client-job-details'),
            ),
            JobListingCard(
              title: 'Garden Landscaping',
              budget: '£2,000',
              timeLeft: '8h 10m',
              location: 'York',
              offers: 4,
              listedTime: '2d ago',
              imagePath: AppAssets.clientdeshboard,
              onViewBidsTap: () => context.push('/client-job-details'),
            ),

            const SizedBox(height: 20),

            // Add New Job Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  context.push('/add-listing');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C3E38),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Add New Job',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80), // Space for bottom button
          ],
        ),
      ),
      floatingActionButton: CommonBottomHomeButton(
        onTap: () => context.go('/client-dashboard'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
