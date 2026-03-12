import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';
import '../widgets/pullup_pro_feature_row.dart';
import '../widgets/pullup_pro_pricing_card.dart';

class PullUpProScreen extends StatelessWidget {
  const PullUpProScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RxBool isYearlySelected = true.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with Warm Gradient
          Container(
            width: double.infinity,
            //height: 320,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFDF5DE), Color(0xFFFC9952)],
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        margin: const EdgeInsets.only(right: 20, top: 10),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(51),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.workspace_premium,
                      color: Color(0xFFE5A000),
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Unlock PullUp Pro",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heading2.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Get unlimited access to everything",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const PullupProFeatureRow(
                    title: "Unlimited Active PullUps",
                    sub: "No limit on events you can create",
                  ),
                  const PullupProFeatureRow(
                    title: "Join More Circles",
                    sub: "Be part of unlimited circles",
                  ),
                  const PullupProFeatureRow(
                    title: "Bigger Circles",
                    sub: "Add up to 100 members per circle",
                  ),
                  const PullupProFeatureRow(
                    title: "Priority Support",
                    sub: "Get help when you need it",
                  ),
                  const SizedBox(height: 32),

                  // Pricing Row
                  Obx(
                    () => Row(
                      children: [
                        PullupProPricingCard(
                          label: "Monthly",
                          price: "\$3.99",
                          sub: "per month",
                          isYearly: false,
                          isSelected: !isYearlySelected.value,
                          onTap: () => isYearlySelected.value = false,
                        ),
                        const SizedBox(width: 16),
                        PullupProPricingCard(
                          label: "Yearly",
                          price: "\$29.99",
                          sub: "\$2.50/month",
                          isYearly: true,
                          isSelected: isYearlySelected.value,
                          onTap: () => isYearlySelected.value = true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Go Pro Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text(
                      "Not Now",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
