import 'package:flutter/material.dart';
import 'package:web_view/screen/home_screen.dart';

void main() {
  // Flutter Framework가 App을 실행할 준비가 될때까지 기다린다.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: HomeScreen(),
    )
  );
}
