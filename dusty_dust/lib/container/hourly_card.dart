import 'package:dusty_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/stat_model.dart';
import '../component/card_title.dart';
import '../component/main_card.dart';

class HourlyCard extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  final String region;
  final ItemCode itemCode;

  const HourlyCard({
    required this.darkColor,
    required this.lightColor,
    required this.region,
    required this.itemCode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainCard(
      backgroundColor: lightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardTitle(
            title: '시간별 ${DataUtils.getItemCodeKrString(itemCode: itemCode)}',
            backgroundColor: darkColor,
          ),
          ValueListenableBuilder<Box>(
            valueListenable: Hive.box<StatModel>(itemCode.name).listenable(),
            builder: (context, box, widget) => Column(
              children: box.values
                  .map(
                    (e) => renderRow(stat: e),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderRow({required StatModel stat}) {
    final status = DataUtils.getStatusFromItemCodeAndValue(
        value: stat.getLevelFromRegion(region), itemCode: stat.itemCode);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text('${stat.dataTime.hour}시'),
          ),
          Expanded(
            child: Image.asset(
              status.imagePath,
              height: 18.0,
            ),
          ),
          Expanded(
            child: Text(
              status.label,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
