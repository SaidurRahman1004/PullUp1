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

class PullUpDetailsScreen extends StatelessWidget {
  final String title, circle, icon;

  const PullUpDetailsScreen({
    super.key,
    required this.title,
    required this.circle,
    required this.icon,
  });

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
          "PullUp Details",
          style: AppTextStyles.heading3.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  Header Card
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFD0E4FF),
                          width: 1.2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Icon + Title row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                padding: const EdgeInsets.all(11),
                                child: Image.asset(icon, color: Colors.white),
                              ),
                              const SizedBox(width: 14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: AppTextStyles.heading2.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 22,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    circle,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: const [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 14,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Wednesday, January 21 at 9:17 AM",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on_outlined,
                                size: 14,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "The Burger Joint",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8E8E8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Let's do chest and back today!",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Divider(height: 1, color: Color(0xFFE5E5EA)),
                          const SizedBox(height: 12),
                          const Text(
                            "Created by  Ryani",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    //  Response Selector going maybe pass
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ResponseSelector(
                        controller: controller,
                        showConfirm: true,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Tabs + Content
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFE5E5EA),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          // Tab Bar row  different bg color
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFF8F9FB),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 0,
                            ),
                            child: _buildTabs(controller),
                          ),
                          const Divider(height: 1, color: Color(0xFFE5E5EA)),

                          // Tab content
                          Obx(
                            () => controller.selectedTabIndex.value == 0
                                ? _buildAttendanceList()
                                : _buildCommentsList(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Tabs
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

  // Attendance
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

  // Comments
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
          const Divider(height: 1, color: Color(0xFFE5E5EA)),
          const SizedBox(height: 12),
          // Input field inside the card
          const CommentInput(),
        ],
      ),
    );
  }
}
