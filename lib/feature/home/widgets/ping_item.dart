import 'package:flutter/material.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/style/app_colors.dart';

class PingItem extends StatelessWidget {
  final String title, time;
  final VoidCallback onTap;

  const PingItem({super.key, required this.title, required this.time, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: icon + title + I'm in button
            Row(
              crossAxisAlignment: .start,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE6F0FF),
                  ),
                  child: Center(
                    child: Image.asset(AppAssets.thunder),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    AppStrings.imIn,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Bottom Row: clock + time + avatars
            Row(
              children: [
                const Icon(Icons.access_time, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const Spacer(),
                _buildStackedAvatars(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStackedAvatars() {
    return Image.asset(AppAssets.homeProfiles, height: 28, fit: BoxFit.contain);
  }
}
