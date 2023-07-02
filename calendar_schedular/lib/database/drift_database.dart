// import -> private 값들은 불러올 수 없음
import 'dart:ffi';
import 'dart:io';

import 'package:calendar_schedular/model/category_color.dart';
import 'package:calendar_schedular/model/schdule_with_color.dart';
import 'package:calendar_schedular/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// part -> private 값까지 불러올 수 있음
// 현재파일의 이름과 dart 사이에 .g 추가
part 'drift_database.g.dart';

//사용할 테이블을 정의
@DriftDatabase(
  tables: [
    // table을 불러올때 인스턴스로 만들지 않고 타입만 선언
    Schedules,
    CategoryColors,
  ],
)

//_$데이터베이스 이름 -> drift_database.g.dart 파일에 생성
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  //schedule insert
  // primary key값 return 받을 수 있다
  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);
  // categoryColors insert
  Future<int> createCategoryColor(CategoryColorsCompanion data) =>
      into(categoryColors).insert(data);

  // categoryColors select
  Future<List<CategoryColor>> getCategoryColors() =>
      select(categoryColors).get();

  // get -> List로 값을 Future형태로 받을 수 있음 (단발성)
  // watch -> List로 값을 Stream형태로 받을 수 있음
  //    -> 업데이트 되었을 경우 지속적으로 받을 수 있다

  //schedult select
  Stream<List<ScheduleWithColor>> watchSchedules(DateTime date) {
    final query = select(schedules).join([
      innerJoin(categoryColors, categoryColors.id.equalsExp(schedules.colorId))
    ]);
    query.where(schedules.date.equals(date));
    query.orderBy([
      //asc 오름차순
      //desc 내림차순
      OrderingTerm.asc(schedules.startTime),
    ]);
    return query.watch().map(
          (rows) => rows
              .map(
                (row) => ScheduleWithColor(
                  schedule: row.readTable(schedules),
                  categoryColor: row.readTable(categoryColors),
                ),
              )
              .toList(),
        );

    //int number = 3;
    //final resp = number.toString();
    // '3' -> String
    //final resp2 = number..toString();
    // 3 -> int

    //return (select(schedules)
    //   ..where((tbl) => tbl.date.equals(date))).watch();
  }

  //schedule delete
  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();

  @override
  //schemaVersion 1부터 시작
  // database의 구조를 변경할떄마다 version을 올려줘야한다
  int get schemaVersion => 1;
}

//db연결
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // 앱을 특정기기에 설치했을때 앱 전용으로 사용할 수 있는 폴더의 위치
    final dbFolder = await getApplicationDocumentsDirectory();
    // 경로에 파일 생성
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    // 파일로 db생성
    return NativeDatabase(file);
  });
}

//code generation을 해주는 명령어
//  terminal
//  flutter pub run build_runner build
