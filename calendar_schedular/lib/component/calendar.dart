import 'package:calendar_schedular/const/colors.dart';
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
    final defaultBoxDeco = BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(6.0),
    );

    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700,
    );
    
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
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        defaultDecoration: defaultBoxDeco,
        weekendDecoration: defaultBoxDeco,
        selectedDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: PRIMARY_COLOR,
            width: 1.0
          ),
        ),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith(
          color: PRIMARY_COLOR,
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
