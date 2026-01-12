import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/core/widgets/custom_text_field.dart';
import 'package:tradelock_app/features/auth/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    const Color primaryDarkColor = Color(0xFF1B3B36);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        showBackButton: false, // Based on image, no back button visible
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),

              // Title
              const Center(
                child: Text(
                  'Welcome Back to TradeLock',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // Email Field
              CustomTextField(
                label: 'Email',
                hintText: 'Enter your email address',
                controller: controller.emailController,
              ),

              const SizedBox(height: 24),

              // Password Field
              CustomTextField(
                label: 'Password',
                hintText: 'Enter your password',
                controller: controller.passwordController,
                obscureText: true,
              ),

              const SizedBox(height: 16),

              // Remember Me & Forgot Password
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        activeColor: primaryDarkColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: const BorderSide(color: Colors.black26),
                        onChanged: (value) =>
                            controller.toggleRememberMe(value ?? false),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Remember Me',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Handle forgot password
                    },
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Colors.black87,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.login(context),
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
                  child: const Text('Login'),
                ),
              ),

              const SizedBox(height: 24),

              // Register Link
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black87),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push('/register');
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors
                              .black, // Keeping it black/bold as per image
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
