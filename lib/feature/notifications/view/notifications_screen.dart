import 'package:flutter/material.dart';
import '../../../../core/const/app_assets.dart';
import '../../../../core/const/app_strings.dart';
import '../../../../core/theme/global_text_style.dart';
import '../widgets/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F9FB),
        surfaceTintColor: Colors.transparent,
        leading: const BackButton(color: Colors.black),
        title: Text(
          AppStrings.notifications,
          style: AppTextStyles.heading3.copyWith(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
        children: [
          // Today Section
          _buildHeader(AppStrings.today),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFCFE2FF), width: 1.5),
            ),
            child: Column(
              children: [
                NotificationTile(
                  title: "New PullUp in Gym Crew",
                  subtitle: "Alex Chen posted Morning Gym Session",
                  time: "53m ago",
                  icon: AppAssets.homeCalendar,
                  isUnread: true,
                  isFirst: true,
                  isLast: false,
                ),
                _divider(),
                NotificationTile(
                  title: "Sarah Kim is coming! 🎉",
                  subtitle: "Sarah Kim confirmed for Morning Gym Session",
                  time: "58m ago",
                  icon: AppAssets.inviteRight,
                  isUnread: true,
                  isFirst: false,
                  isLast: false,
                ),
                _divider(),
                NotificationTile(
                  title: "Alex Chen is free!",
                  subtitle: "in Gym Crew: \"I'm free, anyone down?\"",
                  time: "1h ago",
                  icon: AppAssets.networkIcon,
                  isUnread: true,
                  isFirst: false,
                  isLast: true,
                ),
              ],
            ),
          ),

          const SizedBox(height: 42),

          // Yesterday Section
          _buildHeader(AppStrings.yesterday),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE5E5EA)),
            ),
            child: Column(
              children: [
                NotificationTile(
                  title: "Mike Johnson is free!",
                  subtitle: "in Study Group: \"Late night study session?\"",
                  time: "5h ago",
                  icon: AppAssets.networkIcon,
                  isUnread: true,
                  isFirst: true,
                  isLast: false,
                ),
                _divider(),
                NotificationTile(
                  title: "New PullUp in Study Group 📚",
                  subtitle: "Mike Johnson posted Library Study Session",
                  time: "1d ago",
                  icon: AppAssets.homeCalendar,
                  isUnread: false,
                  isFirst: false,
                  isLast: false,
                ),
                _divider(),
                NotificationTile(
                  title: "Sarah Kim can't make it 😔",
                  subtitle: "Sarah Kim passed on Evening Workout",
                  time: "1d ago",
                  icon: AppAssets.inviteRightBlue,
                  isUnread: false,
                  isFirst: false,
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: AppTextStyles.heading3.copyWith(
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _divider() => const Divider(
    height: 1,
    thickness: 1,
    color: Color(0xFFEEEEF0),
    indent: 16,
    endIndent: 16,
  );
}
