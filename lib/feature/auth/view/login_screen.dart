import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/style/app_colors.dart';
import '../controller/auth_controller.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isPhoneValid = false;

  @override
  void initState() {
    super.initState();
    // Register AuthController here so it's available throughout the auth flow
    Get.put(AuthController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Text(
                  AppStrings.welcomeTitle,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.welcomeSubtitle,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 40),

                //Phone Phild
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: '000-000-0000',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                  ),
                  initialCountryCode: 'BD',
                  onChanged: (phone) {
                    //valivadion
                    setState(() {
                      isPhoneValid = phone.completeNumber.isNotEmpty;
                    });
                  },
                ),

                const SizedBox(height: 24),
                CustomButton(
                  text: AppStrings.sendOTP,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(() => const OTPScreen());
                    }
                  },
                ),
                const SizedBox(height: 24),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(text: "By continuing, you agree to our "),
                      TextSpan(
                        text: "Terms of Service",
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => debugPrint("Terms Clicked"),
                      ),
                      const TextSpan(text: " and "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => debugPrint("Privacy Clicked"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
