import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatelessWidget {
  const ScheduleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    //입력키보드 창이 떴을때 올라온 만큼의 높이
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height/2 + bottomInset,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Column(
          children: [
            TextField(),
          ],
        ),
      ),
    );
  }
}
