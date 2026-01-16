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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Secure payment Detail – Mrs Smith',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3B36),
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 16, color: Color(0xFF1B3B36)),
                  children: [
                    TextSpan(
                      text: '£1,500',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' of £3,000 locked in escrow'),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Semicircle Chart
              SizedBox(
                height: 120,
                width: 200,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomPaint(
                      size: const Size(200, 100),
                      painter: SemiCirclePainter(
                        leftColor: yellowColor,
                        rightColor: primaryDarkColor,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          '50%',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B3B36),
                          ),
                        ),
                        Text(
                          'Released',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Linear Progress Bar
              Container(
                height: 8,
                width: 280, // Approximate width
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF1B3B36), // Dark Green
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[100], // Greyish
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Step 1
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Amount to send:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: '£',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryDarkColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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

              const SizedBox(height: 24),

              // Step 2
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Step 2: My Code',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold, // Bold per mockup appearance
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'RU - 55V4', // Placeholder from image
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryDarkColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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

              const SizedBox(height: 24),
              const Text(
                'Time remaining 13:45',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3B36),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Both codes must match to release payment.',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),

              const SizedBox(height: 60),
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
