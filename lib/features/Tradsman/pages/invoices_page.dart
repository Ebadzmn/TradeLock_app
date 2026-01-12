import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class InvoicesPage extends StatelessWidget {
  const InvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color headerBgColor = Color(0xFF23322E);

    final List<Map<String, String>> invoices = [
      {
        'id': 'INV-00124',
        'client': 'Sarah Thompson',
        'job': 'Hallway & Lounge',
        'amount': '£ 570.00',
        'date': '29 Nov 2025',
        'status': 'PAID',
      },
      {
        'id': 'INV-00123',
        'client': 'J. Parker',
        'job': 'Exterior Painting',
        'amount': '£ 1,250.00',
        'date': '27 Nov 2025',
        'status': 'PAID',
      },
      {
        'id': 'INV-00122',
        'client': 'Oakridge Ltd',
        'job': 'Office Repaint',
        'amount': '£ 3,850.00',
        'date': '25 Nov 2025',
        'status': 'PAID',
      },
      {
        'id': 'INV-00121',
        'client': 'M. Davies',
        'job': 'Kitchen Tiling',
        'amount': '£ 420.00',
        'date': '22 Nov 2025',
        'status': 'PAID',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: headerBgColor,
        showBackButton: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Invoices',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: invoices.length,
              itemBuilder: (context, index) {
                final inv = invoices[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: GestureDetector(
                    onTap: () => context.push('/invoice-details'),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                inv['id']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF212121),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                inv['client']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF424242),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                inv['job']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    inv['status']!,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1B3B36),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.check,
                                    size: 14,
                                    color: Color(0xFF1B3B36),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                inv['amount']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF212121),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                inv['date']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: const TradersBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
