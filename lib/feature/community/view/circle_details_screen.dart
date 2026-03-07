import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/style/app_colors.dart';
import '../controller/circle_controller.dart';
import 'circle_members_screen.dart';

class CircleDetailsScreen extends StatelessWidget {
  final String name, icon;
  const CircleDetailsScreen({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final CircleController controller = Get.put(CircleController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Circle Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
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
                  children: [
                    const SizedBox(height: 16),

                    //  Large Circle Icon
                    Center(
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: Image.asset(
                            icon,
                            width: 46,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ─── Circle Name ────────────────────────────────────
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // 4 members with bottomCircles icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.bottomCircles,
                          width: 14,
                          height: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "4 members",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    //  Action Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.person_add_alt_1_outlined,
                                  size: 17,
                                  color: Colors.black,
                                ),
                                label: const Text(
                                  "Invite",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                    color: Color.fromARGB(255, 8, 8, 8),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Create PullUp",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ─── Members Card ───────────────────────────────────
                    // Figma: bg #E4E6ED, border #D8DAE5, +4 badge
                    GestureDetector(
                      onTap: () => Get.to(() => const CircleMembersScreen()),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE4E6ED),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFFD8DAE5)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              AppAssets.bottomCircles,
                              width: 18,
                              height: 18,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "4 Members",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            // Stacked avatars — no +4 badge per Figma
                            SizedBox(
                              width: 72,
                              height: 28,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  _stackedAvatar(
                                    'https://i.pravatar.cc/150?img=1',
                                    0,
                                  ),
                                  _stackedAvatar(
                                    'https://i.pravatar.cc/150?img=2',
                                    20,
                                  ),
                                  _stackedAvatar(
                                    'https://i.pravatar.cc/150?img=5',
                                    40,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Arrow button
                            Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ─── Tabs + Content Box ─────────────────────────────
                    // Figma: outer bg #E4E6ED, selected tab underline
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4E6ED),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFD8DAE5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Tab Bar
                          _buildTabs(controller),
                          // Content area
                          Obx(() {
                            switch (controller.selectedDetailTab.value) {
                              case 0:
                                return _buildUpcomingTab();
                              case 1:
                                return _buildPastTab();
                              case 2:
                                return _buildPingsTab();
                              default:
                                return _buildUpcomingTab();
                            }
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Leave Circle button — directly after tabs
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.red,
                            size: 18,
                          ),
                          label: const Text(
                            "Leave Circle",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFE5E5EA)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Stacked avatar helper
  Widget _stackedAvatar(String url, double left) {
    return Positioned(
      left: left,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: ClipOval(
          child: Image.network(
            url,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const CircleAvatar(
              backgroundColor: Color(0xFFD0D0D0),
              child: Icon(Icons.person, size: 14, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  // ─── Tabs ────────────────────────────────────────────────────────────
  // Figma: underline style, no pill/card selection
  Widget _buildTabs(CircleController controller) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                _tabItem("Upcoming", "PullUps (2)", 0, controller),
                _tabItem("Past", "PullUps (2)", 1, controller),
                _tabItem("Pings", "Pings (1)", 2, controller),
              ],
            ),
          ),
          // Full-width thin border between tab bar and content
          Container(height: 1, color: const Color(0xFFD8DAE5)),
        ],
      ),
    );
  }

  Widget _tabItem(
    String label,
    String sub,
    int index,
    CircleController controller,
  ) {
    final isSelected = controller.selectedDetailTab.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.setDetailTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            // Selected tab has slightly different bg color
            color: isSelected ? const Color(0xFFD8DAE5) : Colors.transparent,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? Colors.black : Colors.black54,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                sub,
                style: TextStyle(
                  fontSize: 11,
                  color: isSelected ? Colors.black54 : Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 6),
              // Underline indicator
              Container(
                height: 2,
                width: 40,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Upcoming Tab ─────────────────────────────────────────────────────
  Widget _buildUpcomingTab() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _pullUpCard("Gym Session", "Jan 22, 6:00 PM", "1"),
          const SizedBox(height: 8),
          _pullUpCard("Coffee Meetup", "Jan 22, 6:00 PM", "1"),
        ],
      ),
    );
  }

  // ─── Past Tab ─────────────────────────────────────────────────────────
  Widget _buildPastTab() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _pullUpCard("Gym Session", "Jan 22, 6:00 PM", "1"),
          const SizedBox(height: 8),
          _pullUpCard("Evening Workout", "Jan 22, 6:00 PM", "1"),
        ],
      ),
    );
  }

  Widget _pullUpCard(String title, String date, String count) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 13,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Member count
          Row(
            children: [
              Image.asset(
                AppAssets.bottomCircles,
                width: 14,
                height: 14,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Text(
                count,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Pings Tab ────────────────────────────────────────────────────────
  Widget _buildPingsTab() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _pingCard(
            title: "I'm free, anyone down?",
            subtitle: "Dinner + Drinks?",
            timeLeft: "2h 59m remaining",
          ),
        ],
      ),
    );
  }

  Widget _pingCard({
    required String title,
    required String subtitle,
    required String timeLeft,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE6F0FF),
            ),
            child: Image.asset(
              AppAssets.thunder,
              color: AppColors.primary,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 13, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      timeLeft,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "I'm in",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
