enum ItemCode {
  //미세먼지
  PM10,
  //초미세먼지
  PM25,
  //이산화질소
  NO2,
  //오존
  O3,
  //일산화탄소
  CO,
  //이황산가스
  SO2,
}

class StatModel {
  final double daegu;
  final double chungnam;
  final double incheon;
  final double daejeon;
  final double gyeongbuk;
  final double sejong;
  final double gwangju;
  final double jeonbuk;
  final double gangwon;
  final double ulsan;
  final double jeonnam;
  final double seoul;
  final double busan;
  final double jeju;
  final double chungbuk;
  final double gyeongnam;
  final DateTime dataTime;
  final ItemCode itemCode;
  final double gyeonggi;

  //Json형태에서 부터 데이터를 받아온다.
  StatModel.fromJson({required Map<String, dynamic> json})
      : daegu = double.parse(json['daegu']),
        chungnam = double.parse(json['chungnam']),
        incheon = double.parse(json['incheon']),
        daejeon = double.parse(json['daejeon']),
        gyeongbuk = double.parse(json['gyeongbuk']),
        sejong = double.parse(json['sejong']),
        gwangju = double.parse(json['gwangju']),
        jeonbuk = double.parse(json['jeonbuk']),
        gangwon = double.parse(json['gangwon']),
        ulsan = double.parse(json['ulsan']),
        jeonnam = double.parse(json['jeonnam']),
        seoul = double.parse(json['seoul']),
        busan = double.parse(json['busan']),
        jeju = double.parse(json['jeju']),
        chungbuk = double.parse(json['chungbuk']),
        gyeongnam = double.parse(json['gyeongnam']),
        dataTime = DateTime.parse(json['dataTime']),
        itemCode = parseItemCode(json['itemCode']),
        gyeonggi = double.parse(json['gyeonggi']);

  static ItemCode parseItemCode(String raw) {
    if (raw == 'PM2.5') {
      return ItemCode.PM25;
    }

    return ItemCode.values.firstWhere((element) => element.name == raw);
  }
}
