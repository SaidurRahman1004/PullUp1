import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/const/app_assets.dart';
import '../../../core/const/app_strings.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../core/global_widgets/custom_text_field.dart';
import 'notification_permission_screen.dart';
import '../../../core/global_widgets/custom_date_time_picker_sheet.dart';

class CreatePullUpScreen extends StatefulWidget {
  final String circleName;
  final String circleIcon;

  const CreatePullUpScreen({
    super.key,
    this.circleName = 'Gym Crew',
    this.circleIcon = AppAssets.circleGym,
  });

  @override
  State<CreatePullUpScreen> createState() => _CreatePullUpScreenState();
}

class _CreatePullUpScreenState extends State<CreatePullUpScreen> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();


  DateTime? _selectedDateTime;

  Future<void> _selectDateOrTime(BuildContext context) async {
    final DateTime? picked = await CustomDateTimePickerSheet.show(
      context, 
      initialDate: _selectedDateTime, 
      initialTime: _selectedDateTime != null ? TimeOfDay.fromDateTime(_selectedDateTime!) : null,
    );
    if (picked != null) {
      setState(() {
         _selectedDateTime = picked;
         dateController.text = DateFormat('MM/dd/yy').format(picked);
         timeController.text = DateFormat('h:mm a').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use the circle name and icon passed from the navigation flow
    final String circleName = widget.circleName;
    final String circleIcon = widget.circleIcon;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(AppStrings.createPullUpTitle, style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w800, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Circle",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE0E0E0))),
              child: Row(
                children: [
                  Image.asset(circleIcon, width: 24),
                  const SizedBox(width: 12),
                  Text(circleName,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const CustomTextField(labelText: AppStrings.titleLabel,
                hintText: AppStrings.titleHint),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap: () => _selectDateOrTime(context),
                  child: AbsorbPointer(child: CustomTextField(
                      controller: dateController,
                      labelText: AppStrings.dateLabel,
                      hintText: "Select Date",
                      prefixIcon: const Icon(
                          Icons.calendar_today_outlined, size: 20))),
                )),
                const SizedBox(width: 16),
                Expanded(child: GestureDetector(
                  onTap: () => _selectDateOrTime(context),
                  child: AbsorbPointer(child: CustomTextField(
                      controller: timeController,
                      labelText: AppStrings.timeLabel,
                      hintText: "Select Time",
                      prefixIcon: const Icon(Icons.access_time, size: 20))),
                )),
              ],
            ),
            const SizedBox(height: 20),
            const CustomTextField(labelText: AppStrings.locationLabel,
                hintText: "Add Location",
                prefixIcon: Icon(
                    Icons.location_on_outlined, size: 20, color: Colors.grey)),
            const SizedBox(height: 20),
            const Text(AppStrings.detailsLabel,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 8),
            TextField(
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Add any additional details...",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
              ),
            ),
            const SizedBox(height: 40),
            CustomButton(text: AppStrings.postPullUpBtn,
                onPressed: () =>
                    Get.to(() => const NotificationPermissionScreen())),
          ],
        ),
      ),
    );
  }
}