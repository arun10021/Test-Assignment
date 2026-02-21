import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_assignment/screens/home/home_screen.dart';
import 'package:test_assignment/screens/schedule_screen/widgets/circle_button.dart';
import 'package:test_assignment/screens/schedule_screen/widgets/empty_state.dart';
import 'package:test_assignment/screens/schedule_screen/widgets/notification_button.dart';
import 'package:test_assignment/screens/schedule_screen/widgets/schedule_card.dart';
import 'package:test_assignment/screens/schedule_screen/widgets/week_row.dart';
import '../../providers/app_provider.dart';
import '../../utils/app_constants.dart';
import '../home/provider/navigation_provider.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ScheduleProvider>();
    final navigationProvider = context.watch<NavigationProvider>();
    final schedulesForDay = provider.schedulesForSelectedDate;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  CircleButton(icon: Icons.chevron_left, onTap: () {navigationProvider.setIndex(0); }),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Schedule',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ),
                  const NotificationButton(),
                ],
              ),
            ),

            const SizedBox(height: 8),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFB4BCC9).withOpacity(0.16),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                child: Column(
                  children: [
                    // Month header + prev/next arrows
                    Row(
                      children: [
                        Text(
                          _formatMonthYear(provider.selectedDate),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: provider.goToPreviousWeek,
                          child: const Icon(
                            Icons.chevron_left,
                            size: 22,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: provider.goToNextWeek,
                          child: const Icon(
                            Icons.chevron_right,
                            size: 22,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),


                    WeekRow(
                      weekDays: provider.currentWeekDays,
                      selectedDate: provider.selectedDate,
                      hasSchedule: provider.hasSchedule,
                      onDayTap: provider.setSelectedDate,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    'My Schedule',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textDark,
                    ),
                  ),
                  const Spacer(),
                  if (schedulesForDay.isNotEmpty)
                    const Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: schedulesForDay.isEmpty
                  ? EmptyState(selectedDate: provider.selectedDate)
                  : ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: schedulesForDay.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return ScheduleCard(schedule: schedulesForDay[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatMonthYear(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${date.day} ${months[date.month - 1]}';
  }
}











