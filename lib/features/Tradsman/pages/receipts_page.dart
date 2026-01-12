import 'package:flutter/material.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class ReceiptsPage extends StatelessWidget {
  const ReceiptsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryDarkColor = Color(0xFF1B3B36);

    final List<Map<String, String>> receipts = [
      {
        'date': '02/03/2024',
        'merchant': 'FastFix',
        'category': 'Supplies',
        'amount': '£129.99',
      },
      {
        'date': '02/03/2024',
        'merchant': 'FastFix',
        'category': 'Supplies',
        'amount': '£129.99',
      },
      {
        'date': '02/03/2024',
        'merchant': 'FastFix',
        'category': 'Supplies',
        'amount': '£129.99',
      },
      {
        'date': '28/02/2024',
        'merchant': 'Amazon UK',
        'category': '',
        'amount': '£54.30',
      },
      {
        'date': '02/03/2024',
        'merchant': 'FastFix',
        'category': 'Supplies',
        'amount': '£129.99',
      },
      {
        'date': '28/02/2024',
        'merchant': 'Amazon UK',
        'category': '',
        'amount': '£54.30',
      },
      {
        'date': '02/03/2024',
        'merchant': 'FastFix',
        'category': 'Supplies',
        'amount': '£129.99',
      },
      {
        'date': '02/03/2024',
        'merchant': 'FastFix',
        'category': 'Supplies',
        'amount': '£129.99',
      },
      {
        'date': '02/03/2024',
        'merchant': 'FastFix',
        'category': 'Supplies',
        'amount': '£129.99',
      },
      {
        'date': '28/02/2024',
        'merchant': 'Amazon UK',
        'category': '',
        'amount': '£54.30',
      },
      {
        'date': '02/03/2024',
        'merchant': 'FastFix',
        'category': 'Supplies',
        'amount': '£129.99',
      },
      {
        'date': '28/02/2024',
        'merchant': 'Amazon UK',
        'category': '',
        'amount': '£54.30',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: primaryDarkColor,
        showBackButton: true,
      ),
      body: Column(
        children: [
          // Table Header
          Container(
            color: const Color(0xFFF9F9F4), // Very light yellow/grey
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: const [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Merchant',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 80), // For Delete button space
              ],
            ),
          ),
          // Transaction List
          Expanded(
            child: ListView.builder(
              itemCount: receipts.length,
              itemBuilder: (context, index) {
                final receipt = receipts[index];
                final isEven = index % 2 == 0;
                return Container(
                  color: isEven ? Colors.white : const Color(0xFFF9F9F9),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      // Date
                      Expanded(
                        flex: 2,
                        child: Text(
                          receipt['date']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      // Merchant
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              receipt['merchant']!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1B3B36),
                              ),
                            ),
                            if (receipt['category']!.isNotEmpty)
                              Text(
                                receipt['category']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                          ],
                        ),
                      ),
                      // Amount
                      Expanded(
                        flex: 2,
                        child: Text(
                          receipt['amount']!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B3B36),
                          ),
                        ),
                      ),
                      // Delete Button
                      SizedBox(
                        width: 80,
                        height: 32,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC62828), // Red
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 100), // Space for bottom nav
        ],
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 180,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Home Nav Bar
            const TradersBottomNavBar(),

            // Scan receipt button
            Positioned(
              right: 20,
              bottom: 90,
              child: FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: primaryDarkColor,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Color(0xFFFDD835), width: 1.5),
                ),
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'Scan receipt',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
