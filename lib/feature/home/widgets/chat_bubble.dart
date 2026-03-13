import 'package:flutter/material.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/theme/global_text_style.dart';

class ChatBubble extends StatelessWidget {
  final String name;
  final bool isHost;
  final String message;
  final String time;
  final String avatarUrl;

  const ChatBubble({
    super.key,
    required this.name,
    required this.isHost,
    required this.message,
    required this.time,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Image.network(
            avatarUrl,
            width: 34,
            height: 34,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => const CircleAvatar(
              radius: 17,
              backgroundColor: Color(0xFFE5E5EA),
              child: Icon(Icons.person, size: 18, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFFEAEAEF),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (isHost) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "HOST",
                          style: AppTextStyles.captionBold.copyWith(
                            color: Colors.white,
                            fontSize: 9,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: AppTextStyles.bodySmall.copyWith(color: Colors.black87),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: AppTextStyles.caption.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
