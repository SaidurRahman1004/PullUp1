import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/theme/global_text_style.dart';
import '../widgets/faq_tile_widget.dart';
import '../widgets/help_center_support_card.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6F9),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        titleSpacing: 0,
        title: const Text(
          "Help Center",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            const HelpCenterSupportCard(),
            const SizedBox(height: 24),
            Text(
              "Frequently Asked Questions",
              style: AppTextStyles.heading3.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildFaqGroup(
              assetPath: AppAssets.bookIcon,
              title: "Getting Started",
              items: [
                FaqItem(
                  question: "What is PullUp?",
                  answer:
                      "PullUp is a social coordination app that helps you organize spontaneous activities with your friends through circles. Create PullUps (events), send pings, and coordinate plans effortlessly.",
                  isExpanded: true,
                ),
                FaqItem(
                  question: "How do I create a circle?",
                  answer: "To create a circle, tap the + button on the Circles tab and select Create Circle. You can then invite your friends.",
                ),
                FaqItem(
                  question: "How do I join a circle?",
                  answer: "You can join a circle by entering a 6-digit code or scanning a QR code shared by the circle's owner.",
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildFaqGroup(
              assetPath: AppAssets.chatIcon,
              title: "PullUps & Events",
              items: [
                FaqItem(question: "What is a PullUp?", answer: "A PullUp is an event or gathering created within a circle to coordinate plans with members."),
                FaqItem(question: "Can I edit a PullUp after creating it?", answer: "Yes, the creator of a PullUp can edit its details at any time from the PullUp details screen."),
                FaqItem(question: "What are comments on PullUps?", answer: "Comments allow circle members to discuss and finalize plans directly within a specific PullUp event."),
              ],
            ),
            const SizedBox(height: 16),
            _buildFaqGroup(
              assetPath: AppAssets.chatIcon,
              title: "Pings",
              items: [
                FaqItem(question: "What are pings?", answer: "Pings are quick notifications you can send to circle members to gauge interest for a random hangout."),
                FaqItem(question: "How long do pings last?", answer: "Pings are active for a short period and expire automatically to encourage spontaneous responses."),
              ],
            ),
            const SizedBox(height: 16),
            _buildFaqGroup(
              icon: Icons.shield_outlined,
              title: "Privacy & Safety",
              items: [
                FaqItem(question: "Who can see my information?", answer: "Your information is only visible to members of the circles you have joined."),
                FaqItem(question: "Can I leave a circle?", answer: "Yes, you can leave any circle from the circle settings menu."),
                FaqItem(question: "How do I block notifications?", answer: "You can manage or silence notifications for specific circles or the entire app in Settings."),
              ],
            ),
            const SizedBox(height: 16),
            _buildFaqGroup(
              icon: Icons.workspace_premium_outlined,
              title: "Pro Features",
              items: [
                FaqItem(question: "What is PullUp Pro?", answer: "PullUp Pro is a premium subscription that unlocks advanced features, unlimited PullUps, and priority support."),
                FaqItem(question: "How much does Pro cost?", answer: "PullUp Pro costs \$3.99 per month or \$29.99 per year."),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }



  Widget _buildFaqGroup({
    IconData? icon,
    String? assetPath,
    required String title,
    required List<FaqItem> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(6),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(
              color: Color(0xFFE5E7EB),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1.17)),
            ),
            child: Row(
              children: [
                if (assetPath != null)
                  Image.asset(assetPath, width: 22, height: 22, color: AppColors.primary)
                else if (icon != null)
                  Icon(icon, color: AppColors.primary, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          ...items.asMap().entries.map((entry) {
            final isLast = entry.key == items.length - 1;
            final isFirst = entry.key == 0;
            return FaqTileWidget(item: entry.value, isLast: isLast, isFirst: isFirst);
          }),
        ],
      ),
    );
  }
}


