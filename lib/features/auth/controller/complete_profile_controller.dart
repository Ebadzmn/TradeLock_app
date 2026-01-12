import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CompleteProfileController extends GetxController {
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void onClose() {
    phoneController.dispose();
    dobController.dispose();
    addressController.dispose();
    super.onClose();
  }

  void pickImage() {
    // Implement image picking logic
    print("Pick image clicked");
  }

  void submit(BuildContext context) {
    // Validate and submit
    print("Submit profile: ${phoneController.text}");
    context.go('/congratulations');
  }
}
