// private 값들은 불러올 수 없음
import 'dart:ffi';
import 'dart:io';

import 'package:calendar_schedular/model/category_color.dart';
import 'package:calendar_schedular/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// private 값까지 불러올 수 있음
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
class LocalDatabase extends _$LocalDatabase{
  LocalDatabase() : super(_openConnection())
}

//db연결 
LazyDatabase _openConnection() {
  return LazyDatabase(() async{
    // 앱을 특정기기에 설치했을때 앱 전용으로 사용할 수 있는 폴더의 위치
    final dbFolder = await getApplicationDocumentsDirectory();
    // 경로에 파일 생성
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    // 파일로 db생성
    return NativeDatabase(file);
  });
}