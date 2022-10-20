import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartDefault extends StatelessWidget {
  LineChartDefault({Key? key}) : super(key: key);

  List<WeeklyChart> weeklyData = [
    WeeklyChart('Mon', 35),
    WeeklyChart('Tue', 28),
    WeeklyChart('Wed', 34),
    WeeklyChart('Thu', 32),
    WeeklyChart('Fri', 40),
    WeeklyChart('Sat', 35),
    WeeklyChart('Sun', 28),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      // title: ChartTitle(text: 'Weekly Steps'),
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          LineSeries<StepsData, String>(
            dataSource: [
              StepsData('Sun', 4700),
              StepsData('Mon', 4300),
              StepsData('Tue', 5000),
              StepsData('Wed', 4800),
              StepsData('Thu', 4500),
              StepsData('Fri', 4200),
              StepsData('Sat', 4000),
            ],
            xValueMapper: (StepsData steps, _) => steps.x,
            yValueMapper: (StepsData steps, _) => steps.y,
          )
        ]);
  }
}


class WeeklyChart {
  WeeklyChart(this.day, this.steps);

  final String day;
  final int steps;
}

class StepsData {
  StepsData(this.x, this.y);

  final String x;
  final double y;
}