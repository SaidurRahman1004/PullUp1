import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            color: Colors.black.withOpacity(0.04),
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
                  color: const Color(0xFF34C759).withOpacity(0.1),
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
            color: Colors.black.withOpacity(0.04),
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
          
          _policySection(
            "Data Storage and Security",
            "We take reasonable measures to protect your information from unauthorized access, disclosure, or destruction. This includes:\n\n  Encryption of data in transit and at rest\n  Regular security audits and updates\n  Access controls and authentication\n  Secure data centers with industry-standard practices\n\nHowever, no method of transmission over the internet is 100% secure. We cannot guarantee absolute security.",
          ),
          
          _policySection(
            "Data Retention",
            "We retain your information for as long as your account is active or as needed to provide services. When you delete your account, we delete your personal information within 30 days, except where we must retain it for legal compliance.",
          ),
          
          _policySection(
            "Children's Privacy",
            "PullUp is not intended for children under 13 years of age. We do not knowingly collect personal information from children under 13. If we learn that we have collected such information, we will delete it immediately.",
          ),
          
          _policySection(
            "Cookies and Tracking",
            "PullUp uses local storage to maintain your session and preferences. We use analytics to understand how users interact with the app, which helps us improve the experience. You can manage these preferences in your device settings.",
          ),
          
          _policySection(
            "International Users",
            "PullUp is operated in the United States. If you are accessing PullUp from outside the US, your information may be transferred to and processed in the US where our servers are located.",
          ),
          
          _policySection(
            "Changes to This Policy",
            "We may update this Privacy Policy from time to time. We will notify you of any material changes by posting the new policy and updating the \"Last updated\" date. Your continued use after changes constitutes acceptance of the updated policy.",
          ),
          
          _policySection(
            "California Privacy Rights",
            "California residents have additional rights under the California Consumer Privacy Act (CCPA):\n\n  Right to know what personal information is collected\n  Right to know if personal information is sold or disclosed\n  Right to say no to the sale of personal information\n  Right to access your personal information\n  Right to equal service and price",
          ),
          
          _policySection(
            "Contact Us",
            "If you have questions about this Privacy Policy or how we handle your data, please contact us:",
          ),
          
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "privacy@pullup.app",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4B5563),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Mail",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "PullUp Privacy Team\n123 Privacy Street\nSan Francisco, CA 94102",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4B5563),
                    height: 1.5,
                  ),
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

  Widget _policySection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF4B5563),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
