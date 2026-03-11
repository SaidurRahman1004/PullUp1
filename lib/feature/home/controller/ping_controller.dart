import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PingController extends GetxController {
  var selectedPrompt = "I'm free, anyone down?".obs;
  final customMessageController = TextEditingController();
  var selectedDateFilter = "Now".obs;
  var selectedTimeTab = 0.obs;

  // Time picker values
  var selectedHour = 11.obs; // 1–12
  var selectedMinute = 3.obs; // 0–59
  var selectedAmPm = 0.obs; // 0 = AM, 1 = PM

  // Scroll controllers for the CupertinoPicker columns
  late final FixedExtentScrollController hourScrollCtrl;
  late final FixedExtentScrollController minuteScrollCtrl;
  late final FixedExtentScrollController amPmScrollCtrl;

  final List<String> prompts = [
    "I'm free, anyone down?",
    "Who wants to hang out?",
    "Looking for something to do",
    "Anyone free right now?",
    "Let's do something!",
  ];

  @override
  void onInit() {
    super.onInit();
    // initialItem is 0-based index
    hourScrollCtrl = FixedExtentScrollController(
      initialItem: selectedHour.value - 1,
    );
    minuteScrollCtrl = FixedExtentScrollController(
      initialItem: selectedMinute.value,
    );
    amPmScrollCtrl = FixedExtentScrollController(
      initialItem: selectedAmPm.value,
    );
  }

  void setPrompt(String prompt) => selectedPrompt.value = prompt;

  void setDateFilter(String filter) => selectedDateFilter.value = filter;

  void setTimeTab(int index) => selectedTimeTab.value = index;

  @override
  void onClose() {
    customMessageController.dispose();
    hourScrollCtrl.dispose();
    minuteScrollCtrl.dispose();
    amPmScrollCtrl.dispose();
    super.onClose();
  }
}
