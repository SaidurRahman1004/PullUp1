import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/style/app_colors.dart';
import '../controller/ping_controller.dart';
import '../widgets/choose_time_sheet.dart';

class SendPingScreen extends StatelessWidget {
  final String circleName;
  final String circleIcon;

  const SendPingScreen({
    super.key,
    required this.circleName,
    this.circleIcon = AppAssets.circleGym,
  });

  @override
  Widget build(BuildContext context) {
    final PingController controller = Get.put(PingController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          AppStrings.sendPing,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circle label
            const Text(
              "Circle",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            const SizedBox(height: 8),

            // Circle selector chip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E5EA)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      circleIcon,
                      width: 18,
                      height: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    circleName,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Quick Prompts
            const Text(
              AppStrings.quickPrompts,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            const SizedBox(height: 10),
            ...controller.prompts.map((p) => _buildPromptItem(p, controller)),

            const SizedBox(height: 20),

            // Custom message box
            const Text(
              AppStrings.writeYourOwn,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.customMessageController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: AppStrings.whatToSayHint,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(14),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE5E5EA)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Date selector
            const Text(
              "Date",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            const SizedBox(height: 10),
            _buildDateSection(controller),

            const SizedBox(height: 36),

            // Send Ping button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  AppStrings.sendPing,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromptItem(String text, PingController controller) {
    return Obx(() {
      final bool isSelected = controller.selectedPrompt.value == text;
      return GestureDetector(
        onTap: () => controller.setPrompt(text),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.primary : const Color(0xFFE5E5EA),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDateSection(PingController controller) {
    return Row(
      children: [
        _dateChip("Now", controller),
        const SizedBox(width: 10),
        _dateChip("Later", controller),
        const SizedBox(width: 10),
        _dateChip("Tonight", controller),
      ],
    );
  }

  Widget _dateChip(String label, PingController controller) {
    return Obx(() {
      final bool isSelected = controller.selectedDateFilter.value == label;
      return Expanded(
        child: GestureDetector(
          onTap: () {
            controller.setDateFilter(label);
            if (label == "Later") {
              Get.bottomSheet(
                const ChooseTimeSheet(),
                isScrollControlled: true,
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? AppColors.primary : const Color(0xFFE5E5EA),
              ),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
