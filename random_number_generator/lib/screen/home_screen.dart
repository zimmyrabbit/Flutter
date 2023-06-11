import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_row.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 1000;
  List<int> randomNumbers = [
    123,
    456,
    789,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
          child: Padding(
            //EdgeInsets.zero - 패딩 적용 x
            //EdgeInsets.all(16.0) - 모든 부분에 padding 적용
            //EdgeInsets.fromLTRB(16,8,4,2) - 왼,위,오,아래 순서로 각각 padding 부여
            //EdgeInsets.only(top:16.0,bottom:16.0,left:16.0,right:16.0) - named parameter로 위치를 지정해 padding 부여
            //EdgeInsets.symmetric(horizontal:8.0 , vertical: 16.0,) - 상하, 좌우 대칭별로 padding 부여
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(onPressed: onSettingsPop),
                _Body(
                  randomNumbers: randomNumbers,
                ),
                _Footer(onPressed: onRandomNumberGenerate),
              ],
            ),
          ),
        ));
  }

  void onRandomNumberGenerate() {
    final rand = Random();
    final Set<int> newNumbers = {};

    while (newNumbers.length != 3) {
      final number = rand.nextInt(maxNumber);
      newNumbers.add(number);
    }
    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }

  void onSettingsPop() async {
      // push ≒ List.add
      // Router Stack
      // [HomeScreen(), SettingsScreen()]
      final int? result = await Navigator.of(context).push<int>(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return SettingsScreen(maxNumber: maxNumber);
          },
        ),
      );
      if(result != null) {
        setState(() {
          maxNumber = result;
        });
      }
    }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;
  const _Header({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.settings,
            color: RED_COLOR,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;
  const _Body({
    required this.randomNumbers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: randomNumbers
              .asMap()
              .entries
              .map(
                (x) => Padding(
                  padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 16.0),
                  child: NumberRow(number: x.value)
                ),
              )
              .toList()),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: RED_COLOR,
        ),
        onPressed: onPressed,
        child: Text('생성하기!'),
      ),
    );
  }
}
