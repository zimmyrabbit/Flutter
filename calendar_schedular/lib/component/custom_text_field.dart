import 'package:calendar_schedular/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String label;

  const CustomTextField({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
         style: TextStyle(
           color: PRIMARY_COLOR,
           fontWeight: FontWeight.w600,
         ),),
        TextField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            //입력창 클릭 시 생기는 밑줄 제거
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
