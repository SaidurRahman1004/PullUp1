import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/theme/global_text_style.dart';
import '../controllers/nav_controller.dart';

class NavItemWidget extends StatelessWidget {
  final NavController controller;
  final int index;
  final String inactiveIcon;
  final String activeIcon;
  final String label;

  const NavItemWidget({
    super.key,
    required this.controller,
    required this.index,
    required this.inactiveIcon,
    required this.activeIcon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isActive = controller.currentIndex.value == index;
      return GestureDetector(
        onTap: () => controller.changeIndex(index),
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          width: 65,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                isActive ? activeIcon : inactiveIcon,
                width: 26,
                height: 26,
                color: isActive ? AppColors.primary : null,
                colorBlendMode: isActive ? BlendMode.srcIn : null,
              ),
              const SizedBox(height: 4),
              FittedBox(
                child: Text(
                  label,
                  style: AppTextStyles.smallLabel.copyWith(
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                    color: isActive
                        ? AppColors.primary
                        : const Color(0xFF8E8E93),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
