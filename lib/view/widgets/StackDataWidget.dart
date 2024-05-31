import 'package:flutter/material.dart';

import '../../Constants/Infos.dart';
import 'DashboardStackTile.dart';

class StackDataWidget extends StatelessWidget {
  final int axisCount;
  final bool isMobile;
  const StackDataWidget({Key? key, this.axisCount = 4, this.isMobile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: stackData.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(left: 20, right: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: axisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 200 / 100,
        ),
        itemBuilder: (context, index) {
          var item = stackData[index];
          return DashboardStacksTile(
            item: item,
            isMobile: isMobile,
          );
        });
  }
}
