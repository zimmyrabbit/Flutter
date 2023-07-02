import 'package:calendar_schedular/component/schedule_card.dart';
import 'package:calendar_schedular/const/colors.dart';
import 'package:calendar_schedular/model/schdule_with_color.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../component/calendar.dart';
import '../component/schedule_bottom_sheet.dart';
import '../component/today_banner.dart';
import '../database/drift_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(),
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
            _ScheduleList(
              selectedDate: selectedDay,
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          //최대사이즈 전체화면 true
          isScrollControlled: true,
          builder: (_) {
            return ScheduleBottomSheet(
              selectdDate: selectedDay,
            );
          },
        );
      },
      backgroundColor: PRIMARY_COLOR,
      child: Icon(
        Icons.add,
      ),
    );
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

class _ScheduleList extends StatelessWidget {
  final DateTime selectedDate;

  const _ScheduleList({
    required this.selectedDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: StreamBuilder<List<ScheduleWithColor>>(
            stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
            builder: (context, snapshot) {
              //print('-------original data--------');
              //print(snapshot.data);

              //List<Schedule> schedules = [];

              //if (snapshot.hasData) {
              //schedules = snapshot.data!
              //.where((element) => element.date.toUtc() == selectedDate)
              //.toList();

              //print('-------filtered data--------');
              //print(selectedDate.toUtc());
              //print(schedules);
              //}
              print(snapshot.data);
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData && snapshot.data!.isEmpty) {
                return Center(
                  child: Text('스케줄이 없습니다.'),
                );
              }

              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8.0);
                },
                itemBuilder: (context, index) {
                  final scheduleWithColor = snapshot.data![index];
                  return ScheduleCard(
                    startTime: scheduleWithColor.schedule.startTime,
                    endTime: scheduleWithColor.schedule.endTime,
                    content: scheduleWithColor.schedule.content,
                    color: Color(
                      int.parse(
                        'FF${scheduleWithColor.categoryColor.hexcode}',
                        radix: 16
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
