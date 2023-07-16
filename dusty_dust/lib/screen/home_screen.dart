import 'package:dusty_dust/component/card_title.dart';
import 'package:dusty_dust/component/category_card.dart';
import 'package:dusty_dust/component/main_app_bar.dart';
import 'package:dusty_dust/component/main_card.dart';
import 'package:dusty_dust/component/main_stat.dart';
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
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CategoryCard(),
                const SizedBox(height: 16.0),
                MainCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CardTitle(
                        title: '시간별 미세먼지',
                      ),
                      Column(
                        children: List.generate(24, (index) {
                          final now = DateTime.now();
                          final hour = now.hour;
                          int currentHour = hour - index;

                          if (currentHour < 0) {
                            currentHour += 24;
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text('$currentHour시'),
                                ),
                                Expanded(
                                  child: Image.asset(
                                    'asset/img/good.png',
                                    height: 18.0,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '좋음',
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
