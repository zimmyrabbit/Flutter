import 'package:calendar_schedular/component/schedule_card.dart';
import 'package:flutter/material.dart';

import '../component/calendar.dart';
import '../component/today_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Calendar(
            selectedDay: selectedDay,
            focusedDay: focusedDay,
            onDaySelected: onDaySelected,
          ),
          SizedBox(height: 8.0),
          TodayBanner(
            selectedDay: selectedDay,
            scheduleCount: 3,
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8.0);
                },
                itemBuilder: (context, index) {
                  return ScheduleCard(
                    startTime: 8,
                    endTime: 14,
                    content: '프로그래밍 ${index}',
                    color: Colors.red,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }

  //특정 날짜를 고를 때 실행
  onDaySelected(
    DateTime selectedDay,
    DateTime focusedDay,
  ) {
    print(selectedDay);
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}
