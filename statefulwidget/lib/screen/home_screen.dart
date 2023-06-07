import 'package:flutter/material.dart';

/*
 기본적인 Life Cycle
  Widget 생성
I/flutter (  645): Widget COnstructor 실행
I/flutter (  645): createState 실행
I/flutter (  645): initState 실행
I/flutter (  645): didChangeDependencies 실행
I/flutter (  645): build 실행

  State 변경
I/flutter (  645): Widget COnstructor 실행
I/flutter (  645): didUpdateWidget 실행
I/flutter (  645): build 실행

  Widget 삭제
I/flutter (  645): deactivate 실행
I/flutter (  645): dispose 실행
*/


//StatefulWidget
class HomeScreen extends StatefulWidget {
  final Color color;

  HomeScreen({
    required this.color,
    Key? key,
  }) : super(key: key){
    print('Widget COnstructor 실행');
  }

  @override
  State<StatefulWidget> createState() {
    print('createState 실행');
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  int number = 0;

  @override
  void initState() {
    print('initState 실행');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies 실행');
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print('deactivate 실행');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose 실행');
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    print('didUpdateWidget 실행');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('build 실행');

    return GestureDetector(
      onTap: () {
        print('클릭');
        setState(() {
          number++;
        });
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        color: widget.color,
        child: Center(
          child: Text(number.toString()),
        )
      ),
    );
  }
}

//StatelessWidget
class _HomeScreen extends StatelessWidget {
  final Color color;

  const _HomeScreen({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      color: color,
    );
  }
}
