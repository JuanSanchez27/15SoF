import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fsof/resources/styles.dart';
import 'package:fsof/widgets/bars/sof_app_bar.dart';
import 'package:phone_number/phone_number.dart';

const regions = [
  RegionInfo(name: 'Canada', code: 'CA', prefix: 1),
  RegionInfo(name: 'Israel', code: 'IL', prefix: 972),
  RegionInfo(name: 'Moldova', code: 'MD', prefix: 373),
  RegionInfo(name: 'Netherlands', code: 'NL', prefix: 31),
  RegionInfo(name: 'Russia', code: 'RU', prefix: 7),
  RegionInfo(name: 'Spain', code: 'ES', prefix: 34),
  RegionInfo(name: 'Ukraine', code: 'UA', prefix: 380),
  RegionInfo(name: 'United Kingdom', code: 'GB', prefix: 44),
  RegionInfo(name: 'United States', code: 'US', prefix: 1),
];

class RegionSelector extends StatelessWidget {
  const RegionSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SofAppBar.withTitleAndBack(title: ''),
      body: ListView(
        children: regions
            .map((r) => InkWell(
                  onTap: () => Navigator.of(context).pop(r),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(child: Text(r.name, style: Styles.p1)),
                        Text('${r.prefix}', style: Styles.p1),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
