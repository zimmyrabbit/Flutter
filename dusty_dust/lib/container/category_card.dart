import 'package:dusty_dust/component/main_card.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../const/colors.dart';
import '../model/stat_and_status_model.dart';
import '../component/card_title.dart';
import '../component/main_stat.dart';

class CategoryCard extends StatelessWidget {
  final String region;
  final Color darkColor;
  final Color lightColor;

  const CategoryCard({
    required this.region,
    required this.darkColor,
    required this.lightColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: MainCard(
        backgroundColor: lightColor,
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardTitle(
                backgroundColor: darkColor,
                title: '종류별 통계',
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  children: ItemCode.values
                      .map(
                        (ItemCode itemCode) => ValueListenableBuilder<Box>(
                          valueListenable:
                              Hive.box<StatModel>(itemCode.name).listenable(),
                          builder: (context, box, widget) {
                            final stat = (box.values.toList().last as StatModel);
                            final status =
                                DataUtils.getStatusFromItemCodeAndValue(
                              value: stat.getLevelFromRegion(region),
                              itemCode: itemCode,
                            );

                            return MainStat(
                                category: DataUtils.getItemCodeKrString(
                                  itemCode: itemCode,
                                ),
                                imgPath: status.imagePath,
                                level: status.label,
                                stat: '${stat.getLevelFromRegion(
                                  region,
                                )}${DataUtils.getUnitFromDataType(
                                  itemCode: itemCode,
                                )}',
                                width: constraint.maxWidth / 3);
                          },
                        ),
                      )
                      .toList(),
                  // List.generate(
                  //   20,
                  //   (index) => MainStat(
                  //     width: constraint.maxWidth / 3,
                  //     category: '미세먼지$index',
                  //     imgPath: 'asset/img/best.png',
                  //     level: '최고',
                  //     stat: '0㎍/㎥',
                  //   ),
                  // ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
