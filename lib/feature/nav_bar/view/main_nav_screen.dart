import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../account/view/profile_screen.dart';
import '../../community/view/circles_screen.dart';
import '../../home/view/home_screen.dart';
import '../../notifications/view/notifications_screen.dart';
import '../controllers/nav_controller.dart';
import '../widgets/nav_fab_widget.dart';
import '../widgets/nav_item_widget.dart';

class MainNavScreen extends StatelessWidget {
  const MainNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavController controller = Get.put(NavController());

    final List<Widget> pages = [
      const HomeScreen(),
      const CirclesScreen(),
      const NotificationsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      extendBody: true,
      body: Obx(() => pages[controller.currentIndex.value]),
      floatingActionButton: const NavFabWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(15),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomAppBar(
            padding: const EdgeInsets.symmetric(vertical: 0),
            height: 80,
            color: Colors.white,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavItemWidget(
                  controller: controller,
                  index: 0,
                  inactiveIcon: AppAssets.bottomProfile, // Inactive
                  activeIcon: AppAssets.bottomProfileActive, // Active
                  label: "Home",
                ),
                NavItemWidget(
                  controller: controller,
                  index: 1,
                  inactiveIcon: AppAssets.bottomCircles, // Inactive
                  activeIcon: AppAssets.bottomCirclesActive, // Active
                  label: "Circles",
                ),
                const SizedBox(width: 48),
                NavItemWidget(
                  controller: controller,
                  index: 2,
                  inactiveIcon: AppAssets.bottomNotification, // Inactive
                  activeIcon: AppAssets.bottomNotificationActive, // Active
                  label: "Notifications",
                ),
                NavItemWidget(
                  controller: controller,
                  index: 3,
                  inactiveIcon: AppAssets.profileBottom, // Inactive (using profile asset)
                  activeIcon: AppAssets.profileBottomActive,
                  // Active (using your specific active asset)
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
