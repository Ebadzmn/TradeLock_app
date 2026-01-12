import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/core/widgets/custom_text_field.dart';
import 'package:tradelock_app/features/auth/controller/complete_profile_controller.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompleteProfileController());
    const Color primaryDarkColor = Color(0xFF1B3B36);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        showBackButton:
            false, // Image shows no back button usually for this stage, or maybe yes. Let's assume no for "Complete Profile" flow.
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Title
              const Center(
                child: Text(
                  'Complete Profile',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Profile Image Placeholder
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFE0F2F1,
                        ), // Light green tint from image
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black12),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 50,
                        color: Colors.black54,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: controller.pickImage,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Color(0xFF2E3D35), // Dark green color
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Phone Number
              CustomTextField(
                label: 'Phone Number',
                hintText: 'Enter your phone number',
                controller: controller.phoneController,
              ),

              const SizedBox(height: 24),

              // Date of Birth
              CustomTextField(
                label: 'Date of Birth',
                hintText: 'Enter your Date of Birth',
                controller: controller.dobController,
                // In real app, this would be a date picker
              ),

              const SizedBox(height: 24),

              // Address
              CustomTextField(
                label: 'Address',
                hintText: 'Enter your address',
                controller: controller.addressController,
              ),

              const SizedBox(height: 48),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.submit(context),
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
                  child: const Text('Submit'),
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
