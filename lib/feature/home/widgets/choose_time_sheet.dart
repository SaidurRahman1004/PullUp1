import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/style/app_colors.dart';
import '../controllers/ping_controller.dart';

class ChooseTimeSheet extends StatelessWidget {
  const ChooseTimeSheet({super.key});

  static const double _itemH = 40.0;
  static const List<String> _tabs = ["Today", "Tomorrow", "Calendar"];

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<PingController>();

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
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
                "Choose Time",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Date",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),

            _buildSegmented(ctrl),
            const SizedBox(height: 12),

            _buildPicker(ctrl),
            const SizedBox(height: 12),

            const Center(
              child: Text(
                "Expires in 3h",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            const SizedBox(height: 20),

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
                onPressed: () => Get.back(),
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

  // Tab: selected=blue fill, unselected=white + black border
  Widget _buildSegmented(PingController ctrl) {
    return Obx(() {
      final sel = ctrl.selectedTimeTab.value;
      return Row(
        children: List.generate(_tabs.length, (i) {
          final active = sel == i;
          final isFirst = i == 0;
          final isLast = i == _tabs.length - 1;
          return Expanded(
            child: GestureDetector(
              onTap: () => ctrl.setTimeTab(i),
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
                  _tabs[i],
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

  // Compact picker with unified center band
  Widget _buildPicker(PingController ctrl) {
    return SizedBox(
      height: _itemH * 4.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Unified highlight band across all columns
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
              // Hour 1-12
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

              // Colon
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

              // Minute 0-59
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

              // AM / PM
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
