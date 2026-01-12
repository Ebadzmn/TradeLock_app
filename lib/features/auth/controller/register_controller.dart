import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class RegisterController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final termsAgreed = false.obs;

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void toggleTerms(bool? value) {
    termsAgreed.value = value ?? false;
  }

  void signUp() {
    if (!termsAgreed.value) {
      Get.snackbar('Error', 'Please agree to the Terms and Conditions');
      return;
    }
    // Implement sign up logic
    print("Sign up with ${emailController.text}");
    // Using Get.context or passing context would be needed if strictly following context pattern,
    // but since we are inside GetxController and using go_router, we might need a context.
    // However, RegisterPage calls this. Let's change signature or use navigator key.
    // For now, let's assume valid context is passed or we change this method to return success and UI handles it.
    // Simpler: Just use Get.toNamed if we were using Get routing, but we are using GoRouter.
    // So UI should handle navigation or we pass context.
    // Let's update the method signature in the controller to accept context, or handle it in UI.
  }

  void signUpWithContext(BuildContext context) {
    if (!termsAgreed.value) {
      Get.snackbar('Error', 'Please agree to the Terms and Conditions');
      return;
    }
    context.push('/verify-otp');
  }

  void goToLogin(BuildContext context) {
    // Navigate back to login
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/login');
    }
  }
}
