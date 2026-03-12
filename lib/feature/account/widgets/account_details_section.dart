import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/global_text_style.dart';
import '../controllers/account_controller.dart';

class AccountDetailsSection extends StatelessWidget {
  const AccountDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AccountController>();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text("Account", style: AppTextStyles.heading3),
          ),
          Divider(height: 1, color: Colors.grey.shade100, thickness: 1.5),
          _infoRow("Display Name", "You"),
          Divider(height: 1, color: Colors.grey.shade100, thickness: 1.5),
          _infoRow("Phone Number", controller.phoneNumber.value),
          Divider(height: 1, color: Colors.grey.shade100, thickness: 1.5),
          _infoRow("Member Since", "January 2026"),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(color: const Color(0xFF9CA3AF)),
          ),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}
