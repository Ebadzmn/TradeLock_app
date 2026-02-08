import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class FindJobsPage extends StatelessWidget {
  const FindJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryDarkColor = Color(0xFF1B3B36);
    const Color accentYellow = Color(0xFFFFD700);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: const CommonAppBar(
          backgroundColor: primaryDarkColor,
          showBackButton: true,
        ),
        body: Column(
          children: [
            // Search and Filter Header
            Container(
              color: primaryDarkColor,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                children: [
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter postcode or town',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 24,
                            width: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.filter_list, color: Colors.grey),
                          const SizedBox(width: 4),
                          const Text(
                            'Filter',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          const SizedBox(width: 12),
                        ],
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // TabBar
                  TabBar(
                    indicatorColor: accentYellow,
                    indicatorWeight: 3,
                    labelColor: accentYellow,
                    unselectedLabelColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    dividerColor: Colors.transparent,
                    tabs: const [
                      Tab(text: 'All'),
                      Tab(text: 'My Bids'),
                      Tab(text: 'Saved'),
                    ],
                  ),
                ],
              ),
            ),

            // Job List
            Expanded(
              child: TabBarView(
                children: [
                  // All Jobs Tab
                  ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildJobCard(
                        imageUrl: 'https://picsum.photos/seed/kitchen/400/300',
                        title: 'Plumbing Repairs',
                        budget: '£1,500',
                        timeLeft: '1d 3h left',
                        location: 'Liverpool',
                        distance:
                            '1,200', // Assuming this is distance or similar metric from image
                        hasSubletTag: false,
                        context: context,
                      ),
                      const SizedBox(height: 16),
                      _buildJobCard(
                        imageUrl: 'https://picsum.photos/seed/drywall/400/300',
                        title: 'Drywall Installation',
                        budget: '£950',
                        timeLeft: '3d 8h left',
                        location: 'Bristol',
                        distance:
                            '£700', // Matching image value, though inconsistent with top card
                        hasSubletTag: true,
                        context: context,
                      ),
                      const SizedBox(height: 16),
                      _buildJobCard(
                        imageUrl: 'https://picsum.photos/seed/drywall2/400/300',
                        title: 'Drywall Installation',
                        budget: '£950',
                        timeLeft: '3d 8h left',
                        location: 'Bristol',
                        distance: '£700',
                        hasSubletTag: true,
                        context: context,
                      ),
                      const SizedBox(height: 16),
                      _buildJobCard(
                        imageUrl: 'https://picsum.photos/seed/kitchen2/400/300',
                        title: 'Plumbing Repairs',
                        budget: '£1,500',
                        timeLeft: '1d 3h left',
                        location: 'Liverpool',
                        distance: '1,200',
                        hasSubletTag: false,
                        context: context,
                      ),
                      const SizedBox(height: 16),
                      _buildJobCard(
                        imageUrl: 'https://picsum.photos/seed/kitchen3/400/300',
                        title: 'Plumbing Repairs',
                        budget: '£1,500',
                        timeLeft: '1d 3h left',
                        location: 'Liverpool',
                        distance: '1,200',
                        hasSubletTag: false,
                        context: context,
                      ),
                      const SizedBox(height: 80), // Bottom padding for FAB
                    ],
                  ),
                  // My Bids Tab
                  ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildBidCard(
                        imageUrl: 'https://picsum.photos/seed/kitchen/400/300',
                        title: 'Plumbing Repairs',
                        location: 'Liverpool',
                        bidAmount: '£1,200',
                        status: 'PENDING',
                        timeLeft: '2d 3h left left',
                        context: context,
                      ),
                      const SizedBox(height: 16),
                      _buildBidCard(
                        imageUrl: 'https://picsum.photos/seed/garden/400/300',
                        title: 'Garden Landscaping',
                        location: 'York',
                        bidAmount: '£1,800',
                        status: 'ACCEPTED',
                        context: context,
                      ),
                      const SizedBox(height: 16),
                      _buildBidCard(
                        imageUrl: 'https://picsum.photos/seed/garden2/400/300',
                        title: 'Garden Landscaping',
                        location: 'York',
                        bidAmount: '£1,800',
                        status: 'ACCEPTED',
                        context: context,
                      ),
                      const SizedBox(height: 16),
                      _buildBidCard(
                        imageUrl: 'https://picsum.photos/seed/roof/400/300',
                        title: 'Roofing Services',
                        location: 'Sheffield',
                        bidAmount: '£3,200',
                        status: 'PENDING',
                        timeLeft: '3d 8h left left',
                        context: context,
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                  // Saved Tab
                  ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildJobCard(
                        imageUrl: 'https://picsum.photos/seed/kitchen/400/300',
                        title: 'Plumbing Repairs',
                        budget: '£1,500',
                        timeLeft: '1d 3h left',
                        location: 'Liverpool',
                        distance: '1,200',
                        hasSubletTag: false,
                        context: context,
                      ),
                      const SizedBox(height: 16),
                      _buildJobCard(
                        imageUrl: 'https://picsum.photos/seed/drywall/400/300',
                        title: 'Drywall Installation',
                        budget: '£950',
                        timeLeft: '3d 8h left',
                        location: 'Bristol',
                        distance: '£700',
                        hasSubletTag: true,
                        context: context,
                      ),
                      const SizedBox(height: 16),
                      _buildJobCard(
                        imageUrl: 'https://picsum.photos/seed/kitchen3/400/300',
                        title: 'Plumbing Repairs',
                        budget: '£1,500',
                        timeLeft: '1d 3h left',
                        location: 'Liverpool',
                        distance: '1,200',
                        hasSubletTag: false,
                        context: context,
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: const TradersBottomNavBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _buildJobCard({
    required String imageUrl,
    required String title,
    required String budget,
    required String timeLeft,
    required String location,
    required String distance,
    required bool hasSubletTag,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, color: Colors.grey),
                  ),
                ),
              ),
              if (hasSubletTag)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFD700),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Sublet',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B3B36),
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    children: [
                      const TextSpan(text: 'Budget: '),
                      TextSpan(
                        text: budget,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(text: ' $timeLeft'),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      location,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.check, size: 12, color: Colors.grey),
                    const SizedBox(width: 2),
                    Text(
                      distance,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bid Button
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.push('/job-bidding');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00382B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  minimumSize: const Size(0, 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Bid Now',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBidCard({
    required String imageUrl,
    required String title,
    required String location,
    required String bidAmount,
    required String status,
    String? timeLeft,
    required BuildContext context,
  }) {
    final isPending = status == 'PENDING';
    final statusColor = isPending
        ? const Color(0xFFF9EDB3)
        : const Color(0xFF004D40);
    final statusTextColor = isPending ? const Color(0xFF8D6E63) : Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 80,
                width: 80,
                color: Colors.grey[300],
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B3B36),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  'Bid: $bidAmount',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B3B36),
                  ),
                ),
              ],
            ),
          ),

          // Status & Button
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: statusTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              if (timeLeft != null) ...[
                Text(
                  timeLeft,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
              ],
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Bid details',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.chevron_right, size: 16, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
