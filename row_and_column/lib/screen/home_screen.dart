import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
            color: Colors.black,
            //MediaQuery.of(context)
            // device의 size를 가져올 수 있음
            //width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
            child: Column(
              //MainAxisAlignment - 주축 정렬
              // start - 시작
              // end - 끝
              // center - 가운데
              // spaceBetween - 위젯과 위젯의 간격이 동일하게 배치
              // spaceEvenly - 위젯을 같은 간격으로 배치 하지만, 끝과 끝에도
              //               위젯이 아는 빈 간격으로 시작.
              // spaceAround - spaceEvenly + 끝과 끝의 간격 1/2
              mainAxisAlignment: MainAxisAlignment.start,
              //CrossAxisAlignment - 반대축 정렬
              // start - 시작
              // end - 끝
              // center - 가운데 (default)
              // stretch - 최대한으로 늘린다
              crossAxisAlignment: CrossAxisAlignment.start,
              //MainAxisSize - 주축 크기
              // max - 최대
              // min - 최소
              mainAxisSize: MainAxisSize.max,
              children: [
                // Expanded / Flexible
                // row/column 위젯의 children 에서만 사용!!
                Flexible(
                  child: Container(
                    color: Colors.red,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.orange,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
