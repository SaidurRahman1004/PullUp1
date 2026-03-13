import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';
import 'invite_members_screen.dart';
import 'notification_permission_screen.dart';

class CircleCreatedScreen extends StatelessWidget {
  const CircleCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Image.asset(AppAssets.doneGreen, width: 100, height: 100),
              const SizedBox(height: 32),
              Text(
                AppStrings.circleCreatedTitle,
                style: AppTextStyles.heading1.copyWith(
                  fontSize: 32,
                  color: const Color(0xFF1D1D1F),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                AppStrings.circleCreatedSubtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textSecondary),
              ),
              const Spacer(flex: 1),
              CustomButton(
                text: AppStrings.invitePeopleBtn,
                onPressed: () => Get.to(() => const InviteMembersScreen()),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Circles work best with 8–15 people.",
                  style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFF8E8E93)),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE5E5EA), width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Get.to(() => const NotificationPermissionScreen());
                  },
                  child: Text(
                    AppStrings.doThisLater,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "You can invite more anytime.",
                  style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFF8E8E93)),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
