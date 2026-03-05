import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text(
                AppStrings.enterOTP,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                AppStrings.otpSubtitle,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),
              Pinput(
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                AppStrings.resendCode,
                style: TextStyle(color: Colors.grey),
              ),
              const Spacer(),
              CustomButton(
                text: AppStrings.verify,
                onPressed: () {
                  ///ToDO
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
