import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/global_widgets/custom_text_field.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';
import '../controllers/account_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AccountController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          AppStrings.editProfile,
          style: AppTextStyles.heading3.copyWith(fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            // Profile Photo Section
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?img=12',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Click the camera icon to change your photo",
                    style: AppTextStyles.caption.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Form Fields
            _buildFieldLabel("Display Name"),
            CustomTextField(
              controller: controller.nameEditController,
              hintText: "Enter your name",
            ),
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "3/30 characters",
                style: AppTextStyles.caption.copyWith(color: Colors.black, fontSize: 11),
              ),
            ),
            const SizedBox(height: 24),
            _buildFieldLabel("Phone Number"),
            // Read-only Phone Field style per Figma
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black),
              ),
              child: Text(
                controller.phoneNumber.value,
                style: AppTextStyles.bodyMedium,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Phone number cannot be changed",
                style: AppTextStyles.caption.copyWith(color: Colors.black, fontSize: 11),
              ),
            ),
            const SizedBox(height: 60),
            // Save Button
            CustomButton(
              text: AppStrings.saveChanges,
              onPressed: () => controller.updateProfile(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: AppTextStyles.bodyRegular.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
