import 'package:evenjr_clone/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/global_text_style.dart';

class NotificationTile extends StatelessWidget {
  final String title, subtitle, time, icon;
  final bool isUnread;
  final bool isFirst;
  final bool isLast;

  const NotificationTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    this.isUnread = false,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    // Border radius only on first and last items inside grouped container
    final BorderRadius radius = BorderRadius.only(
      topLeft: isFirst ? const Radius.circular(14) : Radius.zero,
      topRight: isFirst ? const Radius.circular(14) : Radius.zero,
      bottomLeft: isLast ? const Radius.circular(14) : Radius.zero,
      bottomRight: isLast ? const Radius.circular(14) : Radius.zero,
    );

    return ClipRRect(
      borderRadius: radius,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        color: isUnread ? const Color(0xFFF0F7FF) : Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notification icon displayed inside a circular blue tint container
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(9),
              decoration: const BoxDecoration(
                color: Color(0xFFE6F0FF),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                icon,
                fit: BoxFit.contain,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 12),

            // Text column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: AppTextStyles.caption.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Unread blue dot
            if (isUnread)
              Container(
                margin: const EdgeInsets.only(top: 2, left: 8),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
