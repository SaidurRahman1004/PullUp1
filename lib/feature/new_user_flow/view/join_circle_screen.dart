import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/global_widgets/custom_text_field.dart';
import '../../../core/theme/global_text_style.dart';
import '../widgets/circle_tile_widget.dart';
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
        title: Text(
          AppStrings.joinCircleTitle,
          style: AppTextStyles.heading3.copyWith(color: Colors.black),
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
            CircleTileWidget(
              title: "Gym Crew",
              members: "4 members",
              asset: AppAssets.circleGym,
            ),
            const SizedBox(height: 12),
            CircleTileWidget(
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
}
