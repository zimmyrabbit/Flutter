import 'package:dusty_dust/component/main_app_bar.dart';
import 'package:dusty_dust/const/colors.dart';
import 'package:flutter/material.dart';

import '../component/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
        ],
      ),
    );
  }
}
