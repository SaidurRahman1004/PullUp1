import 'package:flutter/material.dart';
import '../../../../core/theme/global_text_style.dart';

class AttendeeRow extends StatelessWidget {
  final String name;
  final Color dotColor;
  final String avatarUrl;

  const AttendeeRow({
    super.key,
    required this.name,
    required this.dotColor,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              avatarUrl,
              width: 36,
              height: 36,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFFE5E5EA),
                child: Icon(Icons.person, size: 20, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            name,
            style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 6),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor),
          ),
        ],
      ),
    );
  }
}
