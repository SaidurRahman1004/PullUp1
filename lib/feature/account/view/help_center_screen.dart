import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/style/app_colors.dart';

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
            _buildSupportCard(),
            const SizedBox(height: 24),
            const Text(
              "Frequently Asked Questions",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildFaqGroup(
              icon: Icons.chrome_reader_mode_outlined,
              title: "Getting Started",
              items: [
                _FaqItem(
                  question: "What is PullUp?",
                  answer:
                      "PullUp is a social coordination app that helps you organize spontaneous activities with your friends through circles. Create PullUps (events), send pings, and coordinate plans effortlessly.",
                  isExpanded: true,
                ),
                _FaqItem(question: "How do I create a circle?"),
                _FaqItem(question: "How do I join a circle?"),
              ],
            ),
            const SizedBox(height: 16),
            _buildFaqGroup(
              icon: Icons.chat_bubble_outline,
              title: "PullUps & Events",
              items: [
                _FaqItem(question: "What is a PullUp?"),
                _FaqItem(question: "Can I edit a PullUp after creating it?"),
                _FaqItem(question: "What are comments on PullUps?"),
              ],
            ),
            const SizedBox(height: 16),
            _buildFaqGroup(
              icon: Icons.chat_bubble_outline,
              title: "Pings",
              items: [
                _FaqItem(question: "What are pings?"),
                _FaqItem(question: "How long do pings last?"),
              ],
            ),
            const SizedBox(height: 16),
            _buildFaqGroup(
              icon: Icons.shield_outlined,
              title: "Privacy & Safety",
              items: [
                _FaqItem(question: "Who can see my information?"),
                _FaqItem(question: "Can I leave a circle?"),
                _FaqItem(question: "How do I block notifications?"),
              ],
            ),
            const SizedBox(height: 16),
            _buildFaqGroup(
              icon: Icons.workspace_premium_outlined,
              title: "Pro Features",
              items: [
                _FaqItem(question: "What is PullUp Pro?"),
                _FaqItem(question: "How much does Pro cost?"),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F7FB),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Need More Help?",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Can't find what you're looking for? Our\nsupport team is here to help.",
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.email_outlined, size: 20),
                  label: const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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

  Widget _buildFaqGroup({
    required IconData icon,
    required String title,
    required List<_FaqItem> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
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
            ),
            child: Row(
              children: [
                Icon(icon, color: AppColors.primary, size: 22),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          ...items.asMap().entries.map((entry) {
            final isLast = entry.key == items.length - 1;
            final isFirst = entry.key == 0;
            return _buildFaqTile(entry.value, isLast, isFirst);
          }),
        ],
      ),
    );
  }

  Widget _buildFaqTile(_FaqItem item, bool isLast, bool isFirst) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isFirst) const Divider(height: 1, color: Color(0xFFF3F4F6)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  item.question,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                item.isExpanded ? Icons.keyboard_arrow_up : Icons.chevron_right,
                size: 20,
                color: const Color(0xFF9CA3AF),
              ),
            ],
          ),
        ),
        if (item.isExpanded && item.answer != null)
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              item.answer!,
              style: const TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ),
        if (isLast && !item.isExpanded) const SizedBox(height: 4),
      ],
    );
  }
}

class _FaqItem {
  final String question;
  final String? answer;
  final bool isExpanded;

  _FaqItem({required this.question, this.answer, this.isExpanded = false});
}
