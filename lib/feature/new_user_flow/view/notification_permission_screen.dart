import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/global_widgets/gradientcon_container.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';
import '../../nav_bar/view/main_nav_screen.dart';
import 'join_circle_screen.dart';

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const GradientIconContainer(
              assetPath: AppAssets.bottomNotification,
              iconSize: 40,
            ),
            const SizedBox(height: 32),
            Text(
              AppStrings.notificationTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.heading1.copyWith(
                fontSize: 30,
                color: const Color(0xFF1D1D1F),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              AppStrings.notificationSubtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 48),
            CustomButton(
              text: AppStrings.turnOnNotifyBtn,
              onPressed: () => Get.offAll(() => const MainNavScreen()),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF0000FF)),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Get.to(() => const JoinCircleScreen()),
                child: Text(
                  AppStrings.notNowBtn,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
