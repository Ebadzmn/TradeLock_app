import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/features/auth/controller/verify_otp_controller.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyOtpController());
    const Color primaryDarkColor = Color(0xFF1B3B36);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        showBackButton: true,
        onBackPressed: () => controller.goBack(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 160),

              // Title
              const Text(
                'OTP Sent',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 16),

              // Description
              const Text(
                'Your OTP has been sent to your registered\nemail address. Enter it below to continue.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
              ),

              const SizedBox(height: 48),

              // OTP Input
              _buildOtpInput(controller),

              const SizedBox(height: 24),

              // Timer
              Obx(
                () => Text(
                  'Code expires in: ${controller.timerText.value}',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),

              const SizedBox(height: 48),

              // Verify Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.verifyOtp(context),
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
                  child: const Text('Verify'),
                ),
              ),

              const SizedBox(height: 24),

              // Resend Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't receive any code? ",
                    style: TextStyle(color: Colors.black54),
                  ),
                  GestureDetector(
                    onTap: controller.resendOtp,
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        color: Colors.black, // Bold black as per image
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpInput(VerifyOtpController controller) {
    // Hidden text field to handle input
    return Stack(
      alignment: Alignment.center,
      children: [
        // The visual boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(6, (index) {
            return Obx(() {
              final text = controller.otpText.value;
              final char = index < text.length ? text[index] : '';
              return Container(
                width: 50,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5), // Light grey bg
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  char,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              );
            });
          }),
        ),
        // Invisible text field
        Opacity(
          opacity: 0.0,
          child: TextField(
            controller: controller.otpController,
            autofocus: true,
            keyboardType: TextInputType.number,
            maxLength: 6,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            // No need for onChanged, listener in controller handles it
          ),
        ),
      ],
    );
  }
}
