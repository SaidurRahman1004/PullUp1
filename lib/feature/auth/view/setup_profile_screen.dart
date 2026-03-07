import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/global_widgets/custom_text_field.dart';
import '../controller/auth_controller.dart';

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
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              const SizedBox(height: 80),
              // Title
              const Text(
                AppStrings.setupProfile,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1D1D1F),
                ),
              ),
              const SizedBox(height: 10),
              // Subtitle
              const Text(
                AppStrings.setupSubtitle,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: () {
                    //ImagePicker
                  },
                  child: Center(
                    child: Image.asset(
                      AppAssets.cameraIcon,
                      width: 80,
                      height: 80,
                    ),
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
                // onChanged: (value) => authController.validateForm(),
              ),
              const SizedBox(height: 20),

              // Email Field
              CustomTextField(
                controller: authController.emailController,
                labelText: AppStrings.emailLabel,
                hintText: "Enter your Email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 40),

              CustomButton(
                text: AppStrings.continueBtn,
                onPressed: () {
                  authController.validateForm();
                  authController.saveProfile();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
