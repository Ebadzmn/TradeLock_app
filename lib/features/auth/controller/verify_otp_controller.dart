import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class VerifyOtpController extends GetxController {
  final otpController = TextEditingController();
  final otpText = ''.obs; // Observable to track text changes
  final timerText = '02:59'.obs;
  Timer? _timer;
  int _remainingSeconds = 179;

  @override
  void onInit() {
    super.onInit();
    otpController.addListener(() {
      otpText.value = otpController.text;
    });
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpController.dispose();
    super.onClose();
  }

  void startTimer() {
    _remainingSeconds = 179;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
        final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
        timerText.value = '$minutes:$seconds';
      } else {
        timer.cancel();
      }
    });
  }

  void verifyOtp(BuildContext context) {
    if (otpController.text.length < 6) {
      Get.snackbar('Error', 'Please enter a valid 6-digit OTP');
      return;
    }
    // Implement verification logic
    print("Verifying OTP: ${otpController.text}");
    context.go('/complete-profile');
  }

  void resendOtp() {
    print("Resending OTP");
    startTimer();
  }

  void goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    }
  }
}
