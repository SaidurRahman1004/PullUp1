import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';

class HelpCenterSupportCard extends StatelessWidget {
  const HelpCenterSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(11),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F7FB),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Need More Help?",
                style: AppTextStyles.heading3.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                "Can't find what you're looking for? Our\nsupport team is here to help.",
                style: AppTextStyles.bodyRegular.copyWith(
                  color: const Color(0xFF6B7280),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.snackbar(
                      "Email Support", 
                      "Redirecting to support@pullup.app...",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.white,
                    );
                  },
                  icon: const Icon(Icons.email_outlined, size: 20),
                  label: Text(
                    "Email",
                    style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
