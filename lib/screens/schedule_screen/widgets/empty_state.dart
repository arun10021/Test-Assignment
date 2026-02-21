import 'package:flutter/material.dart';
import 'package:test_assignment/utils/app_constants.dart';

class EmptyState extends StatelessWidget {
  final DateTime selectedDate;
  const EmptyState({super.key, required this.selectedDate});

  String _formatFull(DateTime d) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    const weekdays = [
      'Monday', 'Tuesday', 'Wednesday',
      'Thursday', 'Friday', 'Saturday', 'Sunday',
    ];
    return '${weekdays[d.weekday - 1]}, ${d.day} ${months[d.month - 1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: AppColors.grayLight,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.calendar_today_outlined,
              size: 36,
              color: AppColors.textGray,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'No Schedule',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _formatFull(selectedDate),
            style: const TextStyle(fontSize: 14, color: AppColors.textGray),
          ),
          const SizedBox(height: 4),
          const Text(
            'No trips planned for this day.',
            style: TextStyle(fontSize: 14, color: AppColors.textGray),
          ),
        ],
      ),
    );
  }
}