import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/global_widgets/action_bottom_sheet.dart';
import '../../../core/style/app_colors.dart';
import '../../account/view/profile_screen.dart';
import '../../community/view/circles_screen.dart';
import '../../home/view/home_screen.dart';
import '../../notifications/view/notifications_screen.dart';
import '../controller/nav_controller.dart';

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
      floatingActionButton: GestureDetector(
        onTap: () => Get.bottomSheet(
          const ActionBottomSheet(),
          isScrollControlled: true,
        ),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withAlpha(80),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Center(
            child: Icon(Icons.add, color: Colors.white, size: 28),
          ),
        ),
      ),
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
                _buildNavItem(controller, 0, AppAssets.bottomProfile, "Home"),
                _buildNavItem(
                  controller,
                  1,
                  AppAssets.bottomCircles,
                  "Circles",
                ),
                const SizedBox(width: 48),
                _buildNavItem(
                  controller,
                  2,
                  AppAssets.bottomNotification,
                  "Notifications",
                ),
                _buildNavItem(
                  controller,
                  3,
                  AppAssets.profileBottomActive,
                  "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    NavController controller,
    int index,
    String icon,
    String label,
  ) {
    return Obx(() {
      final bool isActive = controller.currentIndex.value == index;
      return GestureDetector(
        onTap: () => controller.changeIndex(index),
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          width: 65,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: 24,
                height: 24,
                color: isActive ? AppColors.primary : const Color(0xFF8E8E93),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  color: isActive ? AppColors.primary : const Color(0xFF8E8E93),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
