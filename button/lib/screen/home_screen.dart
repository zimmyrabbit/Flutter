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
                style: ButtonStyle(
                  //Material tate
                  //
                  // hovered - 호버링 상태 (마우스 커서를 올려놓은 상태)
                  // focused - 포커스 됐을때 (텍스트 필드)
                  // pressed - 눌렸을때 (o)
                  // dragged - 드래그 됐을때
                  // selected - 선택됐을때 (체크박스, 라디오박스)
                  // scrollUnder - 다른 컴포넌트 밑으로 스크롤링이 됐을때
                  // disabled - 비활성화 됐을때 -> onPressed 함수에 null을 return할 시 비활성화 상태 (o)
                  // erroe - 에러상태
                  backgroundColor: MaterialStateProperty.all(
                    Colors.black,
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                        if(states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        } else {
                          return Colors.red;
                        }
                      }
                  ),
                  padding: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                    if(states.contains((MaterialState.pressed))) {
                      return EdgeInsets.all(100.0);
                    }
                    return EdgeInsets.all(20.0);
                  })
                ),
                child: Text('Button Style'),
              ),
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
