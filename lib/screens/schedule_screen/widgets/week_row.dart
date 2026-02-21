import 'package:flutter/material.dart';
import 'package:test_assignment/utils/app_constants.dart';

class WeekRow extends StatelessWidget {
  final List<DateTime> weekDays;
  final DateTime selectedDate;
  final bool Function(DateTime) hasSchedule;
  final ValueChanged<DateTime> onDayTap;

  const WeekRow({
    super.key,
    required this.weekDays,
    required this.selectedDate,
    required this.hasSchedule,
    required this.onDayTap,
  });

  static const _labels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  bool _isSame(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (i) {
        final day = weekDays[i];
        final isSelected = _isSame(day, selectedDate);
        final hasDot = !isSelected && hasSchedule(day);

        return GestureDetector(
          onTap: () => onDayTap(day),
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            width: 40,
            child: isSelected
                ? Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _labels[i],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFD4C2),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${day.day}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
                : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _labels[i],
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGray,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${day.day}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: hasDot ? AppColors.primary : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}