import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/model/status_model.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class MainAppBar extends StatelessWidget {
  final StatusModel status;
  final StatModel stat;

  const MainAppBar({
    required this.status,
    required this.stat,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
    );
    final date = DateTime.now();

    return SliverAppBar(
      backgroundColor: status.primaryColor,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              children: [
                Text(
                  '서울',
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  getTiemFromDateTime(dateTime : stat.dataTime),
                  style: ts.copyWith(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  status.imagePath,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  status.label,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  status.comment,
                  style: ts.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getTiemFromDateTime({required DateTime dateTime}) {
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} ${getTimeFormat(dateTime.hour)}:${getTimeFormat(dateTime.minute)}';
  }

  String getTimeFormat(int number) {
    return number.toString().padLeft(2,'0');
  }
}
