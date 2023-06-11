import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 10000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    children: maxNumber.toInt()
                        .toString()
                        .split('')
                        .map(
                          (x) => Image.asset(
                            'asset/img/$x.png',
                            width: 50.0,
                            height: 70.0,
                          ),
                        )
                        .toList(),
                  ),
                ),
                Slider(
                  value: maxNumber,
                  min: 10000,
                  max: 1000000,
                  onChanged: (double val) {
                    setState(() {
                      maxNumber = val;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: RED_COLOR,
                  ),
                  child: Text('저장!'),
                ),
              ],
            ),
          ),
        ));
  }
}
