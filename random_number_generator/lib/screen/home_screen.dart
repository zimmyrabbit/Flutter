import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
          child: Padding(
            //EdgeInsets.zero - 패딩 적용 x
            //EdgeInsets.all(16.0) - 모든 부분에 padding 적용
            //EdgeInsets.fromLTRB(16,8,4,2) - 왼,위,오,아래 순서로 각각 padding 부여
            //EdgeInsets.only(top:16.0,bottom:16.0,left:16.0,right:16.0) - named parameter로 위치를 지정해 padding 부여
            //EdgeInsets.symmetric(horizontal:8.0 , vertical: 16.0,) - 상하, 좌우 대칭별로 padding 부여
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '랜덤숫자 생성기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        color: RED_COLOR,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        123,
                        456,
                        789,
                      ]
                      .asMap()
                      .entries
                          .map(
                            (x) => Padding(
                              padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 16.0),
                              child: Row(
                                children: x.value
                                    .toString()
                                    .split('')
                                    .map(
                                      (y) => Image.asset(
                                        'asset/img/$y.png',
                                        height: 70.0,
                                        width: 50.0,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          )
                          .toList()),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: RED_COLOR,
                    ),
                    onPressed: () {},
                    child: Text('생성하기!'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
