import 'package:flutter/material.dart';
import '../../../core/theme/global_text_style.dart';

class FaqItem {
  final String question;
  final String answer;
  final bool isExpanded;

  FaqItem({required this.question, required this.answer, this.isExpanded = false});
}

class FaqTileWidget extends StatefulWidget {
  final FaqItem item;
  final bool isLast;
  final bool isFirst;

  const FaqTileWidget({
    super.key,
    required this.item,
    required this.isLast,
    required this.isFirst,
  });

  @override
  State<FaqTileWidget> createState() => _FaqTileWidgetState();
}

class _FaqTileWidgetState extends State<FaqTileWidget> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.item.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.isFirst) const Divider(height: 1, color: Color(0xFFF3F4F6)),
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.item.question,
                    style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.chevron_right,
                  size: 20,
                  color: const Color(0xFF9CA3AF),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              widget.item.answer,
              style: AppTextStyles.bodyRegular.copyWith(
                color: const Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
          ),
        if (widget.isLast && !isExpanded) const SizedBox(height: 4),
      ],
    );
  }
}
