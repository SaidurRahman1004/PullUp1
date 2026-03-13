import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../controllers/splash_controller.dart';
import '../widgets/splash_background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: SplashBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // PullUp Logo
              Image.asset(
                AppAssets.appLogo,
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
      ),
    );
  }
}
