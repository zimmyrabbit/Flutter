import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope( //시스템상 뒤로가기
      onWillPop: () async {
        // true - pop 가능
        // false - pop 불가능
        final canPop = Navigator.of(context).canPop();

        return canPop;
      },
      child: MainLayout(
        title: 'Home Screen',
        children: [
          ElevatedButton(
            onPressed: () {
              print(Navigator.of(context).canPop());
            },
            child: Text('canpop'),
          ),
          //maybePop
          // route stack에 뒤로가기 할 페이지가 없을떄 뒤로 안가짐
          // canPop() 이 true 일때만
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            child: Text('maybePop'),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteOneScreen(
                    number: 123,
                  ),
                ),
              );
              print(result);
            },
            child: Text('Push'),
          )
        ],
      ),
    );
  }
}
