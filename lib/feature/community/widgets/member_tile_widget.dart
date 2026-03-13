import 'package:flutter/material.dart';
import '../../../../core/theme/global_text_style.dart';

class MemberTileWidget extends StatelessWidget {
  final String name;
  final String phone;
  final String badge;
  final String avatarUrl;

  const MemberTileWidget({
    super.key,
    required this.name,
    required this.phone,
    required this.badge,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          // Avatar
          ClipOval(
            child: Image.network(
              avatarUrl,
              width: 44,
              height: 44,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => const CircleAvatar(
                radius: 22,
                backgroundColor: Color(0xFFE5E5EA),
                child: Icon(Icons.person, color: Colors.grey, size: 22),
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Name + badge + phone
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Badge pill
                    if (badge != 'Admin') _badgePill(badge),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  phone,
                  style: AppTextStyles.bodySmall.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),

          // Admin badge on right
          if (badge == 'Admin') _adminBadge(),
        ],
      ),
    );
  }

  // Admin badge — yellow outlined pill with crown icon (right side)
  Widget _adminBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4D6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFFD966), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.workspace_premium, color: Color(0xFFE5A000), size: 14),
          const SizedBox(width: 4),
          Text(
            "Admin",
            style: AppTextStyles.captionBold.copyWith(
              color: const Color(0xFFE5A000),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Inline badge (Pro = blue, Free = light blue)
  Widget _badgePill(String badge) {
    final bool isPro = badge == 'Pro';
    final Color bg = isPro
        ? const Color(0xFF2563EB) // solid blue for Pro
        : const Color(0xFFE6F0FF); // light blue for Free
    final Color textColor = isPro ? Colors.white : const Color(0xFF2563EB);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        badge,
        style: AppTextStyles.captionBold.copyWith(
          color: textColor,
          fontSize: 11,
        ),
      ),
    );
  }
}
