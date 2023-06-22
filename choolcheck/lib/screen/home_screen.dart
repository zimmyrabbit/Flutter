import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // latitude - 위도 , longitude - 경도
  static final LatLng companyLayLng = LatLng(
    37.567795,
    126.982272,
  );

  // zoom - 확대한 정도
  static final CameraPosition initialPosition = CameraPosition(
    target: companyLayLng,
    zoom: 17,
  );

  static final double distance = 100;

  static final Circle withinDistanceCircle = Circle(
    circleId: CircleId('withinDistanceCircle'),
    center: companyLayLng,
    fillColor: Colors.blue.withOpacity(0.5),
    radius: distance,
    strokeColor: Colors.blue,
    strokeWidth: 1,
  );

  static final Circle notWithinDistanceCircle = Circle(
    circleId: CircleId('notWithinDistanceCircle'),
    center: companyLayLng,
    fillColor: Colors.red.withOpacity(0.5),
    radius: distance,
    strokeColor: Colors.red,
    strokeWidth: 1,
  );

  static final Circle checkDoneCircle = Circle(
    circleId: CircleId('checkDoneCircle'),
    center: companyLayLng,
    fillColor: Colors.green.withOpacity(0.5),
    radius: distance,
    strokeColor: Colors.green,
    strokeWidth: 1,
  );

  static final Marker marker = Marker(
    markerId: MarkerId('marker'),
    position: companyLayLng,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppbar(),
      body: FutureBuilder(
        //Future<T> 를 return 해주는 함수만 사용 가능
        future: checkPermission(),
        //future에 사용한 함수의 return 값을 AsyncSnapshot에서 받아볼 수 있음
        //future 함수의 상태가 변경될 경우 build 재실행
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.connectionState);
          print(snapshot.data);

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == '위치 권한이 허가 되었습니다.') {
            return Column(
              children: [
                _CustomGoogleMap(
                  initialPosition: initialPosition,
                  circle: withinDistanceCircle,
                  marker: marker,
                ),
                _ChoolCheckButton(),
              ],
            );
          }

          return Center(
            child: Text(
              snapshot.data,
            ),
          );
        },
      ),
    );
  }

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    //위치서비스 권한 꺼져있으면 isLocationEnabled = false
    if (!isLocationEnabled) {
      return '위치 서비스를 활성화 해주세요.';
    }

    //앱이 가지고있는 위치 서비스의 권한
    LocationPermission checkedPermission = await Geolocator.checkPermission();

    if (checkedPermission == LocationPermission.denied) {
      //위치서비스 권한 요청
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해 주세요.';
      }
    }

    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 세팅에서 허가해 주세요.';
    }

    return '위치 권한이 허가 되었습니다.';
  }

  AppBar renderAppbar() {
    return AppBar(
      title: Text(
        '출근 앱',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}

class _CustomGoogleMap extends StatelessWidget {
  final CameraPosition initialPosition;
  final Circle circle;
  final Marker marker;

  const _CustomGoogleMap({
    required this.initialPosition,
    required this.circle,
    required this.marker,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
        //MapType
        // hybrid - 위성지도
        // normal - 일반 지도
        // satellite - 위성지도
        mapType: MapType.normal,
        initialCameraPosition: initialPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        circles: Set.from([circle]),
        markers: Set.from([marker]),
      ),
    );
  }
}

class _ChoolCheckButton extends StatelessWidget {
  const _ChoolCheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text('출근'),
    );
  }
}
