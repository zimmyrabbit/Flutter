import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  final int number;
  const NumberRow({
    required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
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
    );
  }
}
