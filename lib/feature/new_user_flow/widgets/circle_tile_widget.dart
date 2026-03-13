import 'package:flutter/material.dart';
import '../../../../core/const/app_assets.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/theme/global_text_style.dart';

class CircleTileWidget extends StatelessWidget {
  final String title;
  final String members;
  final String asset;
  final bool isOwner;

  const CircleTileWidget({
    super.key,
    required this.title,
    required this.members,
    required this.asset,
    this.isOwner = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E5EA), width: 1.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Image.asset(asset, width: 24, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.bottomCircles,
                    color: Colors.grey.shade600,
                    width: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    members,
                    style: AppTextStyles.bodySmall.copyWith(fontSize: 14),
                  ),
                  if (isOwner)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6F0FF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "Owner",
                          style: AppTextStyles.captionBold.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
