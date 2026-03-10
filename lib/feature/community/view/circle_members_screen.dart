import 'package:flutter/material.dart';

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
        title: const Text(
          "Members (4)",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 17,
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
          return _memberTile(
            name: member['name']!,
            phone: member['phone']!,
            badge: member['badge']!,
            avatarUrl: 'https://i.pravatar.cc/150?img=${index + 1}',
          );
        },
      ),
    );
  }

  Widget _memberTile({
    required String name,
    required String phone,
    required String badge,
    required String avatarUrl,
  }) {
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
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
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
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
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
        children: const [
          Icon(Icons.workspace_premium, color: Color(0xFFE5A000), size: 14),
          SizedBox(width: 4),
          Text(
            "Admin",
            style: TextStyle(
              color: Color(0xFFE5A000),
              fontSize: 12,
              fontWeight: FontWeight.bold,
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
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
