import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelock_app/core/values/app_assets.dart';

class OnboardingController extends GetxController {
  var pageIndex = 0.obs;
  late PageController pageController;

  final List<Map<String, String>> onboardingData = [
    {
      'image': AppAssets.onboard1,
      'title': 'Secure jobs. Safe payments.',
      'description':
          'Agree the job terms with confidence. Pay upfront and keep your money protected until the work is complete.',
    },
    {
      'image': AppAssets.onboard2,
      'title': 'Hire the Best Professionals.',
      'description':
          'Find skilled professionals for your needs. Check reviews and ratings to make informed decisions.',
    },
    {
      'image': AppAssets.onboard3,
      'title': 'Get Work Done Fast.',
      'description':
          'Post your job and receive bids from qualified experts. Choose the best fit and get started.',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }
}
