import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/global_text_style.dart';
import '../controllers/account_controller.dart';
import '../view/settings_screen.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Get.to(() => const SettingsScreen()),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(77),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: NetworkImage('https://i.pravatar.cc/150?img=12'),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(26),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => Text(
            Get.find<AccountController>().displayName.value,
            style: AppTextStyles.heading2,
          ),
        ),
        const SizedBox(height: 6),
        Obx(
          () => Text(
            Get.find<AccountController>().phoneNumber.value,
            style: AppTextStyles.bodyRegular.copyWith(color: const Color(0xFF6B7280)),
          ),
        ),
      ],
    );
  }
}
