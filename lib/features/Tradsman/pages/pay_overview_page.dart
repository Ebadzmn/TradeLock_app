import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class PayOverviewPage extends StatelessWidget {
  const PayOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color headerBgColor = Color(0xFF23322E);

    // Colors extracted from image
    const Color incomeCardColor = Color(0xFF53645D);
    const Color expensesCardColor = Color(0xFFFFF9E6);
    const Color expensesTextColor = Color(0xFF996515); // Gold/Brown

    // Data
    const double totalExpenses = 23460;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: headerBgColor,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          children: [
            // Date Range Selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Apr 2024 - Mar 2024',
                    style: TextStyle(fontSize: 14, color: Color(0xFF455A64)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Summary Cards
            Row(
              children: [
                Expanded(
                  child: _buildIncomeCard(
                    amount: '£75,000',
                    color: incomeCardColor,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildExpenseCard(
                    amount: '£23,460',
                    bgColor: expensesCardColor,
                    textColor: expensesTextColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Charts Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Donut Chart
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 160,
                        width: 160,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomPaint(
                              size: const Size(160, 160),
                              painter: DonutChartPainter(
                                data: [
                                  ChartData(
                                    const Color(0xFF6E8CB6),
                                    9260,
                                  ), // Materials - Blue
                                  ChartData(
                                    const Color(0xFFFFD54F),
                                    4250,
                                  ), // Fuel - Yellow
                                  ChartData(
                                    const Color(0xFFB39DDB),
                                    2400,
                                  ), // Tools - Purple
                                  ChartData(
                                    const Color(0xFF80CBC4),
                                    2180,
                                  ), // Mileage - Teal
                                  ChartData(
                                    const Color(0xFF6A8A82),
                                    3900,
                                  ), // Subcontractors - Greenish
                                  ChartData(
                                    const Color(0xFFE6C17B),
                                    1470,
                                  ), // Other - Beige
                                ],
                                strokeWidth: 40,
                              ),
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Total Expenses',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '£23,460',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF263238),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Bar Chart
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Income vs Expenses',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF546E7A),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Y-Axis Labels
                          SizedBox(
                            height: 135,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  '£80k',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '£60k',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '£40k',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '£20k',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '£0k',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Chart Area + X-Labels
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 135,
                                  child: Stack(
                                    children: [
                                      // Grid Lines
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: List.generate(5, (index) {
                                          return Container(
                                            height: 1,
                                            color: Colors.grey.withOpacity(0.1),
                                          );
                                        }),
                                      ),
                                      // Bars
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          _buildBar(
                                            amount: '£80k',
                                            heightFactor: 1.0,
                                            color: Colors.black,
                                            availableHeight: 135,
                                          ),
                                          _buildBar(
                                            amount: '£23k',
                                            heightFactor: totalExpenses / 80000,
                                            color: Colors.black,
                                            availableHeight: 135,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // X-Axis Labels
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'Income',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      'Expenses',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Breakdown List
            _buildBreakdownList(),

            const SizedBox(height: 100), // Spacing for FAB
          ],
        ),
      ),
      floatingActionButton: const TradersBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildIncomeCard({required String amount, required Color color}) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.trending_up, color: Colors.white, size: 16),
              SizedBox(width: 4),
              Text(
                'Income',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseCard({
    required String amount,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.receipt_long, color: textColor, size: 16),
              const SizedBox(width: 4),
              Text(
                'Expenses',
                style: TextStyle(color: textColor, fontSize: 13),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar({
    required String amount,
    required double heightFactor,
    required Color color,
    required double availableHeight,
  }) {
    return Container(
      width: 60, // Wider bar as per image
      height: availableHeight * heightFactor,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4), // Slightly rounded corners
      ),
    );
  }

  Widget _buildBreakdownList() {
    return Column(
      children: [
        _buildLegendItem('Materials', '£9,260', const Color(0xFF6E8CB6)),
        _buildLegendItem('Fuel', '£4,250', const Color(0xFFFFD54F)),
        _buildLegendItem('Tools', '£2,400', const Color(0xFFB39DDB)),
        _buildLegendItem('Mileage', '£2,180', const Color(0xFF80CBC4)),
        _buildLegendItem('Subcontractors', '£3,900', const Color(0xFF6A8A82)),
        _buildLegendItem('Other', '£1,470', const Color(0xFFE6C17B)),
      ],
    );
  }

  Widget _buildLegendItem(String label, String amount, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Color(0xFF455A64)),
          ),
          const Spacer(),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF263238),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final Color color;
  final double value;
  ChartData(this.color, this.value);
}

class DonutChartPainter extends CustomPainter {
  final List<ChartData> data;
  final double strokeWidth;
  DonutChartPainter({required this.data, this.strokeWidth = 35});

  @override
  void paint(Canvas canvas, Size size) {
    double total = data.fold(0, (sum, item) => sum + item.value);
    double startAngle = -math.pi / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    for (var item in data) {
      final sweepAngle = (item.value / total) * 2 * math.pi;
      final paint = Paint()
        ..color = item.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
