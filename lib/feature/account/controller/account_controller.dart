import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  // Observables for user data
  var displayName = "Wade Warren".obs;
  var phoneNumber = "(316) 555-0116".obs;
  var isNotificationEnabled = true.obs;

  final nameEditController = TextEditingController();

  @override
  void onInit() {
    nameEditController.text = displayName.value;
    super.onInit();
  }

  void updateProfile() {
    displayName.value = nameEditController.text;
    Get.back();
    Get.snackbar("Success", "Profile updated successfully");
  }

  void toggleNotifications(bool value) => isNotificationEnabled.value = value;
}
