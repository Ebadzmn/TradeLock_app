import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/core/widgets/custom_text_field.dart';
import 'package:tradelock_app/features/auth/controller/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    const Color primaryDarkColor = Color(0xFF1B3B36);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        showBackButton:
            true, // Assuming back button is allowed, though image crops top. Standard pattern implies yes.
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              // Title
              const Center(
                child: Text(
                  'Registration to TradeLock',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Full Name
              CustomTextField(
                label: 'Full Name',
                hintText: 'Enter your full name',
                controller: controller.fullNameController,
              ),

              const SizedBox(height: 24),

              // Email
              CustomTextField(
                label: 'Email',
                hintText: 'Enter your email address',
                controller: controller.emailController,
              ),

              const SizedBox(height: 24),

              // Password
              CustomTextField(
                label: 'Password',
                hintText: 'Enter your password',
                controller: controller.passwordController,
                obscureText: true,
              ),

              const SizedBox(height: 24),

              // Confirm Password
              CustomTextField(
                label: 'Confirm Password',
                hintText: 'Re-enter your password',
                controller: controller.confirmPasswordController,
                obscureText: true,
              ),

              const SizedBox(height: 32),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.signUpWithContext(context),
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
                  child: const Text('Sign Up'),
                ),
              ),

              const SizedBox(height: 24),

              // Terms and Conditions Checkbox
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Obx(
                      () => Checkbox(
                        value: controller.termsAgreed.value,
                        activeColor: primaryDarkColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: const BorderSide(color: Colors.black26),
                        onChanged: controller.toggleTerms,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          controller.toggleTerms(!controller.termsAgreed.value),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            height: 1.4,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'By creating an account or signing you agree to our ',
                            ),
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 48),

              // Login Link
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.black87),
                    ),
                    GestureDetector(
                      onTap: () => controller.goToLogin(context),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
