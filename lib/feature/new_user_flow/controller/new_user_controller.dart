import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewUserController extends GetxController {
  final circleNameController = TextEditingController();
  var selectedCategory = ''.obs;
  var invitedCount = 1.obs;
  var inviteCode = "ABC-123".obs;

  void goToInvite() => Get.toNamed('/invite');
  final List<Map<String, String>> categories = [
    {
      'name': 'Family',
      'icon': 'assets/icons/CreateCircleAsset/CreateCircleFamaily.png',
    },
    {
      'name': 'Team',
      'icon': 'assets/icons/CreateCircleAsset/CreateCircleTeam.png',
    },
    {
      'name': 'Gym',
      'icon': 'assets/icons/CreateCircleAsset/CreateCircleGym.png',
    },
    {
      'name': 'Food',
      'icon': 'assets/icons/CreateCircleAsset/CreateCircleFood.png',
    },
    {
      'name': 'Study',
      'icon': 'assets/icons/CreateCircleAsset/CreateCircleStudy.png',
    },
    {
      'name': 'Coffee',
      'icon': 'assets/icons/CreateCircleAsset/CreateCircleCoffe.png',
    },
    {
      'name': 'Hangout',
      'icon': 'assets/icons/CreateCircleAsset/CreateCircleHangOut.png',
    },
    {
      'name': 'Movie',
      'icon': 'assets/icons/CreateCircleAsset/CreateCircleMovie.png',
    },
  ];

  void selectCategory(String name) {
    selectedCategory.value = name;
  }

  @override
  void onClose() {
    circleNameController.dispose();
    super.onClose();
  }
}
