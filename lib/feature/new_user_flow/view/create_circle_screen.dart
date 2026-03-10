import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/global_widgets/custom_text_field.dart';
import '../controller/new_user_controller.dart';
import 'circle_created_screen.dart' show CircleCreatedScreen;

class CreateCircleScreen extends StatelessWidget {
  const CreateCircleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NewUserController controller = Get.put(NewUserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Circle"),
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: controller.circleNameController,
                labelText: "Circle Name",
                hintText: "Gym Session",
              ),
              const SizedBox(height: 30),
              const Text(
                "Select Category",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              //Catagory
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final cat = controller.categories[index];
                    return Obx(
                      () => GestureDetector(
                        onTap: () => controller.selectCategory(cat['name']!),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                controller.selectedCategory.value == cat['name']
                                ? const Color(0xFFE6F0FF)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  controller.selectedCategory.value ==
                                      cat['name']
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              CustomButton(
                text: "Create Circle",
                onPressed: () {
                  Get.to(() => const CircleCreatedScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
