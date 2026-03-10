import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../feature/home/view/send_ping_screen.dart';
import '../const/app_strings.dart';
import '../style/app_colors.dart';
import '../../feature/home/widgets/choose_circle_sheet.dart';
import '../../feature/community/widgets/invite_link_dialog.dart';
import '../../feature/new_user_flow/view/create_circle_screen.dart';

class ActionBottomSheet extends StatelessWidget {
  const ActionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        // Symmetric horizontal margin creates floating card effect (Figma)
        padding: EdgeInsets.fromLTRB(
          32,
          0,
          32,
          MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD0D0D0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              // Header row
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      AppStrings.whatDoYouWantToDo,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF0F0F5),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1, color: Colors.black12),

              // Action items with dividers between them
              _buildActionItem(
                context: context,
                icon: Icons.calendar_today_outlined,
                title: AppStrings.postPullUp,
                subtitle: AppStrings.postPullUpDesc,
                showDivider: true,
                onTap: () {
                  Get.back();
                  Get.bottomSheet(
                    ChooseCircleSheet(onCircleSelected: (name, icon) {}),
                    isScrollControlled: true,
                  );
                },
              ),
              _buildActionItem(
                context: context,
                icon: Icons.sensors_rounded,
                title: AppStrings.pingCircleLabel,
                subtitle: AppStrings.pingCircleDesc,
                showDivider: true,
                onTap: () {
                  Get.back();
                  Get.bottomSheet(
                    ChooseCircleSheet(
                      onCircleSelected: (name, icon) {
                        Get.to(
                          () => SendPingScreen(
                            circleName: name,
                            circleIcon: icon,
                          ),
                        );
                      },
                    ),
                    isScrollControlled: true,
                  );
                },
              ),
              _buildActionItem(
                context: context,
                icon: Icons.groups_outlined,
                title: AppStrings.createCircleAction,
                subtitle: AppStrings.createCircleDesc,
                showDivider: true,
                onTap: () {
                  Get.back();
                  Get.to(() => const CreateCircleScreen());
                },
              ),
              _buildActionItem(
                context: context,
                icon: Icons.person_add_outlined,
                title: AppStrings.inviteFriendsLabel,
                subtitle: AppStrings.inviteFriendsDesc,
                showDivider: false,
                onTap: () {
                  Get.back();
                  Get.bottomSheet(
                    ChooseCircleSheet(
                      onCircleSelected: (name, icon) {
                        Get.dialog(InviteLinkDialog(circleName: name));
                      },
                    ),
                    isScrollControlled: true,
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool showDivider,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F7FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: AppColors.primary, size: 22),
                ),
                const SizedBox(width: 14),
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
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF0F0F5),
            indent: 20,
            endIndent: 20,
          ),
      ],
    );
  }
}
