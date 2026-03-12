import 'package:flutter/material.dart';
import '../../../core/theme/global_text_style.dart';

class PolicySectionWidget extends StatelessWidget {
  final String title;
  final String content;

  const PolicySectionWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.heading3),
          const SizedBox(height: 12),
          Text(
            content,
            style: AppTextStyles.bodyRegular.copyWith(
              color: const Color(0xFF4B5563),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
