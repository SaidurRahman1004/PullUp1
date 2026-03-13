import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/gradientcon_container.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';
import '../widgets/action_card.dart';
import 'create_pull_up_screen.dart';

class PostFirstPullupScreen extends StatelessWidget {
  const PostFirstPullupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(),
              const GradientIconContainer(
                assetPath: AppAssets.addSquare,
                iconSize: 32,
              ),
              const SizedBox(height: 32),
              Text(
                AppStrings.postFirstTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.heading1.copyWith(
                  fontSize: 30,
                  color: const Color(0xFF1D1D1F),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                AppStrings.postFirstDesc,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 50),
              ActionCard(
                title: AppStrings.postAPullup,
                subtitle: AppStrings.postSubtitle,
                assetIcon: AppAssets.postPullupCalendar,
                onTap: () {
                  Get.to(() => const CreatePullUpScreen());
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    AppStrings.doThisLater,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}