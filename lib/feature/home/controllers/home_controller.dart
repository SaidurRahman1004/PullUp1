import 'package:get/get.dart';

class HomeController extends GetxController {
  var isFree = true.obs;
  var selectedFilter = "Now".obs;

  /// Details Screen States
  // 0 for Attendance, 1 for Comments
  var selectedTabIndex = 0.obs;
  // -1: None, 0: Going, 1: Maybe, 2: Pass
  var selectedResponse = (-1).obs;

  void toggleFreeStatus(bool value) => isFree.value = value;
  void setFilter(String filter) => selectedFilter.value = filter;

  void setTab(int index) => selectedTabIndex.value = index;
  void setResponse(int index) => selectedResponse.value = index;
}