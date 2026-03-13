import 'package:flutter/material.dart';
import '../../../../core/const/app_assets.dart';
import '../../../../core/const/app_strings.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/theme/global_text_style.dart';

class NotificationBanner extends StatelessWidget {
  const NotificationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.notifyBannerBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFE58F)),
      ),
      child: Row(
        children: [
          Image.asset(
            AppAssets.bottomNotification,
            width: 22,
            height: 22,
            color: AppColors.notifyButton,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.turnOnNotify,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF874D00),
                  ),
                ),
                Text(
                  AppStrings.turnOnNotifySub,
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF874D00),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.notifyButton,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              AppStrings.enable,
              style: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
