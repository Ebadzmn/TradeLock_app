import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/auth/controller/congratulations_controller.dart';

class CongratulationsPage extends StatelessWidget {
  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CongratulationsController());
    const Color primaryDarkColor = Color(0xFF1B3B36);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(showBackButton: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // Success Icon with Confetti (Simplified representation or use Asset)
              // Since I don't have the exact confetti asset, I'll use a large check icon
              // and maybe similar colors for decoration if possible, or just the main check.
              // For "same to same", strictly I'd need the asset. I will assume a placeholder
              // stack to mimic it or just the checkmark in a circle if asset unavail.
              // User uploaded image shows a specific graphic. I'll use a Container with Icon for now.
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(0xFF2E3D35), // Dark green circle
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, size: 60, color: Colors.white),
              ),

              // Note: Confetti surrounding it involves custom painting or assets.
              // I will leave it as just the main focal point for code simplicity unless requested to draw confetti.
              const SizedBox(height: 32),

              // Title
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You're In!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text("🎉", style: TextStyle(fontSize: 24)),
                ],
              ),

              const SizedBox(height: 16),

              // Description
              const Text(
                'Your account is ready. Book jobs, pay securely, and relax\nwhile the work gets done.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // Get Started Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.getStarted(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryDarkColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Get Started'),
                ),
              ),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
