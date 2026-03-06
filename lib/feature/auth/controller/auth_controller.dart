import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../new_user_flow/view/start_circle_screen.dart';

class AuthController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  var profileImagePath = ''.obs;
  var isFormValid = false.obs;

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
    super.onClose();
  }
}
