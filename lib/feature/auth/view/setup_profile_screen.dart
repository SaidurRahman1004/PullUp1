import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/global_widgets/custom_text_field.dart';
import '../../../core/style/text_styles.dart';
import '../controllers/auth_controller.dart';
import '../widgets/gender_selection_widget.dart';

class SetupProfileScreen extends StatelessWidget {
  const SetupProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
  
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              // Title
              Text(
                AppStrings.setupProfile,
                style: AppTextStyles.heading1.copyWith(
                  fontSize: 32,
                  color: const Color(0xFF1D1D1F),
                ),
              ),
              const SizedBox(height: 10),
              // Subtitle
              Text(
                AppStrings.setupSubtitle,
                style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: authController.pickImage,
                  child: Center(
                    child: Obx(() {
                      if (authController.profileImagePath.value.isEmpty) {
                        return Image.asset(
                          AppAssets.cameraIcon,
                          width: 80,
                          height: 80,
                        );
                      } else {
                        return ClipOval(
                          child: Image.file(
                            File(authController.profileImagePath.value),
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Full Name Field
              CustomTextField(
                controller: authController.fullNameController,
                labelText: AppStrings.fullNameLabel,
                hintText: "Enter your Full name",
                keyboardType: TextInputType.name,
                borderColor: Colors.black,
                focusedBorderColor: Colors.black,
              ),
              const SizedBox(height: 20),

              // Email Field
              CustomTextField(
                controller: authController.emailController,
                labelText: AppStrings.emailLabel,
                hintText: "Enter your Email",
                keyboardType: TextInputType.emailAddress,
                borderColor: Colors.black,
                focusedBorderColor: Colors.black,
              ),
              const SizedBox(height: 20),

              // Gender Selection
              GenderSelectionWidget(
                selectedGender: authController.selectedGender,
                onSelect: authController.selectGender,
              ),

              const SizedBox(height: 40),

              Obx(() => CustomButton(
                text: AppStrings.continueBtn,
                onPressed: authController.isFormValid.value
                    ? () {
                        authController.saveProfile();
                      }
                    : () {
                        Get.snackbar(
                          "Error",
                          "Please fill all fields to continue",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red.withAlpha(25),
                          colorText: Colors.red,
                        );
                      },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
