import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/text_styles.dart';

class GenderSelectionWidget extends StatelessWidget {
  final RxString selectedGender;
  final Function(String) onSelect;

  const GenderSelectionWidget({
    super.key,
    required this.selectedGender,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Gender",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildGenderOption("Male"),
            const SizedBox(width: 12),
            _buildGenderOption("Female"),
            const SizedBox(width: 12),
            _buildGenderOption("Prefer not to say"),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderOption(String gender) {
    return Obx(() {
      final isSelected = selectedGender.value == gender;
      return Expanded(
        child: GestureDetector(
          onTap: () => onSelect(gender),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary.withAlpha(25) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.black,
                width: isSelected ? 2.0 : 1.0,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              gender,
              style: AppTextStyles.bodySmall.copyWith(
                color: isSelected ? AppColors.primary : Colors.black87,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                fontSize: 12, // small text size to fit long "Prefer not to say"
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    });
  }
}
