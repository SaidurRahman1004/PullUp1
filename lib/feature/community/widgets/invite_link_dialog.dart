import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/style/app_colors.dart';

class InviteLinkSheet extends StatelessWidget {
  final String circleName;

  const InviteLinkSheet({super.key, required this.circleName});

  // Use Get.bottomSheet to show this correctly at the bottom with margins
  static void show(String circleName) {
    Get.bottomSheet(
      InviteLinkSheet(circleName: circleName),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        // Left/right/bottom margin creates floating card effect (Figma)
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 22),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD0D0D0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              // Title + close button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${AppStrings.inviteTo} $circleName",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Divider between header and buttons (Figma)
              const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
              const SizedBox(height: 16),

              // Copy Link button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Clipboard.setData(
                      const ClipboardData(
                        text: "https://evenjr.app/invite/join",
                      ),
                    );
                    Get.back();
                    Get.snackbar(
                      "Copied!",
                      "Invite link copied to clipboard",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  icon: const Icon(Icons.copy_rounded, size: 18),
                  label: const Text(
                    AppStrings.copyLink,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Color(0xFFE0E0E0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Share button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_outlined,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: const Text(
                    AppStrings.share,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
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
            ],
          ),
        ),
      ),
    );
  }
}

// Keep old name as alias so existing imports don't break
typedef InviteLinkDialog = InviteLinkSheet;
