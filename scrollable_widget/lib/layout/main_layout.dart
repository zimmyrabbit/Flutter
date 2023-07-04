import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final Widget body;

  const MainLayout({
    required this.title,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: body,
    );
  }
}
