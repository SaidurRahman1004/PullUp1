import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../new_user_flow/view/start_circle_screen.dart';

class AuthController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  var profileImagePath = ''.obs;
  var isFormValid = false.obs;

  //OTP Timer 
  var timerSeconds = 30.obs;
  var canResend = false.obs;
  Timer? _otpTimer;

  void startOtpTimer() {
    timerSeconds.value = 30;
    canResend.value = false;
    _otpTimer?.cancel();
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
        debugPrint('[OTP Timer] Remaining: ${timerSeconds.value}s');
      } else {
        canResend.value = true;
        timer.cancel();
        debugPrint('[OTP Timer] Timer ended — Resend enabled');
      }
    });
  }

  void resendOTP() {
    if (!canResend.value) return;
    debugPrint('[OTP] Resend OTP requested');
    startOtpTimer();
    Get.snackbar(
      'OTP Sent',
      'A new OTP has been sent to your number.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withAlpha(25),
      colorText: Colors.green,
    );
  }

  void validateForm() {
    if (fullNameController.text.isNotEmpty &&
        emailController.text.contains('@')) {
      isFormValid.value = true;
    } else {
      isFormValid.value = false;
    }
  }

  void saveProfile() {
    if (isFormValid.value) {
      Get.snackbar(
        "Success",
        "Profile Setup Complete!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withAlpha(25),
        colorText: Colors.green,
      );
      Get.offAll(() => const StartCircleScreen());
    } else {
      Get.snackbar(
        "Error",
        "Please fill all fields correctly",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withAlpha(25),
        colorText: Colors.red,
      );
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    _otpTimer?.cancel();
    super.onClose();
  }
}
