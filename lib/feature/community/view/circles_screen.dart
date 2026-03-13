import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';
import '../../new_user_flow/view/create_circle_screen.dart';
import '../../new_user_flow/view/join_circle_screen.dart';
import 'circle_details_screen.dart';
import '../widgets/circle_list_item.dart';

class CirclesScreen extends StatelessWidget {
  const CirclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Circles",
          style: AppTextStyles.heading3.copyWith(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
          GestureDetector(
            onTap: () => Get.to(() => const CreateCircleScreen()),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 24),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Join  Code Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton.icon(
                  onPressed: () => Get.to(() => const JoinCircleScreen()),
                  icon: const Icon(Icons.add, size: 20),
                  label: Text(
                    AppStrings.joinWithCodeBtn,
                    style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),

                    side: const BorderSide(
                      color: Color.fromARGB(255, 219, 219, 219),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Circle List Items
              CircleListItem(
                title: "Gym Crew",
                members: "4 members",
                icon: AppAssets.circleGym,
                onTap: () => Get.to(
                  () => const CircleDetailsScreen(
                    name: "Gym Crew",
                    icon: AppAssets.circleGym,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              CircleListItem(
                title: "Lets Go",
                members: "1 member",
                icon: AppAssets.joinGameLetsGo,
                isOwner: true,
                onTap: () => Get.to(
                  () => const CircleDetailsScreen(
                    name: "Lets Go",
                    icon: AppAssets.joinGameLetsGo,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
