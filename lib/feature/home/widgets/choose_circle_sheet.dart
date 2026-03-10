import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/style/app_colors.dart';

// StatefulWidget is required so MediaQuery.viewInsets rebuilds on keyboard open
class ChooseCircleSheet extends StatefulWidget {
  final Function(String name, String icon) onCircleSelected;

  const ChooseCircleSheet({super.key, required this.onCircleSelected});

  @override
  State<ChooseCircleSheet> createState() => _ChooseCircleSheetState();
}

class _ChooseCircleSheetState extends State<ChooseCircleSheet> {
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
      'icon': AppAssets.circleHangout,
      'isOwner': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Reading viewInsets in StatefulWidget causes rebuild when keyboard opens
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      padding: EdgeInsets.fromLTRB(32, 0, 32, keyboardHeight + 12),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFD0D0D0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            // Header row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppStrings.chooseCircle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.close, size: 22, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Divider after header (Figma)
            const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 14),

            // Search field
            TextField(
              style: const TextStyle(color: Colors.black, fontSize: 14),
              decoration: InputDecoration(
                hintText: AppStrings.searchCircle,
                hintStyle: const TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 14,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                  color: Color(0xFF9E9E9E),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Recent label — black
            const Text(
              "Recent",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 10),

            // Circle tiles with #F6F6F6 card background
            ..._circles.map(
              (c) => _circleTile(
                name: c['name'],
                sub: c['sub'],
                icon: c['icon'],
                isOwner: c['isOwner'],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleTile({
    required String name,
    required String sub,
    required String icon,
    required bool isOwner,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Get.back();
          widget.onCircleSelected(name, icon);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
      ),
    );
  }
}
