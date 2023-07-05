import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';
import 'package:scrollable_widget/layout/main_layout.dart';

class GridViewScreen extends StatelessWidget {
  List<int> numbers = List.generate(100, (index) => index);

  GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'GridViewScreen',
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
        ),
        itemBuilder: (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
      ),
    );
  }

  // 한번에 다 그림
  Widget renderGirdViewCount() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0, //좌우 간격
      mainAxisSpacing: 12.0, //상하 간격
      children: numbers
          .map(
            (e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length],
              index: e,
            ),
          )
          .toList(),
    );
  }

  // 보이는것만 그림
  Widget renderBuilderCrossAxisCount() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
      //최대 갯수 지정
      itemCount: 100,
    );
  }

  // 최대 사이즈 지정
  Widget renderMaxExtent() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);

    return Container(
      //height: height == null ? 300 : height,
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
