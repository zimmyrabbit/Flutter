import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      //특정 날짜를 고를 때 실행
      // selectedDay - 실제 선택한 날짜
      onDaySelected: (
        DateTime selectedDay,
        DateTime focusedDay,
      ) {
        print(selectedDay);
        setState(() {
          this.selectedDay = selectedDay;
        });
      },
      //선택된 날짜 표시
      selectedDayPredicate: (DateTime date) {
        if (selectedDay == null) {
          return false;
        }

        return date.year == selectedDay!.year &&
            date.month == selectedDay!.month &&
            date.day == selectedDay!.day;
      },
    );
  }
}
