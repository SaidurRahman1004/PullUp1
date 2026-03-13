import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';
import '../controllers/home_controller.dart';
import '../widgets/attendee_row.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/comment_input.dart';
import '../widgets/response_selector.dart';

class PingDetailsScreen extends StatelessWidget {
  final String title, time;

  const PingDetailsScreen({super.key, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          "Ping Details",
          style: AppTextStyles.heading3.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Ping Header Card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFD0E4FF), width: 1.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFE6F0FF),
                        ),
                        child: Center(child: Image.asset(AppAssets.thunder)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          title,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 13,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "$time remaining",
                        style: AppTextStyles.caption.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Response Selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ResponseSelector(
                controller: controller,
                showConfirm: false,
              ),
            ),

            const SizedBox(height: 16),

            // Tabs + Content card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE5E5EA), width: 1),
              ),
              child: Column(
                children: [
                  // Tab Bar different bg
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8F9FB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildTabs(controller),
                  ),
                  const Divider(height: 1, color: Color(0xFFE5E5EA)),

                  Obx(
                    () => controller.selectedTabIndex.value == 0
                        ? _buildAttendanceList()
                        : _buildCommentsList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs(HomeController controller) {
    return Obx(
      () => Row(
        children: [
          _tabItem("Attendance 6/10", 0, controller),
          const SizedBox(width: 20),
          _tabItem("Comments (2)", 1, controller),
        ],
      ),
    );
  }

  Widget _tabItem(String label, int index, HomeController controller) {
    final isSelected = controller.selectedTabIndex.value == index;
    final Widget tabIcon = index == 0
        ? Image.asset(
            AppAssets.homeMen,
            width: 15,
            height: 15,
            color: isSelected ? AppColors.primary : Colors.grey,
          )
        : Icon(
            Icons.chat_bubble_outline,
            size: 14,
            color: isSelected ? AppColors.primary : Colors.grey,
          );

    return GestureDetector(
      onTap: () => controller.setTab(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          Row(
            children: [
              tabIcon,
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? AppColors.primary : Colors.grey,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 2.5,
            width: 100,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionLabel("Going"),
          const AttendeeRow(
            name: "Alex Chen",
            dotColor: Colors.green,
            avatarUrl: 'https://i.pravatar.cc/150?img=1',
          ),
          const AttendeeRow(
            name: "Sarah Kim",
            dotColor: Colors.green,
            avatarUrl: 'https://i.pravatar.cc/150?img=5',
          ),
          const SizedBox(height: 14),
          _sectionLabel("Maybe"),
          const AttendeeRow(
            name: "You",
            dotColor: Colors.orange,
            avatarUrl: 'https://i.pravatar.cc/150?img=8',
          ),
          const SizedBox(height: 14),
          _sectionLabel("Pass"),
          const AttendeeRow(
            name: "Marvin McKinney",
            dotColor: Colors.red,
            avatarUrl: 'https://i.pravatar.cc/150?img=12',
          ),
          const AttendeeRow(
            name: "Annette Black",
            dotColor: Colors.red,
            avatarUrl: 'https://i.pravatar.cc/150?img=16',
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
    );
  }



  Widget _buildCommentsList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ask Host a Question",
            style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            "Ask the host one quick question.",
            style: AppTextStyles.bodySmall.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          const ChatBubble(
            name: "Alex Chen",
            isHost: false,
            message: "Do you need me to bring anything?",
            time: "2m ago",
            avatarUrl: 'https://i.pravatar.cc/150?img=1',
          ),
          const SizedBox(height: 10),
          const ChatBubble(
            name: "Ryani",
            isHost: true,
            message: "Yes, please bring extra ice.",
            time: "2m ago",
            avatarUrl: 'https://i.pravatar.cc/150?img=7',
          ),
          const SizedBox(height: 16),
          // Comment input here for Ping (no bottom bar)
          const CommentInput(),
        ],
      ),
    );
  }
}
