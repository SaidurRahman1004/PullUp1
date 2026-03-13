import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/const/app_strings.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/theme/global_text_style.dart';
import '../controllers/home_controller.dart';

class FreeStatusSection extends StatelessWidget {
  final HomeController controller;

  const FreeStatusSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.imFree,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppStrings.imFreeSubtitle,
                      style: AppTextStyles.caption.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Switch(
                  value: controller.isFree.value,
                  onChanged: controller.toggleFreeStatus,
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.primary,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: const Color(0xFFE5E5EA),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // --- Filter Chips (Segmented Control style) ---
          Obx(() {
            const filters = [
              AppStrings.now,
              AppStrings.later,
              AppStrings.tonight,
            ];
            return Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: filters.map((label) {
                  final isSelected = controller.selectedFilter.value == label;
                  return GestureDetector(
                    onTap: () => controller.setFilter(label),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withAlpha(50),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Text(
                        label,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: isSelected ? Colors.white : Colors.black54,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
