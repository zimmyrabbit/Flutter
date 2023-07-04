import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';

import '../layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(
    100,
    (index) => index,
  );

  SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollView',
      body: renderPerformance(),
    );
  }

  //기본 렌더링
  Widget renderSimple() {
    return SingleChildScrollView(
      //child안의 Widget의 크기가 화면의 크기를 넘어서지 않는다면 스크롤 되지 않고, 넘어서면 스크롤
      child: Column(
        children: rainbowColors
            .map(
              (e) => renderContainer(
                color: e,
              ),
            )
            .toList(),
      ),
    );
  }

  //화면을 넘어가지 않아도 스크롤 되게 하기
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      //NeverScrollableScrollPhysics
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  //위젯이 잘리지 않게 하기
  Widget renderClip() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  //여러가지 physics 정리
  Widget renderPhysics() {
    return SingleChildScrollView(
      //NeverScrollableScrollPhysics() - 스크롤 안됨
      //AlwaysScrollableScrollPhysics() - 스크롤 됨
      //BouncingScrollPhysics() - ios 스타일
      //ClampingScrollPhysics() - android 스타일
      physics: ClampingScrollPhysics(),
      child: Column(
        children: rainbowColors
            .map(
              (e) => renderContainer(
                color: e,
              ),
            )
            .toList(),
      ),
    );
  }

  // SingleChildScrollView Performance
  Widget renderPerformance() {
    return SingleChildScrollView(
      child: Column(
        children: numbers
            .map(
              (e) => renderContainer(
            color: rainbowColors[e % rainbowColors.length],
            index: e,
          ),
        )
            .toList(),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    int? index,
  }) {
    if(index != null) {
      print(index);
    }

    return Container(
      height: 300,
      color: color,
    );
  }
}
