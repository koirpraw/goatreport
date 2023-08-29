import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChart extends StatelessWidget {
   CircularChart({Key? key}) : super(key: key);
  final List<ChartData> chartData = [
  ChartData('David', 25),
  ChartData('Steve', 38),
  ChartData('Jack', 34),
  ChartData('Others', 52)];


  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        series: <CircularSeries>[
        // Renders radial bar chart
        RadialBarSeries<ChartData, String>(
        dataSource: chartData,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y
    )]
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}