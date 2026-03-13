import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/text_styles.dart';
import '../controllers/auth_controller.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: authController.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Text(
                  AppStrings.welcomeTitle,
                  style: AppTextStyles.heading1.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.welcomeSubtitle,
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 40),

                //Phone Phild
                IntlPhoneField(
                  controller: authController.phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: '000-000-0000',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black, width: 2), // Changed to black as requested for auth inputs
                    ),
                  ),
                  initialCountryCode: 'BD',
                  onChanged: (phone) {
                    authController.validatePhone(phone.completeNumber);
                  },
                ),

                const SizedBox(height: 24),
                CustomButton(
                  text: AppStrings.sendOTP,
                  onPressed: () {
                    if (authController.loginFormKey.currentState!.validate()) {
                      authController.startOtpTimer();
                      Get.to(() => const OTPScreen());
                    }
                  },
                ),
                const SizedBox(height: 24),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.black54,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(text: "By continuing, you agree to our "),
                      TextSpan(
                        text: "Terms of Service",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => debugPrint("Terms Clicked"),
                      ),
                      const TextSpan(text: " and "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => debugPrint("Privacy Clicked"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
