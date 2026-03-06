import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/style/app_colors.dart';
import '../widgets/action_card.dart';
import 'create_circle_screen.dart';
import 'join_circle_screen.dart';

class StartCircleScreen extends StatelessWidget {
  const StartCircleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              const Spacer(),
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: AppColors.iconGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF6366F1),
                        blurRadius: 20,
                        offset: Offset(0, 8),
                        spreadRadius: -5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      AppAssets.bottomCircles, // ফিগমা অনুযায়ী আইকন
                      width: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "Start your first circle",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                "PullUp works best when your people are in one place.",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
              ),
              const SizedBox(height: 48),

              ActionCard(
                title: "Create a Circle",
                subtitle: "Start a private group and invite your people",
                assetIcon: AppAssets.addCreateCircle,
                onTap: () => Get.to(() => const CreateCircleScreen()),
              ),
              const SizedBox(height: 16),

              ActionCard(
                isPrimary: false,
                title: "Join with Code",
                subtitle: "Enter a code from someone you know",
                assetIcon: AppAssets.bottomCircles,
                onTap: () {
                  Get.to(() => const JoinCircleScreen());
                },
              ),
              const SizedBox(height: 20),

              const Text(
                "Invite-only. Nothing is public.",
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
