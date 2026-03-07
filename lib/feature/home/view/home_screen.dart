import 'package:evenjr_clone/feature/home/view/ping_details_screen.dart';
import 'package:evenjr_clone/feature/home/view/pull_up_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/style/app_colors.dart';
import '../controller/home_controller.dart';
import '../widgets/ping_item.dart';
import '../widgets/stat_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 12),

                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppAssets.appLogo, height: 32),
                      ClipOval(
                        child: Image.network(
                          'https://i.pravatar.cc/150?img=12',
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => const CircleAvatar(
                            radius: 18,
                            child: Icon(Icons.person, size: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Stat Cards
                  Row(
                    children: [
                      StatCard(
                        count: "2",
                        label: AppStrings.yourCircles,
                        iconPath: AppAssets.bottomCircles,
                      ),
                      const SizedBox(width: 12),
                      StatCard(
                        count: "2",
                        label: AppStrings.upcoming,
                        iconPath: AppAssets.homeCalendar,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  //Notification Banner
                  _buildNotificationBanner(),
                  const SizedBox(height: 12),

                  // Invite Card
                  _buildInviteCard(),
                  const SizedBox(height: 20),

                  // Im FreeSection
                  _buildFreeStatusSection(controller),
                  const SizedBox(height: 24),

                  // Active Pings
                  const Text(
                    AppStrings.activePings,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 12),
                  PingItem(
                    title: "Dinner + Drinks?\nI'm free, anyone down?",
                    time: "2h 58m",
                    onTap: () => Get.to(
                      () => const PingDetailsScreen(
                        title: "Dinner + Drinks?\nI'm free, anyone down?",
                        time: "2h 58m",
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Upcoming PullUps
                  const Text(
                    AppStrings.upcomingPullups,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 12),

                  _buildPullUpCard(
                    title: "Lunch Meetup",
                    circle: "Foodies",
                    dateTime: "in 33m",
                    location: "The Burger Joint",
                    postedBy: "Ryani",
                    status: "Going",
                    icon: AppAssets.homeDinner,
                    onTap: () => Get.to(
                      () => const PullUpDetailsScreen(
                        title: "Lunch Meetup",
                        circle: "Foodies",
                        icon: AppAssets.homeDinner,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildPullUpCard(
                    title: "Gym Session",
                    circle: "XDZ",
                    dateTime: "Jan 21, 6:00 PM",
                    location: "The Burger Joint",
                    postedBy: "Ryani",
                    status: "Going",
                    icon: AppAssets.circleGym,
                    onTap: () => Get.to(
                      () => const PullUpDetailsScreen(
                        title: "Gym Session",
                        circle: "XDZ",
                        icon: AppAssets.joinGymWhite,
                      ),
                    ),
                  ),

                  const SizedBox(height: 110),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.notifyBannerBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFE58F)),
      ),
      child: Row(
        children: [
          Image.asset(
            AppAssets.bottomNotification,
            width: 22,
            height: 22,
            color: AppColors.notifyButton,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.turnOnNotify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF874D00),
                  ),
                ),
                Text(
                  AppStrings.turnOnNotifySub,
                  style: TextStyle(fontSize: 11, color: Color(0xFF874D00)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.notifyButton,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              AppStrings.enable,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInviteCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.inviteBannerBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD1E9FF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person_add_outlined,
                color: AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  AppStrings.inviteYourPeople,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.close, size: 16, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            AppStrings.inviteYourPeopleSub,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.1,
              backgroundColor: Colors.white,
              color: AppColors.primary,
              minHeight: 5,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    AppStrings.invitePeople,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  AppStrings.skip,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFreeStatusSection(HomeController controller) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.imFree,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      AppStrings.imFreeSubtitle,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Switch(
                  value: controller.isFree.value,
                  onChanged: controller.toggleFreeStatus,
                  activeThumbColor: AppColors.primary,
                ),
              ),
            ],
          ),
          // --- Filter Chips (Segmented Control style) ---
          Obx(() {
            const filters = [
              AppStrings.now,
              AppStrings.later,
              AppStrings.tonight,
            ];
            return Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: filters.map((label) {
                  final isSelected = controller.selectedFilter.value == label;
                  return GestureDetector(
                    onTap: () => controller.setFilter(label),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withAlpha(50),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Text(
                        label,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black54,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPullUpCard({
    required String title,
    required String circle,
    required String dateTime,
    required String location,
    required String postedBy,
    required String status,
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Icon
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(icon, color: Colors.white),
              ),
            ),
            const SizedBox(width: 12),

            // Center Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.successGreen.withAlpha(20),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          status,
                          style: const TextStyle(
                            color: AppColors.successGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    circle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 8),

                  // Date
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 13,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        dateTime,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 13,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        location,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Posted by + avatars
                  Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        size: 13,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Posted by $postedBy",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      _buildStackedAvatars(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // homeProfiles asset already contains stacked avatars + +4 badge
  Widget _buildStackedAvatars() {
    return Image.asset(AppAssets.homeProfiles, height: 28, fit: BoxFit.contain);
  }
}
