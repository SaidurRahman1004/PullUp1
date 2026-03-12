import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';
import '../controllers/account_controller.dart';
import '../view/edit_profile_screen.dart';
import 'settings_tile.dart';

class SettingsAccountSection extends StatelessWidget {
  const SettingsAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AccountController>();
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
          Text("Account", style: AppTextStyles.heading4),
          const SizedBox(height: 16),
          Divider(height: 1, color: Colors.grey.shade100),
          const SizedBox(height: 12),
          SettingsTileWidget(
            title: "Edit Profile",
            subtitle: "Change your name and photo",
            onTap: () => Get.to(() => const EditProfileScreen()),
          ),
          const SizedBox(height: 12),
          Divider(height: 1, color: Colors.grey.shade100),
          const SizedBox(height: 12),
          Obx(
            () => SettingsTileWidget(
              title: "Notifications",
              subtitle: "Manage notification preferences",
              trailing: Switch(
                value: controller.isNotificationEnabled.value,
                onChanged: controller.toggleNotifications,
                activeThumbColor: Colors.white,
                activeTrackColor: Colors.blueAccent,
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
