import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/global_widgets/custom_text_field.dart';
import '../../../core/style/app_colors.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Text(
                AppStrings.welcomeTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                AppStrings.welcomeSubtitle,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),
              const CustomTextField(
                labelText: "Phone Number",
                hintText: AppStrings.phoneNumberHint,
                prefixIcon: Icon(Icons.phone_outlined),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: AppStrings.sendOTP,
                onPressed: () {
                  Get.to(() => const OTPScreen());
                },
              ),
              const SizedBox(height: 24),
              const Text(
                AppStrings.termsText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
