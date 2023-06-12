import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('버튼'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // 메인 칼라
                  primary: Colors.red,
                  // 글자색과 눌렀을때 애니메이션 색
                  onPrimary: Colors.black,
                  // 그림자 색깔
                  shadowColor: Colors.green,
                  // 입체감의 높이
                  elevation: 10.0,
                  // 글자 스타일
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                  // padding
                  padding: EdgeInsets.all(32.0),
                  // 테두리
                  side: BorderSide(
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
                child: Text('ElevatedButton'),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  // 글자, 애니메이션 효과
                  primary: Colors.green,
                  // 배경색
                  backgroundColor: Colors.yellow,
                ),
                child: Text('OutlinedButton'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.brown,
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {},
                child: Text('TextButton'),
              ),
            ],
          ),
        ));
  }
}
