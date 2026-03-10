import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/global_widgets/custom_text_field.dart';
import '../../../core/style/app_colors.dart';
import 'notification_permission_screen.dart';

class JoinCircleScreen extends StatelessWidget {
  const JoinCircleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FB),
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          AppStrings.joinCircleTitle,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextField(
              labelText: AppStrings.inviteCode,
              hintText: AppStrings.enterCodeHint,
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: AppStrings.joinCircleBtn,
              onPressed: () =>
                  Get.offAll(() => const NotificationPermissionScreen()),
            ),
            const SizedBox(height: 32),
            _buildCircleTile(
              context,
              title: "Gym Crew",
              members: "4 members",
              asset: AppAssets.circleGym,
            ),
            const SizedBox(height: 12),
            _buildCircleTile(
              context,
              title: "Lets Go",
              members: "1 member",
              asset: AppAssets.joinGameLetsGo,
              isOwner: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleTile(
    BuildContext context, {
    required String title,
    required String members,
    required String asset,
    bool isOwner = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E5EA), width: 1.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Image.asset(asset, width: 24, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.bottomCircles,
                    color: Colors.grey.shade600,
                    width: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    members,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                  if (isOwner)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6F0FF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          "Owner",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
