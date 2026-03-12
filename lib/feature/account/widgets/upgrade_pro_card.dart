import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/theme/global_text_style.dart';
import '../view/pullup_pro_screen.dart';

class UpgradeProCardWidget extends StatelessWidget {
  const UpgradeProCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const PullUpProScreen()),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10), // used alpha(10) to average settings vs profile
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(AppAssets.premiumIcon, width: 28, height: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Upgrade to Pro", style: AppTextStyles.heading3),
                  const SizedBox(height: 4),
                  Text("Unlock unlimited PullUps and more", style: AppTextStyles.bodySmall),
                ],
              ),
            ),
            const Text("✨", style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
