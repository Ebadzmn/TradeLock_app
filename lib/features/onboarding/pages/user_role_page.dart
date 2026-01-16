import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/values/app_assets.dart';
import 'package:tradelock_app/features/onboarding/widgets/user_role_card.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';

import 'package:tradelock_app/features/onboarding/controller/user_role_controller.dart';
import 'package:get/get.dart';

class UserRolePage extends StatelessWidget {
  const UserRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Keep it permanent so we can access selected role later
    final controller = Get.put(UserRoleController(), permanent: true);

    return Scaffold(
      appBar: CommonAppBar(
        height: 80,
        showBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Background Image
          Transform.scale(
            scale: 1.7,
            child: Image.asset(
              AppAssets.userRoleBg,
              fit: BoxFit.contain,
              height: double.infinity,
              width: double.infinity,
              alignment: const Alignment(0.0, -1),
            ),
          ),

          // 2. Dark Overlay to ensure text readability
          Container(
            color: Colors.black.withOpacity(0.35), // Adjust opacity as needed
          ),

          // 3. Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 140),

                  // "Who Are You?" Section
                  const Text(
                    'Who Are You?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please tell us a little bit more about yourself and who you are.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),

                  const SizedBox(height: 32),

                  // Role Cards
                  Obx(
                    () => UserRoleCard(
                      imagePath: AppAssets.onboard1, // Client Image
                      title: 'Client',
                      description:
                          'Book trusted tradesmen, pay upfront safely, and release payment after the job is done.',
                      isSelected: controller.selectedRole.value == 'Client',
                      onTap: () => controller.selectRole('Client'),
                    ),
                  ),
                  Obx(
                    () => UserRoleCard(
                      imagePath: AppAssets.onboard2, // Tradesman Image
                      title: 'Tradesman',
                      description:
                          'Find jobs, bid fast, chat with clients, and get paid securely after completion.',
                      isSelected: controller.selectedRole.value == 'Tradesman',
                      onTap: () => controller.selectRole('Tradesman'),
                    ),
                  ),
                  Obx(
                    () => UserRoleCard(
                      imagePath: AppAssets.onboard3, // Company Image
                      title: 'Company',
                      description:
                          'Post jobs, manage tradesmen, control payments, and monitor teams.',
                      isSelected: controller.selectedRole.value == 'Company',
                      onTap: () => controller.selectRole('Company'),
                    ),
                  ),

                  const Spacer(flex: 1),

                  // "Get Started" Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.selectedRole.value == 'Client') {
                          context.go('/client-dashboard');
                        } else if (controller.selectedRole.value == 'Company') {
                          context.go('/company-dashboard');
                        } else {
                          context.push('/country-selection');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B3B36), // Dark Green
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Get Started'),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
