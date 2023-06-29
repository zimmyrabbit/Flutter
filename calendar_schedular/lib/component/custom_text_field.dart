import 'package:calendar_schedular/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  //true - 시간, false - 내용
  final bool isTime;

  const CustomTextField({
    required this.label,
    required this.isTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        if(isTime) renderTextField(),
        if(!isTime)
          Expanded(child: renderTextField()),
      ],
    );
  }

  Widget renderTextField() {
    return TextField(
      cursorColor: Colors.grey,
      //최대 입력 라인 지정 null일경우 칸이 다차면 자동 개행
      maxLines: isTime ? 1 : null,
      //전체 부모의 넓이만큼 넓히는 기능
      expands: isTime ? false : true,
      //TextField에 입력할때 키보드 기본 입력 값 설정
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      //숫자만 입력 가능 하도록
      inputFormatters: isTime ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
        //입력창 클릭 시 생기는 밑줄 제거
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
    );
  }
}