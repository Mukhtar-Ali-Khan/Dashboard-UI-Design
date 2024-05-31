import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/ColorThemes.dart';
import '../../utils/Utils.dart';

class OverViewGraphWidget extends StatefulWidget {
  final bool isMobile;
  const OverViewGraphWidget({Key? key, this.isMobile = false})
      : super(key: key);

  @override
  State<OverViewGraphWidget> createState() => _OverViewGraphWidgetState();
}

class _OverViewGraphWidgetState extends State<OverViewGraphWidget> {
  String selectedCategory = 'income';
  Color chartColor = teal;
  List incomeData = [
    0.5,
    0.5,
    0.55,
    0.5,
    0.57,
    0.49,
    0.6,
    0.5,
    0.7,
    0.6,
    0.5,
    0.56
  ];
  List jobsData = [0.3, 0.7, 0.6, 0.2, 0.8, 0.5, 0.3, 0.6, 0.7, 0.8, 0.5, 0.9];
  List prodData = [0.2, 0.3, 0.6, 0.5, 0.7, 0.9, 0.4, 0.6, 0.1, 0.6, 0.4, 0.7];
  List taskData = [0.0, 0.3, 0.1, 0.5, 0.9, 0.2, 0.4, 0.6, 0.5, 0.8, 0.5, 0.6];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 2,
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.08),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isMobile)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  'Overview',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: whiteColor, fontSize: 22),
                ),
              ),
            FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                width: size.width,
                height: widget.isMobile ? 60 : 40,
                child: widget.isMobile
                    ? Wrap(
                        spacing: 14,
                        runSpacing: 20,
                        alignment: WrapAlignment.end,
                        children: [
                          buildSwitchButton(
                              context: context,
                              title: 'Income',
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value ? "income" : "";
                                  chartColor = teal;
                                });
                              },
                              buttonColor: teal,
                              value: selectedCategory == "income"),
                          buildSwitchButton(
                              context: context,
                              title: 'New Jobs',
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value ? 'jobs' : '';
                                  chartColor = blue;
                                });
                              },
                              buttonColor: blue,
                              value: selectedCategory == 'jobs'),
                          buildSwitchButton(
                              context: context,
                              title: 'New Products',
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value ? 'pro' : '';
                                  chartColor = olive;
                                });
                              },
                              buttonColor: olive,
                              value: selectedCategory == 'pro'),
                          buildSwitchButton(
                              context: context,
                              title: 'New Tasks',
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value ? 'tas' : '';
                                  chartColor = yellowColor;
                                });
                              },
                              buttonColor: yellowColor,
                              value: selectedCategory == 'tas'),
                        ],
                      )
                    : Row(
                        children: [
                          if (!widget.isMobile)
                            Text(
                              'Overview',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: whiteColor, fontSize: 22),
                            ),
                          const Spacer(),
                          buildSwitchButton(
                              context: context,
                              title: 'Income',
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value ? "income" : "";
                                  chartColor = teal;
                                });
                              },
                              buttonColor: teal,
                              value: selectedCategory == "income"),
                          buildSwitchButton(
                              context: context,
                              title: 'New Jobs',
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value ? 'jobs' : '';
                                  chartColor = blue;
                                });
                              },
                              buttonColor: blue,
                              value: selectedCategory == 'jobs'),
                          buildSwitchButton(
                              context: context,
                              title: 'New Products',
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value ? 'pro' : '';
                                  chartColor = olive;
                                });
                              },
                              buttonColor: olive,
                              value: selectedCategory == 'pro'),
                          buildSwitchButton(
                              context: context,
                              title: 'New Tasks',
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value ? 'tas' : '';
                                  chartColor = yellowColor;
                                });
                              },
                              buttonColor: yellowColor,
                              value: selectedCategory == 'tas'),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 350,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        if (selectedCategory == 'income')
                          for (int i = 0; i < incomeData.length; i++)
                            FlSpot(i.toDouble(), incomeData[i]),
                        if (selectedCategory == 'tas')
                          for (int i = 0; i < taskData.length; i++)
                            FlSpot(i.toDouble(), taskData[i]),
                        if (selectedCategory == 'jobs')
                          for (int i = 0; i < jobsData.length; i++)
                            FlSpot(i.toDouble(), jobsData[i]),
                        if (selectedCategory == 'pro')
                          for (int i = 0; i < prodData.length; i++)
                            FlSpot(i.toDouble(), prodData[i]),
                      ],
                      isCurved: true,
                      isStrokeCapRound: true,
                      barWidth: 4,
                      color: chartColor,
                      belowBarData: BarAreaData(
                          show: true, color: chartColor.withOpacity(0.4)),
                    ),
                  ],
                  titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, titleMeta) {
                              return Utils()
                                  .getChatBottomTiles(value.toInt(), context);
                            }),
                      ),
                      rightTitles: AxisTitles(),
                      topTitles: AxisTitles(),
                      leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, titleMeta) {
                                return Text(
                                  '$value',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: whiteColor),
                                );
                              },
                              interval: 1))),
                ),
                swapAnimationDuration: const Duration(seconds: 1),
                swapAnimationCurve: Curves.easeInOut,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildSwitchButton(
      {required BuildContext context,
      required String title,
      required Function(bool)? onChanged,
      required Color buttonColor,
      required bool value}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: whiteColor, fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0, right: 4),
          child: SizedBox(
            height: 18,
            child: CupertinoSwitch(
                thumbColor: value ? Colors.black : buttonColor,
                value: value,
                activeColor: buttonColor,
                onChanged: onChanged),
          ),
        ),
      ],
    );
  }
}
