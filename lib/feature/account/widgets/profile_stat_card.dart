import 'package:flutter/material.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';

class ProfileStatCard extends StatelessWidget {
  const ProfileStatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      margin: const EdgeInsets.fromLTRB(28, 0, 28, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  AppAssets.homeMen,
                  width: 26,
                  height: 26,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 8),
                Text("3", style: AppTextStyles.heading2),
                const SizedBox(height: 4),
                Text(
                  "Circles",
                  style: AppTextStyles.bodySmall.copyWith(color: Colors.grey.shade500, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(height: 40, width: 1, color: Colors.grey.shade200),
          Expanded(
            child: Column(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.primary,
                  size: 26,
                ),
                const SizedBox(height: 8),
                Text("0", style: AppTextStyles.heading2),
                const SizedBox(height: 4),
                Text(
                  "Active PullUps",
                  style: AppTextStyles.bodySmall.copyWith(color: Colors.grey.shade500, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
