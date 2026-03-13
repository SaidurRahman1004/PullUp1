import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/global_widgets/custom_text_field.dart';
import '../../../core/theme/global_text_style.dart';
import '../controllers/new_user_controller.dart';
import 'circle_created_screen.dart' show CircleCreatedScreen;

class CreateCircleScreen extends StatelessWidget {
  const CreateCircleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewUserController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Create Circle"),
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: controller.circleNameController,
                labelText: "Circle Name",
                hintText: "Gym Session",
              ),
              const SizedBox(height: 24),

              // Collapsible category header — tapping toggles expansion
              Obx(
                () => GestureDetector(
                  onTap: () => controller.categoryExpanded.toggle(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Category (Optional)",
                        style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                      ),
                      AnimatedRotation(
                        turns: controller.categoryExpanded.value ? 0.5 : 0.0,
                        duration: const Duration(milliseconds: 250),
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Category grid — smooth expand/collapse via Obx
              Obx(
                () => AnimatedCrossFade(
                  duration: const Duration(milliseconds: 280),
                  crossFadeState: controller.categoryExpanded.value
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        final cat = controller.categories[index];
                        return Obx(() {
                          final isSelected =
                              controller.selectedCategory.value == cat['name'];
                          return GestureDetector(
                            onTap: () =>
                                controller.selectCategory(cat['name']!),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFE6F0FF)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFF0066FF)
                                      : Colors.black,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(cat['icon']!, width: 32),
                                  const SizedBox(height: 8),
                                    Text(
                                      cat['name']!,
                                      style: AppTextStyles.bodyMedium,
                                    ),
                                ],
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
              CustomButton(
                text: "Create Circle",
                onPressed: () => Get.to(() => const CircleCreatedScreen()),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
