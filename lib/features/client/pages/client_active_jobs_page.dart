import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/core/widgets/common_bottom_home_button.dart';
import 'package:tradelock_app/features/client/widgets/active_job_card.dart';

class ClientActiveJobsPage extends StatefulWidget {
  const ClientActiveJobsPage({super.key});

  @override
  State<ClientActiveJobsPage> createState() => _ClientActiveJobsPageState();
}

class _ClientActiveJobsPageState extends State<ClientActiveJobsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
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
                const Center(child: Text('Pending Jobs')),
                const Center(child: Text('Completed Jobs')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
