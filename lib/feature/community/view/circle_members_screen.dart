import 'package:flutter/material.dart';
import '../../../core/theme/global_text_style.dart';
import '../widgets/member_tile_widget.dart';

class CircleMembersScreen extends StatelessWidget {
  const CircleMembersScreen({super.key});

  // Demo member data
  static const List<Map<String, String>> _members = [
    {'name': 'You', 'phone': '+1234*******', 'badge': 'Admin'},
    {'name': 'Alex Chen', 'phone': '+12345******', 'badge': 'Pro'},
    {'name': 'Sarah Kim', 'phone': '+1234*******', 'badge': 'Free'},
    {'name': 'Sarah Kim', 'phone': '+1234*******', 'badge': 'Free'},
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
          "Members (4)",
          style: AppTextStyles.heading3.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        itemCount: _members.length,
        separatorBuilder: (_, _) =>
            const Divider(height: 1, color: Color(0xFFEEEEF0)),
        itemBuilder: (context, index) {
          final member = _members[index];
          return MemberTileWidget(
            name: member['name']!,
            phone: member['phone']!,
            badge: member['badge']!,
            avatarUrl: 'https://i.pravatar.cc/150?img=${index + 1}',
          );
        },
      ),
    );
  }


}
