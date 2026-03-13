import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';
import '../../new_user_flow/view/invite_members_screen.dart';
import '../controllers/circle_controller.dart';
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
        title: Text(
          "Circle Details",
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

                    // Circle Name
                    Text(
                      name,
                      style: AppTextStyles.heading2.copyWith(
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
                        Text(
                          "4 members",
                          style: AppTextStyles.bodyMedium.copyWith(color: Colors.grey),
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
                                onPressed: () {
                                  Get.to(()=>InviteMembersScreen());
                                },
                                icon: const Icon(
                                  Icons.person_add_alt_1_outlined,
                                  size: 17,
                                  color: Colors.black,
                                ),
                                label: Text(
                                  "Invite",
                                  style: AppTextStyles.bodyMedium.copyWith(
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
                          const SizedBox(width: 24),
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
                                label: Text(
                                  "Create PullUp",
                                  style: AppTextStyles.bodyMedium.copyWith(
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
                    const SizedBox(height: 32),

                    // Members Card
                    //  bg #E4E6ED, border #D8DAE5
                    GestureDetector(
                      onTap: () => Get.to(() => const CircleMembersScreen()),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 24,
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
                            Text(
                              "4 Members",
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontWeight: FontWeight.w600,
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
                                  _stackedAvatar(
                                    'https://i.postimg.cc/DwbHGFqs/Container.png',
                                    55,
                                  ),
                                ],
                              ),
                            ),

                            // // Arrow button
                            // Container(
                            //   width: 28,
                            //   height: 28,
                            //   decoration: const BoxDecoration(
                            //     color: AppColors.primary,
                            //     shape: BoxShape.circle,
                            //   ),
                            //   child: const Icon(
                            //     Icons.arrow_forward,
                            //     size: 14,
                            //     color: Colors.white,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Tabs + Content Box
                    //  outer bg #E4E6ED,
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
                    const SizedBox(height: 48),

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
                          label: Text(
                            "Leave Circle",
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
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
            errorBuilder: (_, _, _) => const CircleAvatar(
              backgroundColor: Color(0xFFD0D0D0),
              child: Icon(Icons.person, size: 14, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  // Tabs
  //  underline style, no pill/card selection
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
          Container(height: 12, color: const Color(0xFFD8DAE5)),
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
            color: isSelected ? const Color(0xFFE5E6ED) : Colors.transparent,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? Colors.black : Colors.black54,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                sub,
                style: AppTextStyles.caption.copyWith(
                  color: isSelected ? Colors.black54 : Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 6),
              // Underline indicator
              Container(
                height: 3,
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

  // Upcoming Tab
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

  // Past Tab
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
        color: const Color(0xFFD8DAE5),
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
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
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
                      style: AppTextStyles.bodySmall.copyWith(color: Colors.grey),
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
                style: AppTextStyles.bodySmall.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //Pings Tab
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
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: AppTextStyles.caption.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
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
                      style: AppTextStyles.caption.copyWith(color: Colors.grey),
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
                        child: Text(
                          "I'm in",
                          style: AppTextStyles.captionBold.copyWith(
                            color: Colors.white,
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
