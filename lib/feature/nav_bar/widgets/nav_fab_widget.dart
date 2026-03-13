import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/global_widgets/action_bottom_sheet.dart';
import '../../../../core/style/app_colors.dart';

class NavFabWidget extends StatelessWidget {
  const NavFabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.bottomSheet(
        const ActionBottomSheet(),
        isScrollControlled: true,
      ),
      child: Container(
        height: 68,
        width: 68,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(100),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: const Center(
          child: Icon(Icons.add, color: Colors.white, size: 32),
        ),
      ),
    );
  }
}
