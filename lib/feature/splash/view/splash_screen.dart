import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../core/style/app_colors.dart';
import '../../auth/view/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() => const LoginScreen(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 800)
      );
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.splashGradient,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/icons/SplashScreen.png',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(.5),
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // PullUp Logo
                  Image.asset(
                    'assets/icons/logopng1.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  const SizedBox(height: 40),

                  const SpinKitFadingCircle(
                    color: Colors.white,
                    size: 40.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
