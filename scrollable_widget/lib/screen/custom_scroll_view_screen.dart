import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('CustomScrollViewScreen'),
          centerTitle: true,
        ),
        renderBuilderSliverList(),
      ],
    ));
  }

  // ListView.builder 생성자와 유사함
  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 100,
      ),
    );
  }

  //ListView 기본 생성자와 유사함
  SliverList renderChildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
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
