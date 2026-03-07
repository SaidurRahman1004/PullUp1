import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/style/app_colors.dart';
import '../controller/home_controller.dart';

class ResponseSelector extends StatelessWidget {
  final HomeController controller;

  /// PullUp Details  true (Confirm button show), Ping Details  false
  final bool showConfirm;
  const ResponseSelector({
    super.key,
    required this.controller,
    this.showConfirm = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFCFE2FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Response",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _buildOption(0, "Going", Icons.check, Colors.green),
              const SizedBox(width: 10),
              _buildOption(1, "Maybe", Icons.help_outline, Colors.orange),
              const SizedBox(width: 10),
              _buildOption(2, "Pass", Icons.close, Colors.red),
            ],
          ),
          if (showConfirm) ...[
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOption(int index, String label, IconData icon, Color color) {
    return Obx(() {
      final isSelected = controller.selectedResponse.value == index;
      return Expanded(
        child: GestureDetector(
          onTap: () => controller.setResponse(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.primary : const Color(0xFFE5E5EA),
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: color, size: 22),
                const SizedBox(height: 6),
                Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
