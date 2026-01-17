import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/Tradsman/widgets/traders_bottom_nav_bar.dart';

class PayOverviewPage extends StatelessWidget {
  const PayOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color headerBgColor = Color(0xFF23322E);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: const CommonAppBar(
        backgroundColor: headerBgColor,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Date Range Selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Apr 2024 - Mar 2024',
                    style: TextStyle(fontSize: 16, color: Color(0xFF455A64)),
                  ),
                  const Icon(Icons.expand_more, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Summary Cards
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard(
                    'Total Income',
                    '£72,500.00',
                    const Color(0xFF263238),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSummaryCard(
                    'Total Expense',
                    '£28,300.00',
                    const Color(0xFF263238),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),



            // Breakdown Card
            Container(
              padding: const EdgeInsets.all(20),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Legend
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            _buildLegendItem(
                              'Materials',
                              '£11,200',
                              const Color(0xFF5C6BC0),
                            ),
                            _buildLegendItem(
                              'Fuel',
                              '£4,150',
                              const Color(0xFFFFCA28),
                            ),
                            _buildLegendItem(
                              'Tools',
                              '£3,000',
                              const Color(0xFFFF7043),
                            ),
                            _buildLegendItem(
                              'Mileage',
                              '£2,450',
                              const Color(0xFFAB47BC),
                            ),
                            _buildLegendItem(
                              'Subcontractors',
                              '£5,500',
                              const Color(0xFF66BB6A),
                            ),
                            _buildLegendItem(
                              'Other',
                              '£2,000',
                              const Color(0xFFFFA726),
                            ),
                          ],
                        ),
                      ),
                      // Chart
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 180,
                                height: 180,
                                child: CustomPaint(
                                  painter: DonutChartPainter(
                                    data: [
                                      ChartData(const Color(0xFF5C6BC0), 11200),
                                      ChartData(const Color(0xFFFFCA28), 4150),
                                      ChartData(const Color(0xFFFF7043), 3000),
                                      ChartData(const Color(0xFFAB47BC), 2450),
                                      ChartData(const Color(0xFF66BB6A), 5500),
                                      ChartData(const Color(0xFFFFA726), 2000),
                                    ],
                                  ),
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
                                    '£28,300',
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Calculated automatically from invoices, receipts, and logged expenses.',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Total Expenses £28,300',
                      style: TextStyle(fontSize: 13, color: Color(0xFF455A64)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
                        // Set Tex Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => context.push('/set-tax'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B3B36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Set Tex',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      floatingActionButton: const TradersBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildSummaryCard(String title, String amount, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 12),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              amount,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, String amount, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, color: Color(0xFF455A64)),
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 13,
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
  DonutChartPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    double total = data.fold(0, (sum, item) => sum + item.value);
    double startAngle = -math.pi / 2;
    double strokeWidth = 35;
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
