import 'package:evenjr_clone/feature/auth/view/setup_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/text_styles.dart';
import '../controllers/auth_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                AppStrings.enterOTP,
                style: AppTextStyles.heading1.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.otpSubtitle,
                style: AppTextStyles.bodyMedium.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 40),

              Pinput(
                length: 6,
                controller: authController.pinController,
                onCompleted: (pin) => authController.onPinChanged(pin),
                onChanged: (pin) => authController.onPinChanged(pin),
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 56,
                  decoration: BoxDecoration(
                    // User requested black border
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 50,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    // User requested black border
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // --- Timer & Resend Row ---
              Obx(() {
                final seconds = authController.timerSeconds.value;
                final canResend = authController.canResend.value;

                return GestureDetector(
                  onTap: canResend ? authController.resendOTP : null,
                  child: Text(
                    canResend ? "Resend code" : "Resend code in ${seconds}s",
                    style: AppTextStyles.bodyRegular.copyWith(
                      color: canResend ? AppColors.primary : Colors.grey,
                      fontWeight: canResend
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                );
              }),

              const SizedBox(height: 24),

              Obx(
                () => CustomButton(
                  text: AppStrings.verify,
                  onPressed: authController.isPinComplete.value
                      ? () {
                          Get.snackbar("Success", "OTP Verified Successfully!");
                          Get.off(() => const SetupProfileScreen());
                        }
                      : () {
                          Get.snackbar(
                            "Error",
                            "Please enter 6 digit OTP",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red.withAlpha(25),
                          );
                        },
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
