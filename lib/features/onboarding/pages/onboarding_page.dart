import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:tradelock_app/features/onboarding/widgets/onboarding_content.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(showBackButton: false),
      body: Obx(
        () => SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.onboardingData.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    final data = controller.onboardingData[index];
                    return OnboardingContent(
                      image: data['image']!,
                      title: data['title']!,
                      description: data['description']!,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip Button
                    TextButton(
                      onPressed: () => context.go('/user-role'),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // Dot Indicators
                    Row(
                      children: List.generate(
                        controller.onboardingData.length,
                        (index) => _buildDot(index, controller.pageIndex.value),
                      ),
                    ),

                    // Continue Button
                    TextButton(
                      onPressed: () {
                        if (controller.pageIndex.value ==
                            controller.onboardingData.length - 1) {
                          context.push('/user-role');
                        } else {
                          controller.pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Row(
                        children: [
                          const Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.black, // Or primaryDarkColor
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(int index, int currentIndex) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 6),
      height: 8,
      width: currentIndex == index ? 14 : 8,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? const Color(0xFF4C7A58)
            : Colors.grey[300], // Active: Green, Inactive: Grey
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
