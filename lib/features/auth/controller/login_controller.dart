import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rememberMe = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  void login(BuildContext context) {
    // Implement login logic
    print("Login with ${emailController.text} and ${passwordController.text}");
    context.go('/subscription');
  }

  void goToRegister() {
    // Get.toNamed(Routes.REGISTER);
  }
}
