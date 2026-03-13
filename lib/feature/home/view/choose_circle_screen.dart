import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/theme/global_text_style.dart';
import '../widgets/circle_option_tile.dart';

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
          style: AppTextStyles.heading3.copyWith(
            color: Colors.black,
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
    return CircleOptionTile(
      name: name,
      sub: sub,
      icon: icon,
      isOwner: isOwner,
      onTap: () {
        if (onCircleSelected != null) {
          onCircleSelected!(name, icon);
        } else {
          Get.back(result: {'name': name, 'icon': icon});
        }
      },
    );
  }
}
