import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          //snapshot 데이터가 바뀔때 마다
          //builder 함수가 재실행 됨
          // setState 를 하지 않고도 변화 감지
          future: getNumber(),
          builder: (context, snapshot) {
            if(!snapshot.hasData) { //데이터가 있을때 위젯 렌더링
              //return Center(
                 //child: CircularProgressIndicator(),
              //);
            }

            if(snapshot.hasError) {//에러가 났을때 위젯 렌더링

            }

            //로딩중일때 위젯 렌더링

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'FutureBuilder',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'ConState : ${snapshot.connectionState}',
                  style: textStyle,
                ),
                Row(
                  children: [
                    Text(
                      'Data : ${snapshot.data}',
                      style: textStyle,
                    ),
                    if(snapshot.connectionState == ConnectionState.waiting)
                      CircularProgressIndicator(),
                  ],
                ),
                Text(
                  'Error : ${snapshot.error}',
                  style: textStyle,
                ),
                ElevatedButton(onPressed: () {
                  setState(() {});
                }, child: Text('set state'))
              ],
            );
          },
        ),
      ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 3));

    final random = Random();

    //throw Exception('에러가 발생했습니다');

    return random.nextInt(100);
  }
}
