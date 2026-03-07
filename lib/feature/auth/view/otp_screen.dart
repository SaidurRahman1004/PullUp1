import 'package:evenjr_clone/feature/auth/view/setup_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/style/app_colors.dart';
import '../controller/auth_controller.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController pinController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();
  bool isComplete = false;

  @override
  void initState() {
    super.initState();

    authController.startOtpTimer();
  }

  @override
  Widget build(BuildContext context) {
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
              const Text(
                AppStrings.enterOTP,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                AppStrings.otpSubtitle,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),

              Pinput(
                length: 6,
                controller: pinController,
                onCompleted: (pin) => setState(() => isComplete = true),
                onChanged: (pin) {
                  if (pin.length < 6) setState(() => isComplete = false);
                },
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 50,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.primary, width: 2),
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
                    style: TextStyle(
                      color: canResend ? AppColors.primary : Colors.grey,
                      fontWeight: canResend
                          ? FontWeight.w600
                          : FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                );
              }),

              const SizedBox(height: 24),

              CustomButton(
                text: AppStrings.verify,
                onPressed: isComplete
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
