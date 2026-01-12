import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:tradelock_app/features/onboarding/controller/user_role_controller.dart';

class SubscriptionController extends GetxController {
  final selectedPlanIndex = 1.obs;

  void purchaseAndContinue(BuildContext context) {
    print("Purchase clicked");

    // Check User Role
    try {
      if (Get.isRegistered<UserRoleController>()) {
        final userRoleController = Get.find<UserRoleController>();
        final role = userRoleController.selectedRole.value;

        switch (role) {
          case 'Tradesman':
            context.go('/tradesman-dashboard');
            break;
          case 'Client':
            context.go('/client-dashboard');
            break;
          case 'Company':
            context.go('/company-dashboard');
            break;
          default:
            context.go('/home'); // Fallback
        }
      } else {
        print("UserRoleController not registered");
        context.go('/home');
      }
    } catch (e) {
      print("Navigation error: $e");
      context.go('/home');
    }
  }
}
