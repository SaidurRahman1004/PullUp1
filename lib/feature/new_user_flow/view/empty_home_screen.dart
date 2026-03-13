import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/gradientcon_container.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';
import 'create_circle_screen.dart';
import 'join_circle_screen.dart';

class EmptyHomeScreen extends StatelessWidget {
  const EmptyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 120,),
            const GradientIconContainer(assetPath: AppAssets.bottomCircles, iconSize: 40),
            const SizedBox(height: 24),
            Text(AppStrings.emptyHomeTitle, style: AppTextStyles.heading1.copyWith(fontSize: 24), textAlign: TextAlign.center),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(AppStrings.emptyHomeSubtitle, style: AppTextStyles.bodyMedium.copyWith(color: Colors.grey), textAlign: TextAlign.center),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(width: double.infinity, height: 56, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: () => Get.to(() => const CreateCircleScreen()), child: Text(AppStrings.createCircleBtn, style: AppTextStyles.bodyLarge.copyWith(color: Colors.white, fontWeight: FontWeight.w700)))),
                  const SizedBox(height: 12),
                  SizedBox(width: double.infinity, height: 56, child: OutlinedButton(style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(
                      0xFF0068FF)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: () => Get.to(() => const JoinCircleScreen()), child: Text(AppStrings.joinWithCodeBtn, style: AppTextStyles.bodyLarge.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)))),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }



}