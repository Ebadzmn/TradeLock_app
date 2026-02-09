import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/core/widgets/common_bottom_home_button.dart';
import 'dart:math' as math;

class ReleasePaymentPage extends StatelessWidget {
  const ReleasePaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryDarkColor = Color(0xFF2C3E38);
    const Color yellowColor = Color(0xFFECD033);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: primaryDarkColor,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Secure payment Detail – Mrs Smith',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B3B36),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 18, color: Color(0xFF5D726F)),
                    children: [
                      TextSpan(
                        text: '£1,500 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'of £3,000 locked in escrow'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Semicircle Chart
              Center(
                child: SizedBox(
                  height: 140,
                  width: 220,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomPaint(
                        size: const Size(220, 110),
                        painter: SemiCirclePainter(
                          leftColor: yellowColor,
                          rightColor: primaryDarkColor,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              '50%',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1B3B36),
                              ),
                            ),
                            Text(
                              'Released',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF5D726F),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Linear Progress Bar
              Center(
                child: Container(
                  height: 12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB0BEC5).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF1B3B36),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Remaining / Released Row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Remaining',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3E38),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '£ 50',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF70889E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Released',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3E38),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '£ 150',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF70889E),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'Available to release : £ 50',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3B36),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF32413C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Send Code',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                'amount',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3B36),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: '£ 50',
                  hintStyle: const TextStyle(
                    color: Color(0xFF1B3B36),
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Available to release : £ 50',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3B36),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF32413C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Confirm & Release Payment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
              const Center(
                child: Text(
                  'Time remaining 13:45',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B3B36),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Center(
                child: Text(
                  'Both codes must match to release payment.',
                  style: TextStyle(fontSize: 13, color: Color(0xFF434343)),
                ),
              ),

              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
      floatingActionButton: CommonBottomHomeButton(
        onTap: () => context.go('/client-dashboard'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SemiCirclePainter extends CustomPainter {
  final Color leftColor;
  final Color rightColor;

  SemiCirclePainter({required this.leftColor, required this.rightColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.butt; // Flat ends to join neatly

    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;

    // Draw Right Arc (0 to -90 degrees, but in radians)
    // Actually typically 0 is 3 o'clock. -pi is 9 o'clock.
    // We want a full semi circle from 9 o'clock (180 deg / pi rad) to 3 o'clock (0 / 2pi).

    // Left Arc (Yellow): Starts at 180 degrees (pi), sweep 90 degrees (pi/2) clockwise?
    // Angles in drawArc: 0 is Right (East), pi/2 is Bottom (South), pi is Left (West), 3pi/2 is Top (North).
    // We want the semi-circle on TOP. So from Pi (West) to 0 (East).

    // Left Half: From Pi to 3Pi/2 (Top).
    // Right Half: From 3Pi/2 to 0 (Right).

    // Actually typically:
    // Left side: Pi to 3*Pi/2 (-Pi/2 sweep? No sweep is positive for clockwise)
    // Let's use negative start angles.
    // Top is -Pi/2.
    // Left is -Pi.
    // Right is 0.

    // Left segment (Yellow): -Pi to -Pi/2
    paint.color = leftColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi, // Start at 9 o'clock
      math.pi / 2, // Sweep 90 degrees clockwise to 12 o'clock
      false,
      paint,
    );

    // Right segment (Green): -Pi/2 to 0
    paint.color = rightColor;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi * 1.5, // Start at 12 o'clock (270 deg or -90 deg)
      math.pi / 2, // Sweep 90 degrees to 3 o'clock
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
