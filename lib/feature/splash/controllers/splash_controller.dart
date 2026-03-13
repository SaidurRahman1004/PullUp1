import 'package:get/get.dart';
import '../../auth/view/login_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() => const LoginScreen(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 800));
    });
  }
}
