import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/style/app_colors.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

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
          "Terms of Service",
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
              _buildInfoCard(
                Icons.description_outlined,
                "Terms of Service",
                "Last updated: January 24, 2026",
                "Please read these Terms of Service\ncarefully before using PullUp.",
              ),
              const SizedBox(height: 24),
              _buildPolicyContent(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String date, String sub) {
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
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.primary, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            sub,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF4B5563),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicyContent() {
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
          _policySection(
            "1. Acceptance of Terms",
            "By accessing or using PullUp, you agree to be bound by these Terms of Service and all applicable laws and regulations. If you do not agree with any of these terms, you are prohibited from using or accessing this application.",
          ),
          _policySection(
            "2. Use License",
            "PullUp grants you a personal, non-exclusive, non-transferable, limited license to use the application for personal, non-commercial purposes, subject to these Terms.\nYou may not:\n\n  Modify or copy the application materials\n  Use the materials for any commercial purpose\n  Attempt to reverse engineer any software in the application\n  Remove any copyright or proprietary notations\n  Transfer the materials to another person",
          ),
          _policySection(
            "3. User Accounts",
            "To use certain features of PullUp, you must create an account using your phone number. You are responsible for:\n\n  Maintaining the confidentiality of your account\n  All activities that occur under your account\n  Notifying us immediately of any unauthorized use",
          ),
          _policySection(
            "4. User Conduct",
            "You agree not to use PullUp to:\n\n  Harass, abuse, or harm another person\n  Post false, inaccurate, or misleading information\n  Impersonate any person or entity\n  Violate any local, state, national, or international law\n  Distribute spam or unsolicited messages\n  Interfere with or disrupt the application or servers",
          ),
          _policySection(
            "5. Circles and Content",
            "You retain ownership of any content you create or share in PullUp. By posting content, you grant PullUp a non-exclusive license to use, store, and display that content as necessary to provide the service. You are solely responsible for the content you share within circles.",
          ),
          _policySection(
            "6. Privacy",
            "Your use of PullUp is also governed by our Privacy Policy. Please review our Privacy Policy to understand our practices regarding your personal information.",
          ),
          _policySection(
            "7. PullUp Pro Subscription",
            "PullUp Pro is a paid subscription service with the following terms:\n\n  7-day free trial for new subscribers\n  Monthly (\$4.99) or annual (\$49.99) billing options\n  Automatic renewal unless canceled 24 hours before period ends\n  No refunds for partial subscription periods\n  Cancel anytime through your account settings",
          ),
          _policySection(
            "8. Termination",
            "We reserve the right to terminate or suspend your account immediately, without prior notice or liability, for any reason, including breach of these Terms. Upon termination, your right to use the application will immediately cease.",
          ),
          _policySection(
            "9. Disclaimers",
            "PullUp is provided \"as is\" without any warranties, expressed or implied. We do not guarantee that the application will be uninterrupted, secure, or error-free. Use of the application is at your own risk.",
          ),
          _policySection(
            "10. Limitation of Liability",
            "In no event shall PullUp or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit) arising out of the use or inability to use the application.",
          ),
          _policySection(
            "11. Changes to Terms",
            "We reserve the right to modify these Terms at any time. We will notify users of any material changes. Your continued use of PullUp after such modifications constitutes your acceptance of the updated Terms.",
          ),
          _policySection(
            "12. Contact Information",
            "If you have any questions about these Terms, please contact us at:",
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
                  "PullUp Support",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "support@pullup.app",
                  style: TextStyle(fontSize: 14, color: Color(0xFF4B5563)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
          const Divider(color: Color(0xFFE5E7EB), height: 1),
          const SizedBox(height: 24),
          const Center(
            child: Text(
              "By using PullUp, you acknowledge that you\nhave read and understood these Terms of\nService and agree to be bound by them.",
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
