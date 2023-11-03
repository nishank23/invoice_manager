import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget appChart() {
  return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
      series: <ChartSeries<ChartData, String>>[
        ColumnSeries<ChartData, String>(
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: 'Gold',
            color: const Color.fromRGBO(8, 142, 255, 1))
      ]);
}

List<ChartData> data = [
  ChartData('CHN', 12),
  ChartData('GER', 15),
  ChartData('RUS', 30),
  ChartData('BRZ', 6.4),
  ChartData('IND', 14)
];
TooltipBehavior tooltip = TooltipBehavior(enable: true);

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
