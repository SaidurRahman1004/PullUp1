import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/style/app_colors.dart';
import '../controller/home_controller.dart';
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
        title: const Text(
          "PullUp Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 17,
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
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 22,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    circle,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
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
          _attendeeRow(
            "Alex Chen",
            Colors.green,
            'https://i.pravatar.cc/150?img=1',
          ),
          _attendeeRow(
            "Sarah Kim",
            Colors.green,
            'https://i.pravatar.cc/150?img=5',
          ),
          const SizedBox(height: 14),
          _sectionLabel("Maybe"),
          _attendeeRow("You", Colors.orange, 'https://i.pravatar.cc/150?img=8'),
          const SizedBox(height: 14),
          _sectionLabel("Pass"),
          _attendeeRow(
            "Marvin McKinney",
            Colors.red,
            'https://i.pravatar.cc/150?img=12',
          ),
          _attendeeRow(
            "Annette Black",
            Colors.red,
            'https://i.pravatar.cc/150?img=16',
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
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _attendeeRow(String name, Color dotColor, String avatarUrl) {
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
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
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

  // Comments
  Widget _buildCommentsList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Ask Host a Question",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          const SizedBox(height: 4),
          const Text(
            "Ask the host one quick question.",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 16),
          _chatBubble(
            name: "Alex Chen",
            isHost: false,
            message: "Do you need me to bring anything?",
            time: "2m ago",
            avatarUrl: 'https://i.pravatar.cc/150?img=1',
          ),
          const SizedBox(height: 10),
          _chatBubble(
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
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _chatBubble({
    required String name,
    required bool isHost,
    required String message,
    required String time,
    required String avatarUrl,
  }) {
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
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F7),
              borderRadius: const BorderRadius.only(
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
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
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
                        child: const Text(
                          "HOST",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCommentInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Ask something about this plan...",
              hintStyle: TextStyle(fontSize: 13, color: Colors.grey.shade400),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFFD0D0D0),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Send",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
