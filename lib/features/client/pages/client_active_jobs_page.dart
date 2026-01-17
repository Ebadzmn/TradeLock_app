import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/core/widgets/common_bottom_home_button.dart';
import 'package:tradelock_app/features/client/widgets/active_job_card.dart';

class ClientActiveJobsPage extends StatefulWidget {
  final int initialIndex;
  const ClientActiveJobsPage({super.key, this.initialIndex = 1});

  @override
  State<ClientActiveJobsPage> createState() => _ClientActiveJobsPageState();
}

class _ClientActiveJobsPageState extends State<ClientActiveJobsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: Color(0xFF2C3E38),
        showBackButton: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: const Color(0xFF2C3E38),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: const Color(0xFFECD033),
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: const Color(0xFFECD033),
              unselectedLabelColor: Colors.white,
              dividerColor: Colors.transparent,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              labelPadding: const EdgeInsets.symmetric(horizontal: 16),
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Active jobs'),
                Tab(text: 'Pending'),
                Tab(text: 'Completed jobs'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const Center(child: Text('All Jobs')),
                // Active Jobs Content
                Stack(
                  children: [
                    ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        ActiveJobCard(
                          title: 'Kitchen repaint – Mrs Smith',
                          date: '18 Nov',
                          time: '08:30–16:30',
                          escrowBalance: '£750',
                          onJobDetailsTap: () =>
                              context.push('/client-job-details'),
                          onPayTap: () {
                            // TODO: Navigate to pay
                          },
                        ),
                        ActiveJobCard(
                          title: 'Kitchen repaint – Mrs Smith',
                          date: '18 Nov',
                          time: '08:30–16:30',
                          escrowBalance: '£750',
                          onJobDetailsTap: () =>
                              context.push('/client-job-details'),
                          onPayTap: () {},
                        ),
                        ActiveJobCard(
                          title: 'Kitchen repaint – Mrs Smith',
                          date: '18 Nov',
                          time: '08:30–16:30',
                          escrowBalance: '£750',
                          onJobDetailsTap: () =>
                              context.push('/client-job-details'),
                          onPayTap: () {},
                        ),
                        ActiveJobCard(
                          title: 'Kitchen repaint – Mrs Smith',
                          date: '18 Nov',
                          time: '08:30–16:30',
                          escrowBalance: '£750',
                          onJobDetailsTap: () =>
                              context.push('/client-job-details'),
                          onPayTap: () {},
                        ),
                        const SizedBox(height: 80), // Space for bottom button
                      ],
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
                _buildPendingJobsList(),
                _buildCompletedJobsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingJobsList() {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          itemCount: 2,
          itemBuilder: (context, index) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Images Row
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: AspectRatio(
                            aspectRatio: 4 / 3,
                            child: Image.network(
                              'https://picsum.photos/seed/${index}a/400/300',
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                color: Colors.grey[300],
                                child: const Icon(Icons.image, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: AspectRatio(
                            aspectRatio: 4 / 3,
                            child: Image.network(
                              'https://picsum.photos/seed/${index}b/400/300',
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                color: Colors.grey[300],
                                child: const Icon(Icons.image, color: Colors.grey),
                              ),
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B3B36),
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
                  const SizedBox(height: 12),

                  // Sent by info
                  Row(
                    children: [
                      Icon(
                        Icons.radio_button_checked,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 6),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                          children: const [
                            TextSpan(text: 'Sent by: '),
                            TextSpan(
                              text: 'Grimsby Tile Co.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(text: ' 1 hour ago'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Status Badge
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9EDB3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF5D4037),
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Awaiting your acceptance',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF5D4037),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // View Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => context.push('/client-pending-job-details'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2F3E38),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'View',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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
    );
  }

  Widget _buildCompletedJobsList() {
    // Mock data based on Tradesman design
    final jobs = [
      {
        'status': 'Completed',
        'title': 'Living room – John Doe',
        'date': '12 Nov',
        'time': '10:30–14:30',
        'balance': '£400 remaining',
      },
      {
        'status': 'Completed',
        'title': 'Garden wall – Mike Ross',
        'date': '05 Nov',
        'time': '08:00–12:00',
        'balance': '£300 remaining',
      },
    ];

    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            final job = jobs[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      job['status']!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4CAF50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Title
                  Text(
                    job['title']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B3B36),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Date and Time
                  Text(
                    'Completed : ${job['date']} • ${job['time']}',
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 8),

                  // Payment Label
                  Text(
                    'Payment: ${job['balance']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 54,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF24362F),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'View Invoice',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          height: 54,
                          child: OutlinedButton(
                            onPressed: () => context.push('/rate-review'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF1B3B36),
                              side: const BorderSide(
                                color: Color(0xFF1B3B36),
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Give Review',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
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
    );
  }
}
