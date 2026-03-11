import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../style/app_colors.dart';

class CustomDateTimePickerCtrl extends GetxController {
  final DateTime? initialDate;
  final TimeOfDay? initialTime;

  CustomDateTimePickerCtrl({this.initialDate, this.initialTime});

  var selectedTab = 0.obs;
  var selectedHour = 11.obs;
  var selectedMinute = 0.obs;
  var selectedAmPm = 0.obs;
  DateTime? customCalendarDate;

  late FixedExtentScrollController hourScrollCtrl;
  late FixedExtentScrollController minuteScrollCtrl;
  late FixedExtentScrollController amPmScrollCtrl;

  @override
  void onInit() {
    super.onInit();
    final now = DateTime.now();
    final initDate = initialDate ?? now;

    if (initDate.year == now.year &&
        initDate.month == now.month &&
        initDate.day == now.day) {
      selectedTab.value = 0;
    } else {
      final tomorrow = now.add(const Duration(days: 1));
      if (initDate.year == tomorrow.year &&
          initDate.month == tomorrow.month &&
          initDate.day == tomorrow.day) {
        selectedTab.value = 1;
      } else {
        selectedTab.value = 2;
        customCalendarDate = initDate;
      }
    }

    final initTime = initialTime ?? TimeOfDay.now();
    int h = initTime.hour;
    selectedAmPm.value = h >= 12 ? 1 : 0;
    int displayHour = h % 12;
    if (displayHour == 0) displayHour = 12;
    selectedHour.value = displayHour;
    selectedMinute.value = initTime.minute;

    hourScrollCtrl = FixedExtentScrollController(
      initialItem: selectedHour.value - 1,
    );
    minuteScrollCtrl = FixedExtentScrollController(
      initialItem: selectedMinute.value,
    );
    amPmScrollCtrl = FixedExtentScrollController(
      initialItem: selectedAmPm.value,
    );
  }

  void setTab(int index, BuildContext context) async {
    if (index == 2) {
      final picked = await showDatePicker(
        context: context,
        initialDate: customCalendarDate ?? DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2030),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.primary,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null) {
        customCalendarDate = picked;
        selectedTab.value = index;
      }
    } else {
      selectedTab.value = index;
    }
  }

  @override
  void onClose() {
    hourScrollCtrl.dispose();
    minuteScrollCtrl.dispose();
    amPmScrollCtrl.dispose();
    super.onClose();
  }

  DateTime getSelectedDateTime() {
    DateTime baseDate;
    final now = DateTime.now();
    if (selectedTab.value == 0) {
      baseDate = DateTime(now.year, now.month, now.day);
    } else if (selectedTab.value == 1) {
      final tomorrow = now.add(const Duration(days: 1));
      baseDate = DateTime(tomorrow.year, tomorrow.month, tomorrow.day);
    } else {
      baseDate = customCalendarDate ?? DateTime(now.year, now.month, now.day);
    }

    int h = selectedHour.value;
    if (selectedAmPm.value == 1 && h < 12) h += 12;
    if (selectedAmPm.value == 0 && h == 12) h = 0;

    return DateTime(
      baseDate.year,
      baseDate.month,
      baseDate.day,
      h,
      selectedMinute.value,
    );
  }
}

class CustomDateTimePickerSheet extends StatelessWidget {
  const CustomDateTimePickerSheet._internal({this.tag});

  final String? tag;

  static const double _itemH = 40.0;
  static const List<String> _tabs = ["Today", "Tomorrow", "Calendar"];

  static Future<DateTime?> show(
    BuildContext context, {
    DateTime? initialDate,
    TimeOfDay? initialTime,
  }) {
    final tag = DateTime.now().millisecondsSinceEpoch.toString();
    Get.put(
      CustomDateTimePickerCtrl(
        initialDate: initialDate,
        initialTime: initialTime,
      ),
      tag: tag,
    );
    return showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomDateTimePickerSheet._internal(tag: tag),
    ).whenComplete(() {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (Get.isRegistered<CustomDateTimePickerCtrl>(tag: tag)) {
          Get.delete<CustomDateTimePickerCtrl>(tag: tag);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CustomDateTimePickerCtrl>(tag: tag);

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFDDDDDD),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "Choose Date & Time",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Date",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            _buildSegmented(ctrl, context),
            const SizedBox(height: 12),
            _buildPicker(ctrl),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Get.back(result: ctrl.getSelectedDateTime());
                },
                child: const Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSegmented(CustomDateTimePickerCtrl ctrl, BuildContext context) {
    return Obx(() {
      final sel = ctrl.selectedTab.value;
      return Row(
        children: List.generate(_tabs.length, (i) {
          final active = sel == i;
          final isFirst = i == 0;
          final isLast = i == _tabs.length - 1;

          String label = _tabs[i];
          if (i == 2 && ctrl.customCalendarDate != null && sel == 2) {
            label =
                "${ctrl.customCalendarDate!.day}/${ctrl.customCalendarDate!.month}";
          }

          return Expanded(
            child: GestureDetector(
              onTap: () => ctrl.setTab(i, context),
              child: Container(
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: active ? AppColors.primary : Colors.white,
                  border: Border(
                    top: const BorderSide(color: Colors.black, width: 1),
                    bottom: const BorderSide(color: Colors.black, width: 1),
                    left: const BorderSide(color: Colors.black, width: 1),
                    right: isLast
                        ? const BorderSide(color: Colors.black, width: 1)
                        : BorderSide.none,
                  ),
                  borderRadius: BorderRadius.horizontal(
                    left: isFirst ? const Radius.circular(8) : Radius.zero,
                    right: isLast ? const Radius.circular(8) : Radius.zero,
                  ),
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: active ? Colors.white : Colors.black87,
                    fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }

  Widget _buildPicker(CustomDateTimePickerCtrl ctrl) {
    return SizedBox(
      height: _itemH * 4.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            height: _itemH,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 64,
                child: _picker(
                  ctrl: ctrl.hourScrollCtrl,
                  count: 12,
                  label: (i) => (i + 1).toString(),
                  onChanged: (i) => ctrl.selectedHour.value = i + 1,
                  looping: true,
                ),
              ),
              const SizedBox(
                width: 20,
                child: Text(
                  ":",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(
                width: 64,
                child: _picker(
                  ctrl: ctrl.minuteScrollCtrl,
                  count: 60,
                  label: (i) => i.toString().padLeft(2, '0'),
                  onChanged: (i) => ctrl.selectedMinute.value = i,
                  looping: true,
                ),
              ),
              const SizedBox(width: 6),
              SizedBox(
                width: 52,
                child: _picker(
                  ctrl: ctrl.amPmScrollCtrl,
                  count: 2,
                  label: (i) => i == 0 ? "AM" : "PM",
                  onChanged: (i) => ctrl.selectedAmPm.value = i,
                  looping: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _picker({
    required FixedExtentScrollController ctrl,
    required int count,
    required String Function(int) label,
    required void Function(int) onChanged,
    required bool looping,
  }) {
    return CupertinoPicker(
      scrollController: ctrl,
      itemExtent: _itemH,
      looping: looping,
      selectionOverlay: const SizedBox.shrink(),
      onSelectedItemChanged: onChanged,
      children: List.generate(count, (i) {
        return Center(
          child: Text(
            label(i),
            style: const TextStyle(fontSize: 20, color: Colors.black87),
          ),
        );
      }),
    );
  }
}
