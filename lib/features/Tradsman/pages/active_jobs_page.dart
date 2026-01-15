import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class ActiveJobsPage extends StatelessWidget {
  const ActiveJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryDarkColor = Color(0xFF1B3B36);
    const Color accentColor = Color(0xFFFDD835); // Yellow indicator

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CommonAppBar(
          backgroundColor: primaryDarkColor,
          showBackButton: true,
        ),
        body: Column(
          children: [
            // TabBar with dark background to match image
            Container(
              color: primaryDarkColor,
              child: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelColor: accentColor,
                unselectedLabelColor: Colors.white,
                indicatorColor: accentColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2,
                dividerColor: Colors.transparent,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Active jobs'),
                  Tab(text: 'Pending'),
                  Tab(text: 'Completed jobs'),
                ],
              ),
            ),

            // TabBarView Content
            Expanded(
              child: TabBarView(
                children: [
                  _buildJobsList('All'),
                  _buildJobsList('Active'),
                  _buildPendingJobsList(),
                  _buildJobsList('Completed'),
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

  Widget _buildPendingJobsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 2, // Mocking 2 pending items as per design
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
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
                          'https://picsum.photos/seed/${index}a/400/300', // Placeholder
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
                          'https://picsum.photos/seed/${index}b/400/300', // Placeholder
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
                  color: const Color(0xFFF9EDB3), // Light yellow bg
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lock_outline, // Using lock icon as placeholder for bag/lock
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
                  onPressed: () => context.push('/pending-job-details'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2F3E38), // Dark Green
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
    );
  }

  Widget _buildJobsList(String type) {
    // Mock data based on image
    final allJobs = [
      {
        'status': 'Pending',
        'title': 'Kitchen repaint – Mrs Smith',
        'date': '18 Nov',
        'time': '08:30–16:30',
        'balance': '£750 remaining',
      },
      {
        'status': 'Completed',
        'title': 'Living room – John Doe',
        'date': '12 Nov',
        'time': '10:30–14:30',
        'balance': '£400 remaining',
      },
      {
        'status': 'Pending',
        'title': 'Bathroom tile – Emily Brown',
        'date': '20 Nov',
        'time': '09:00–17:00',
        'balance': '£1,200 remaining',
      },
      {
        'status': 'Completed',
        'title': 'Garden wall – Mike Ross',
        'date': '05 Nov',
        'time': '08:00–12:00',
        'balance': '£300 remaining',
      },
    ];

    // Filter jobs based on tab type
    final jobs = allJobs.where((job) {
      if (type == 'Active') return job['status'] == 'Pending';
      if (type == 'Completed') return job['status'] == 'Completed';
      return true; // 'All'
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        bool isComplete = job['status'] == 'Completed';

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black.withValues(alpha: 0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
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
                  color: isComplete
                      ? const Color(0xFFE8F5E9) // Light green background
                      : const Color(0xFFFDEBD0),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  job['status']!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isComplete
                        ? const Color(0xFF4CAF50) // Green text
                        : const Color(0xFFD68910),
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

              // Date and Time (with "Completed :" prefix if complete)
              Text(
                '${isComplete ? 'Completed : ' : ''}${job['date']} • ${job['time']}',
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 8),

              // Balance or Payment Label
              Text(
                '${isComplete ? 'Payment: ' : 'Escrow balance: '}${job['balance']}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 16),

              // Action Buttons
              if (isComplete)
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
                )
              else
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => context.push('/job-details'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F3E38),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Job Details',
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
    );
  }
}
