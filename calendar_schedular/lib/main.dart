import 'package:calendar_schedular/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  //flutter framework가 준비가되었는지 확인하는 코드
  WidgetsFlutterBinding.ensureInitialized();

  //intl 패키지 내의 모든 언어 사용 가능
  await initializeDateFormatting();

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: HomeScreen(),
    ),
  );
}
