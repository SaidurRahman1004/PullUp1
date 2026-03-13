import 'package:evenjr_clone/feature/home/view/ping_details_screen.dart';
import 'package:evenjr_clone/feature/home/view/pull_up_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/theme/global_text_style.dart';
import '../controllers/home_controller.dart';
import '../widgets/free_status_section.dart';
import '../widgets/invite_card.dart';
import '../widgets/notification_banner.dart';
import '../widgets/ping_item.dart';
import '../widgets/pull_up_card.dart';
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
                  const NotificationBanner(),
                  const SizedBox(height: 12),

                  // Invite Card
                  const InviteCard(),
                  const SizedBox(height: 20),

                  // Im FreeSection
                  FreeStatusSection(controller: controller),
                  const SizedBox(height: 24),

                  // Active Pings
                  Text(
                    AppStrings.activePings,
                    style: AppTextStyles.heading3.copyWith(fontSize: 18),
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
                  Text(
                    AppStrings.upcomingPullups,
                    style: AppTextStyles.heading3.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 12),

                  PullUpCard(
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

                  PullUpCard(
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
}
