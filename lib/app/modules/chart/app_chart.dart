import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget appChart() {
  return SizedBox(
    height: 100,
    child: SfCartesianChart(
        onMarkerRender: (markerArgs) {
          if (markerArgs.pointIndex == data.length - 1) {
            markerArgs.color = Colors.amber;
            markerArgs.borderColor = Colors.amber;
          }
        },
        primaryXAxis: CategoryAxis(isVisible: false),
        primaryYAxis: NumericAxis(
            /* minimum: 0, maximum: 40, interval: 10, */ isVisible: false),
        series: <ChartSeries<ChartData, String>>[
          LineSeries<ChartData, String>(
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              color: Colors.grey,
              markerSettings: const MarkerSettings(isVisible: true))
        ]),
  );
}

List<ChartData> data = [
  ChartData('CHN', 1),
  ChartData('GER', 2),
  ChartData('RUS', 5),
  ChartData('BRZ', 4),
  ChartData('IND', 7)
];
TooltipBehavior tooltip = TooltipBehavior(enable: true);

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
