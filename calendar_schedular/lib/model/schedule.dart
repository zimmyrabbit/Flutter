import 'package:drift/drift.dart';

class Schedules extends Table {
  //Primary Key
  IntColumn get id => integer()();

  //내용
  TextColumn get content => text()();
  //일정 날짜
  DateTimeColumn get date => dateTime()();
  //시작 시간
  IntColumn get startTime => integer()();
  //종료 시간
  IntColumn get endTime => integer()();
  //Category Color Table id
  IntColumn get colorId => integer()();
  //생성 날짜
  DateTimeColumn get createAt => dateTime()();
}