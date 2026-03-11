import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/style/app_colors.dart';
import '../controller/ping_controller.dart';

class ChooseTimeSheet extends StatelessWidget {
  const ChooseTimeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final PingController controller = Get.find<PingController>();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Choose Time",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 20),

            // Today / Tomorrow / Calendar tabs
            _DateTabs(controller: controller),

            const SizedBox(height: 24),

            // Hour : Minute + AM/PM picker
            _TimePicker(controller: controller),

            const SizedBox(height: 16),

            const Text(
              "Expires in 3h",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 20),

            // Done button
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
}

// Today / Tomorrow / Calendar segmented tab bar
class _DateTabs extends StatelessWidget {
  final PingController controller;
  const _DateTabs({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selected = controller.selectedTimeTab.value;
      return Container(
        height: 44,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            _tab(0, "Today", selected),
            _tab(1, "Tomorrow", selected),
            _tab(2, "Calendar", selected),
          ],
        ),
      );
    });
  }

  Widget _tab(int index, String label, int selected) {
    final bool isSelected = selected == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.setTimeTab(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(9),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

// Custom scroll picker: Hour : Minute  AM/PM
class _TimePicker extends StatelessWidget {
  final PingController controller;
  const _TimePicker({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Row(
        children: [
          // Hour picker
          Expanded(child: _ScrollColumn(itemCount: 12, startValue: 1, controller: controller, type: 'hour')),

          // Colon separator
          const Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Text(
              ":",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),

          // Minute picker
          Expanded(child: _ScrollColumn(itemCount: 60, startValue: 0, controller: controller, type: 'minute')),

          const SizedBox(width: 8),

          // AM / PM picker
          SizedBox(width: 60, child: _AmPmColumn(controller: controller)),
        ],
      ),
    );
  }
}

// Generic scroll column for hour or minute
class _ScrollColumn extends StatefulWidget {
  final int itemCount;
  final int startValue;
  final PingController controller;
  final String type; // 'hour' or 'minute'

  const _ScrollColumn({
    required this.itemCount,
    required this.startValue,
    required this.controller,
    required this.type,
  });

  @override
  State<_ScrollColumn> createState() => _ScrollColumnState();
}

class _ScrollColumnState extends State<_ScrollColumn> {
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    // Default: hour=11, minute=3 (matching figma screenshot)
    final initialIndex = widget.type == 'hour' ? 10 : 3;
    _scrollController = FixedExtentScrollController(initialItem: initialIndex);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      controller: _scrollController,
      itemExtent: 44,
      perspective: 0.003,
      diameterRatio: 2.5,
      physics: const FixedExtentScrollPhysics(),
      onSelectedItemChanged: (index) {
        final value = widget.startValue + index;
        if (widget.type == 'hour') {
          widget.controller.selectedHour.value = value;
        } else {
          widget.controller.selectedMinute.value = value;
        }
      },
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: widget.itemCount,
        builder: (context, index) {
          final value = widget.startValue + index;
          return Obx(() {
            final selectedVal = widget.type == 'hour'
                ? widget.controller.selectedHour.value
                : widget.controller.selectedMinute.value;
            final isSelected = selectedVal == value;

            return Container(
              alignment: Alignment.center,
              decoration: isSelected
                  ? BoxDecoration(
                      color: const Color(0xFFF2F2F7),
                      borderRadius: BorderRadius.circular(8),
                    )
                  : null,
              child: Text(
                widget.type == 'minute'
                    ? value.toString().padLeft(2, '0')
                    : value.toString(),
                style: TextStyle(
                  fontSize: isSelected ? 22 : 17,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.black38,
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

// AM / PM scroll column
class _AmPmColumn extends StatefulWidget {
  final PingController controller;
  const _AmPmColumn({required this.controller});

  @override
  State<_AmPmColumn> createState() => _AmPmColumnState();
}

class _AmPmColumnState extends State<_AmPmColumn> {
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    // Default AM selected
    _scrollController = FixedExtentScrollController(initialItem: 0);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      controller: _scrollController,
      itemExtent: 44,
      perspective: 0.003,
      diameterRatio: 2.5,
      physics: const FixedExtentScrollPhysics(),
      onSelectedItemChanged: (index) {
        widget.controller.selectedAmPm.value = index == 0 ? 'AM' : 'PM';
      },
      children: ['AM', 'PM'].asMap().entries.map((entry) {
        final label = entry.value;
        return Obx(() {
          final isSelected = widget.controller.selectedAmPm.value == label;
          return Container(
            alignment: Alignment.center,
            decoration: isSelected
                ? BoxDecoration(
                    color: const Color(0xFFF2F2F7),
                    borderRadius: BorderRadius.circular(8),
                  )
                : null,
            child: Text(
              label,
              style: TextStyle(
                fontSize: isSelected ? 22 : 17,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.black : Colors.black38,
              ),
            ),
          );
        });
      }).toList(),
    );
  }
}
