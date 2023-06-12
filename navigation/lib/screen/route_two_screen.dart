import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'argument : ${arguments.toString()}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/three',
              arguments: 999,
            );
          },
          child: Text('push named'),
        ),
        ElevatedButton(
          onPressed: () {
            //pushReplacement = push
            // [HomeScreen(), RouteOne(), RouteTwo(), RouteThree()]
            // -> [HomeScreen(), RouteOne(), RouteThree()] RouteThree가 RouteTwo를 대체
            /*
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              ),
            );
            */
            //pushReplacementNamed = pushNamed
            Navigator.of(context).pushReplacementNamed('/three');
          },
          child: Text('pushReplacement'),
        ),

        //pushAndRemoveUntil
        // (route) => false
        // [HomeScreen(), RouteOne(), RouteTwo(), RouteThree()]
        // [RouteThree()]

        // (route) => true
        // [HomeScreen(), RouteOne(), RouteTwo(), RouteThree()]
        // [HomeScreen(), RouteOne(), RouteTwo(), RouteThree()]

        // (route) => route.settings.name == '/'
        // [HomeScreen(), RouteThree()]
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => RouteThreeScreen()),
                (route) => route.settings.name == '/',
              );
            },
            child: Text('pushAndRemoveUntil'))
      ],
    );
  }
}
