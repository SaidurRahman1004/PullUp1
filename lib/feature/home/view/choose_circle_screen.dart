import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/style/app_colors.dart';

// Full-screen circle picker used in the PullUp post flow
// Navigates to the next screen with the selected circle name passed as argument
class ChooseCircleScreen extends StatelessWidget {
  // Called when user picks a circle — receives name and icon path
  final void Function(String name, String icon)? onCircleSelected;

  const ChooseCircleScreen({super.key, this.onCircleSelected});

  static const List<Map<String, dynamic>> _circles = [
    {
      'name': 'Gym Crew',
      'sub': '4 members',
      'icon': AppAssets.circleGym,
      'isOwner': false,
    },
    {
      'name': 'Lets Go',
      'sub': '1 members',
      'icon': AppAssets.joinGameLetsGo,
      'isOwner': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: const BackButton(color: Colors.black),
        title: Text(
          AppStrings.chooseCircle,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        itemCount: _circles.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final c = _circles[index];
          return _circleTile(
            name: c['name'],
            sub: c['sub'],
            icon: c['icon'],
            isOwner: c['isOwner'],
          );
        },
      ),
    );
  }

  Widget _circleTile({
    required String name,
    required String sub,
    required String icon,
    required bool isOwner,
  }) {
    return InkWell(
      onTap: () {
        if (onCircleSelected != null) {
          onCircleSelected!(name, icon);
        } else {
          Get.back(result: {'name': name, 'icon': icon});
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFEEEEEE)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                icon,
                color: Colors.white,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(
                        Icons.people_alt_outlined,
                        size: 13,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        sub,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isOwner)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Owner",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
