import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';

class RouteOneScreen extends StatelessWidget {
  const RouteOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'route one',
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('pop'),
        ),
      ],
    );
  }
}
