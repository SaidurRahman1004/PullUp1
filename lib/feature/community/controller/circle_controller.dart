import 'package:get/get.dart';

class CircleController extends GetxController {
  var selectedDetailTab = 0.obs;

  void setDetailTab(int index) => selectedDetailTab.value = index;
}
