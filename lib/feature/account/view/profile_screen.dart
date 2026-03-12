import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/account_controller.dart';
import '../widgets/account_details_section.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_stat_card.dart';
import '../widgets/upgrade_pro_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AccountController());

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 200),
        child: Stack(
          children: [
            // Background Gradient
            Container(
              height: 350,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF9FBCF9),
                    Color(0xFF7CA8FF),
                    Color(0xFFDEE3FC),
                  ],
                ),
              ),
            ),

            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  const ProfileHeaderWidget(),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const ProfileStatCard(),
                        const SizedBox(height: 16),
                        const UpgradeProCardWidget(),
                        const SizedBox(height: 16),
                        const AccountDetailsSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
