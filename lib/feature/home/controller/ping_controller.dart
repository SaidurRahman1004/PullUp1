import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PingController extends GetxController {
  var selectedPrompt = "I'm free, anyone down?".obs;
  final customMessageController = TextEditingController();
  var selectedDateFilter = "Now".obs;
  var selectedTimeTab = 0.obs;

  // Time picker values
  var selectedHour = 11.obs;
  var selectedMinute = 3.obs;
  var selectedAmPm = 'AM'.obs;

  final List<String> prompts = [
    "I'm free, anyone down?",
    "Who wants to hang out?",
    "Looking for something to do",
    "Anyone free right now?",
    "Let's do something!",
  ];

  void setPrompt(String prompt) => selectedPrompt.value = prompt;

  void setDateFilter(String filter) => selectedDateFilter.value = filter;

  void setTimeTab(int index) => selectedTimeTab.value = index;

  @override
  void onClose() {
    customMessageController.dispose();
    super.onClose();
  }
}
