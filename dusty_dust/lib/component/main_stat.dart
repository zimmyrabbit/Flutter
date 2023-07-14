import 'package:flutter/material.dart';

class MainStat extends StatelessWidget {
  final String category; //미세먼지/초미세먼지 등
  final String imgPath; //아이콘 위치(경로)
  final String level; //오염 정도
  final String stat; //오염 수치

  const MainStat({
    required this.category,
    required this.imgPath,
    required this.level,
    required this.stat,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.black,
    );

    return Column(
      children: [
        Text(
          category,
          style: ts,
        ),
        const SizedBox(height: 8.0),
        Image.asset(
          imgPath,
          width: 50.0,
        ),
        const SizedBox(height: 8.0),
        Text(
          level,
          style: ts,
        ),
        Text(
          stat,
          style: ts,
        ),
      ],
    );
  }
}
