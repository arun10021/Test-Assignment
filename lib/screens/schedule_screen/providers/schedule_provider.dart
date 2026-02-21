import 'package:flutter/material.dart';
import '../../../models/destination_model.dart';
import '../../../utils/dummy_data.dart';

class ScheduleProvider extends ChangeNotifier {
  final List<ScheduleModel> _allSchedules = List.from(DummyData.mySchedule);


  DateTime _selectedDate = DateTime(2023, 10, 22);

  List<ScheduleModel> get allSchedules => _allSchedules;
  DateTime get selectedDate => _selectedDate;


  List<DateTime> get currentWeekDays {
    final weekday = _selectedDate.weekday % 7;
    final sunday = _selectedDate.subtract(Duration(days: weekday));
    return List.generate(7, (i) => sunday.add(Duration(days: i)));
  }


  List<ScheduleModel> get schedulesForSelectedDate {
    return _allSchedules
        .where((s) => _isSameDay(s.scheduledDate, _selectedDate))
        .toList();
  }


  bool hasSchedule(DateTime day) {
    return _allSchedules.any((s) => _isSameDay(s.scheduledDate, day));
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void goToPreviousWeek() {
    _selectedDate = _selectedDate.subtract(const Duration(days: 7));
    notifyListeners();
  }

  void goToNextWeek() {
    _selectedDate = _selectedDate.add(const Duration(days: 7));
    notifyListeners();
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}