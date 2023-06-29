import 'package:drift/drift.dart';

class Schedules extends Table {
  //Primary Key
  //  autoIncrement -> 자동으로 숫자 1씩 증가 (sequence)
  IntColumn get id => integer().autoIncrement()();

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
  //  clientDefault -> 기본값 지정
  DateTimeColumn get createAt => dateTime().clientDefault(
        () => DateTime.now(),
      )();
}
