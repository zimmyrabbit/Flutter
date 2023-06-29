import 'package:calendar_schedular/database/drift_database.dart';
import 'package:calendar_schedular/screen/home_screen.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

const DEFAULT_COLORS = [
  //빨강
  'F44336',
  //주황
  'FF9800',
  //노랑
  'FFEB3B',
  //초록
  'FCAF50',
  //파랑
  '2196F3',
  //남색
  '3F51B5',
  //보라
  '9C27B0'
];

void main() async {
  //flutter framework가 준비가되었는지 확인하는 코드
  WidgetsFlutterBinding.ensureInitialized();

  //intl 패키지 내의 모든 언어 사용 가능
  await initializeDateFormatting();

  final database = LocalDatabase();

  final colors = await database.getCategoryColors();

  if (colors.isEmpty) {
    for (String hexCode in DEFAULT_COLORS) {
      await database.createCategoryColor(
        CategoryColorsCompanion(
          hexcode: Value(hexCode),
        ),
      );
    }
  }

  print('----------------------');
  print(await database.getCategoryColors());

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: HomeScreen(),
    ),
  );
}
