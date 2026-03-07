import 'package:flutter/material.dart';

import '../../../core/style/app_colors.dart';

class StatCard extends StatelessWidget {
  final String count, label, iconPath;

  const StatCard({
    super.key,
    required this.count,
    required this.label,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(iconPath, width: 22, color: AppColors.primary),
            const SizedBox(height: 12),
            Text(
              count,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
