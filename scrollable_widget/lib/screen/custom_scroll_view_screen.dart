import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';

class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  //최대 높이
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  // covariant - 상속된 클래스도 사용가능
  // oldDelegate - build가 실행되기 이전의 Delegate
  // this - 새로운 delegate
  // shouldRebuild - 새로 build를 해야할지 말지 결정
  //  false - 빌드 안함, true - 빌드 다시함
  //bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != this.minHeight ||
        oldDelegate.maxHeight != this.maxHeight ||
        oldDelegate.child != this.child;
  }
}

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        renderSliverAppBar(),
        renderSliverPersistentHeader(),
        renderBuilderSliverList(),
        renderSliverPersistentHeader(),
        renderSliverGridBuilder(),
        renderBuilderSliverList(),
      ],
    ));
  }

  SliverPersistentHeader renderSliverPersistentHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverFixedHeaderDelegate(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Text(
              'ㅇㅇㅇ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        maxHeight: 150,
        minHeight: 75,
      ),
    );
  }

  //AppBar
  SliverAppBar renderSliverAppBar() {
    return SliverAppBar(
      //스크롤 했을떄 리스트의 중간에도 AppBar가 내려오게 할 수 있음
      floating: true,
      //AppBar 완전 고정
      pinned: false,
      // 자석 효과 (floating - true 일떄마 사용 가능)
      snap: true,
      // 맨위에서 한계 이상으로 스크롤 했을떄 남는공간 차지
      stretch: true,
      expandedHeight: 200,
      collapsedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'asset/img/test.jpg',
          fit: BoxFit.cover,
        ),
        title: Text('FlexibleSpace'),
      ),
      title: Text('CustomScrollViewScreen'),
      centerTitle: true,
    );
  }

  //GridView.builder와 유사
  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 100,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
      ),
    );
  }

  //GridView.count 와 유사감
  SliverGrid renderChildSliverGrind() {
    return SliverGrid(
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
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
