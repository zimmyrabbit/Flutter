import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_row.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;

  const SettingsScreen({
    required this.maxNumber,
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    maxNumber = widget.maxNumber.toDouble();
    super.initState();
  }

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
                _Body(
                  maxNumber: maxNumber,
                ),
                _Footer(
                  maxNumber: maxNumber,
                  onChanged: onChanged,
                  onPressed: onPressed,
                )
              ],
            ),
          ),
        ));
  }

  void onChanged(double val) {
    setState(() {
      maxNumber = val;
    });
  }

  void onPressed() {
    //뒤로가기
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;

  const _Body({
    required this.maxNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(number: maxNumber.toInt())
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double>? onChanged;
  final VoidCallback onPressed;
  const _Footer({
    required this.maxNumber,
    required this.onChanged,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(value: maxNumber, min: 1000, max: 100000, onChanged: onChanged),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: RED_COLOR,
          ),
          child: Text('저장!'),
        ),
      ],
    );
  }
}
