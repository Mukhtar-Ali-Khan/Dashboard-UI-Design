import 'package:flutter/material.dart';

import '../../Constants/Infos.dart';
import 'PieChartWidget.dart';

class PlatformCapacityGraph extends StatelessWidget {
  const PlatformCapacityGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          padding:
          const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(20),
            color: Colors.white
                .withOpacity(0.08),
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                'Platform Capacity',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(
                    color:
                    Colors.white,
                    fontWeight:
                    FontWeight
                        .bold),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const SizedBox(
                      width: 12),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Stack(
                      alignment: Alignment
                          .center,
                      children: [
                        Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                              shape: BoxShape
                                  .circle,
                              color: Colors
                                  .white
                                  .withOpacity(
                                  0.08)),
                        ),
                        const PieChartWidget(),
                      ],
                    ),
                  ),
                  const SizedBox(
                      width: 04),
                  SizedBox(
                    width: 200,
                    child:
                    ListView.builder(
                      shrinkWrap: true,
                      physics:
                      const NeverScrollableScrollPhysics(),
                      itemCount:
                      platformCapacity
                          .length,
                      itemBuilder:
                          (context,
                          index) {
                        var item =
                        platformCapacity[
                        index];
                        return ListTile(
                          leading: Icon(
                            Icons.circle,
                            color: item[
                            'iconColor'],
                            size: 18,
                          ),
                          title: Text(
                            item['title'],
                            style: Theme.of(
                                context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                color:
                                Colors.white),
                          ),
                          subtitle: Text(
                            item[
                            'capacity'],
                            style: Theme.of(
                                context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                color:
                                Colors.white54),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
