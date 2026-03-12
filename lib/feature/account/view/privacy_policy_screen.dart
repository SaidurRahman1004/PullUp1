import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/global_text_style.dart';
import '../widgets/policy_section_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        titleSpacing: 0,
        title: const Text(
          "Privacy Policy",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              _buildPrivacyHeader(),
              const SizedBox(height: 24),
              _buildPrivacyContent(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrivacyHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF34C759).withAlpha(26),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.shield_outlined,
                  color: Color(0xFF34C759),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Last updated: January 24, 2026",
                      style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Your privacy is important to us.\nThis Privacy Policy explains how\nPullUp collects, uses, and protects\nyour personal information.",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF4B5563),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyContent() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "How We Use Your Information",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "We use your information to:\n\n  Provide and maintain the PullUp service\n  Enable you to create and join circles\n  Send notifications about PullUps, pings, and comments\n  Improve and optimize the app experience\n  Provide customer support\n  Detect and prevent fraud or abuse\n  Comply with legal obligations",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF4B5563),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 28),

          const PolicySectionWidget(
            title: "Data Storage and Security",
            content: "We take reasonable measures to protect your information from unauthorized access, disclosure, or destruction. This includes:\n\n  Encryption of data in transit and at rest\n  Regular security audits and updates\n  Access controls and authentication\n  Secure data centers with industry-standard practices\n\nHowever, no method of transmission over the internet is 100% secure. We cannot guarantee absolute security.",
          ),

          const PolicySectionWidget(
            title: "Data Retention",
            content: "We retain your information for as long as your account is active or as needed to provide services. When you delete your account, we delete your personal information within 30 days, except where we must retain it for legal compliance.",
          ),

          const PolicySectionWidget(
            title: "Children's Privacy",
            content: "PullUp is not intended for children under 13 years of age. We do not knowingly collect personal information from children under 13. If we learn that we have collected such information, we will delete it immediately.",
          ),

          const PolicySectionWidget(
            title: "Cookies and Tracking",
            content: "PullUp uses local storage to maintain your session and preferences. We use analytics to understand how users interact with the app, which helps us improve the experience. You can manage these preferences in your device settings.",
          ),

          const PolicySectionWidget(
            title: "International Users",
            content: "PullUp is operated in the United States. If you are accessing PullUp from outside the US, your information may be transferred to and processed in the US where our servers are located.",
          ),

          const PolicySectionWidget(
            title: "Changes to This Policy",
            content: "We may update this Privacy Policy from time to time. We will notify you of any material changes by posting the new policy and updating the \"Last updated\" date. Your continued use after changes constitutes acceptance of the updated policy.",
          ),

          const PolicySectionWidget(
            title: "California Privacy Rights",
            content: "California residents have additional rights under the California Consumer Privacy Act (CCPA):\n\n  Right to know what personal information is collected\n  Right to know if personal information is sold or disclosed\n  Right to say no to the sale of personal information\n  Right to access your personal information\n  Right to equal service and price",
          ),

          const PolicySectionWidget(
            title: "Contact Us",
            content: "If you have questions about this Privacy Policy or how we handle your data, please contact us:",
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email", style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text("privacy@pullup.app", style: AppTextStyles.bodyRegular.copyWith(color: const Color(0xFF4B5563))),
                const SizedBox(height: 16),
                Text("Mail", style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(
                  "PullUp Privacy Team\n123 Privacy Street\nSan Francisco, CA 94102",
                  style: AppTextStyles.bodyRegular.copyWith(color: const Color(0xFF4B5563), height: 1.5),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
          const Divider(color: Color(0xFFE5E7EB), height: 1),
          const SizedBox(height: 24),
          const Center(
            child: Text(
              "By using PullUp, you acknowledge that you\nhave read and understood this Privacy Policy.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF9CA3AF),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
