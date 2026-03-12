import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/global_text_style.dart';
import '../view/help_center_screen.dart';
import '../view/privacy_policy_screen.dart';
import '../view/terms_of_service_screen.dart';
import 'settings_tile.dart';

class SettingsSupportSection extends StatelessWidget {
  const SettingsSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Support", style: AppTextStyles.heading4),
          const SizedBox(height: 16),
          Divider(height: 1, color: Colors.grey.shade100),
          const SizedBox(height: 12),
          SettingsTileWidget(
            title: "Help Center",
            subtitle: "Get help and support",
            onTap: () => Get.to(() => const HelpCenterScreen()),
          ),
          const SizedBox(height: 12),
          Divider(height: 1, color: Colors.grey.shade100),
          const SizedBox(height: 12),
          SettingsTileWidget(
            title: "Terms of Service",
            onTap: () => Get.to(() => const TermsOfServiceScreen()),
          ),
          const SizedBox(height: 12),
          Divider(height: 1, color: Colors.grey.shade100),
          const SizedBox(height: 12),
          SettingsTileWidget(
            title: "Privacy Policy",
            onTap: () => Get.to(() => const PrivacyPolicyScreen()),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
