import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const constructor로 위젯을 인스턴스화 할 시
            // 다음 빌드 실행 시 처음 그려놓은 위젯을 그대로 사용
            // build함수 재실행 x
            const TestWidget(label: 'test1'),
            TestWidget(label: 'test2'),
            ElevatedButton(
              onPressed: () {
                setState(() {

                });
              },
              child: const Text('빌드!'),
            ),
          ],
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  final String label;

  const TestWidget({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$label 빌드');
    return Container(
      child: Text(
        label,
      ),
    );
  }
}
