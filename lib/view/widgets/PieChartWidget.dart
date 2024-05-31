import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../Constants/ColorThemes.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: PieChart(
        PieChartData(
            sections: showSections(),
            sectionsSpace: 0,
            centerSpaceRadius: 30,
            borderData: FlBorderData(show: false),
            pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event,
                    PieTouchResponse? pieTouchResponse) {})),
      ),
    );
  }

  List<PieChartSectionData> showSections() {
    return List.generate(3, (index) {
      switch (index) {
        case 0:
          return PieChartSectionData(
              value: 40,
              color: blue,
              title: "",
              radius: 50,
              badgeWidget: const Badge(
                text: "40%",
                color: blue,
              ),
              badgePositionPercentageOffset: 1.4);
        case 1:
          return PieChartSectionData(
              value: 35,
              color: olive,
              title: "",
              radius: 50,
              badgeWidget: const Badge(
                text: "35%",
                color: olive,
              ),
              badgePositionPercentageOffset: 1.4);
        case 2:
          return PieChartSectionData(
              value: 25,
              color: yellowColor,
              title: "",
              radius: 50,
              badgeWidget: const Badge(
                text: "25%",
                color: yellowColor,
              ),
              badgePositionPercentageOffset: 1.4);
        default:
          throw Error();
      }
    });
  }
}

class Badge extends StatelessWidget {
  final String text;
  final Color color;
  const Badge({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      width: 35,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
