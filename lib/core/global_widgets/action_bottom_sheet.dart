import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/app_strings.dart';

class ActionBottomSheet extends StatelessWidget {
  const ActionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.whatToDo,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _actionItem(
            AppStrings.postAPullup,
            AppStrings.postSubtitle,
            Icons.calendar_today_outlined,
            const Color(0xFF0066FF),
            () {
              Get.back();
              // Navigate to Choose Circle then Post PullUp
            },
          ),
          _actionItem(
            AppStrings.pingCircle,
            AppStrings.pingCircleSub,
            Icons.bolt,
            const Color(0xFFFF9500),
            () {},
          ),
          _actionItem(
            AppStrings.createCircleBtn,
            "Start an invite-only group",
            Icons.groups_outlined,
            const Color(0xFF34C759),
            () {},
          ),
          _actionItem(
            AppStrings.inviteFriends,
            AppStrings.inviteFriendsSub,
            Icons.person_add_outlined,
            const Color(0xFF5856D6),
            () {
              Get.back();
              // Navigate to Invite flow
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _actionItem(
    String title,
    String sub,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withAlpha(26),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        sub,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
