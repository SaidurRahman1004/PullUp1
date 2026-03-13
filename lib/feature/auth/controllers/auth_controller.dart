import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../new_user_flow/view/start_circle_screen.dart';

class AuthController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final pinController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  var isPhoneValid = false.obs;
  var isPinComplete = false.obs;
  var isFormValid = false.obs;

  var selectedGender = ''.obs;

  var profileImagePath = ''.obs;
  final ImagePicker _picker = ImagePicker();

  //OTP Timer 
  var timerSeconds = 30.obs;
  var canResend = false.obs;
  Timer? _otpTimer;

  @override
  void onInit() {
    super.onInit();
    fullNameController.addListener(validateForm);
    emailController.addListener(validateForm);
  }

  void validatePhone(String phone) {
    isPhoneValid.value = phone.isNotEmpty;
  }

  void onPinChanged(String pin) {
    isPinComplete.value = pin.length == 6;
  }

  void startOtpTimer() {
    timerSeconds.value = 30;
    canResend.value = false;
    _otpTimer?.cancel();
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }

  void resendOTP() {
    if (!canResend.value) return;
    startOtpTimer();
    Get.snackbar(
      'OTP Sent',
      'A new OTP has been sent to your number.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withAlpha(25),
      colorText: Colors.green,
    );
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;
    }
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
    validateForm();
  }

  void validateForm() {
    if (fullNameController.text.isNotEmpty &&
        emailController.text.contains('@') &&
        selectedGender.value.isNotEmpty) {
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
    phoneController.dispose();
    pinController.dispose();
    _otpTimer?.cancel();
    super.onClose();
  }
}
