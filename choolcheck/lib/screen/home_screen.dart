import 'package:flutter/material.dart';
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
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppbar(),
      body: Column(
        children: [
          _CustomGoogleMap(
            initialPosition: initialPosition,
          ),
          _ChoolCheckButton(),
        ],
      ),
    );
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

  const _CustomGoogleMap({required this.initialPosition, super.key});

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
