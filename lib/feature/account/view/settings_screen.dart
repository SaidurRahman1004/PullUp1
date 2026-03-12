import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/settings_account_section.dart';
import '../widgets/settings_action_button.dart';
import '../widgets/settings_support_section.dart';
import '../widgets/upgrade_pro_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6F9),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        titleSpacing: 0,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          const UpgradeProCardWidget(),
          const SizedBox(height: 24),
          const SettingsAccountSection(),
          const SizedBox(height: 24),
          const SettingsSupportSection(),
          const SizedBox(height: 48),
          SettingsActionButton(
            title: "Logout",
            icon: Icons.logout,
            color: const Color(0xFFFF4B4B),
            onTap: () {},
          ),
          const SizedBox(height: 16),
          SettingsActionButton(
            title: "Delete Account",
            icon: CupertinoIcons.delete,
            color: const Color(0xFFFF4B4B),
            onTap: () {},
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
