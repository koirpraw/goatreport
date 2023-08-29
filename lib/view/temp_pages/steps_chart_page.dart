import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';



class StepsDataPage extends StatefulWidget {
  const StepsDataPage({Key? key}) : super(key: key);

  @override
  State<StepsDataPage> createState() => StepsDataPageState();
}

class StepsDataPageState extends State<StepsDataPage> {

  TrackballBehavior? _trackballBehavior;
  List<_SampleData>? chartData;


  Future<String> _loadSalesDataAsset() async {
    return rootBundle.loadString('assets/raw/steps_data_page.json');
  }

  Future loadSalesData() async {
    final String jsonString = await _loadSalesDataAsset();
    final dynamic jsonResponse = json.decode(jsonString);
    setState(() {
      for (final Map<dynamic, dynamic> i in jsonResponse) {
        chartData!.add(_SampleData.fromJson(i));
      }
    });
  }

  @override
  void initState(){
    super.initState();
    chartData = <_SampleData>[];
    loadSalesData();
    _trackballBehavior = TrackballBehavior(
        enable: true,
        lineColor: Get.theme.brightness == Brightness.dark
            ? const Color.fromRGBO(255, 255, 255, 0.03)
            : const Color.fromRGBO(0, 0, 0, 0.03),
        lineWidth: 15,
        activationMode: ActivationMode.singleTap,
        tooltipSettings: InteractiveTooltip(
            enable: true,
            color: Get.theme.brightness == Brightness.dark
                ? const Color.fromRGBO(255, 255, 255, 0.03)
                : const Color.fromRGBO(0, 0, 0, 0.03)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.125,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("Json Data Source",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(child: SizedBox(
          height: Get.height * 0.75,
          width: Get.width * 0.95,
          child: Card(
              elevation: 5,
              child: _buildDefaultLineChart()))),
    );

  }
  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
        key: GlobalKey(),
        plotAreaBorderWidth: 0,
        title: ChartTitle(text:  'Sales comparison'),
        legend: Legend(
            isVisible:  true,
            overflowMode: LegendItemOverflowMode.wrap),
        primaryXAxis: DateTimeAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            intervalType: DateTimeIntervalType.days,
            dateFormat: DateFormat.d(),
            name: 'days',
            majorGridLines: const MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
            rangePadding: ChartRangePadding.none,
            name: 'Steps',
            minimum: 70,
            maximum: 110,
            interval: 10,
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(color: Colors.transparent)),
        series: _getDefaultLineSeries(),
        trackballBehavior: _trackballBehavior);
  }

  List<LineSeries<_SampleData, DateTime>> _getDefaultLineSeries() {
    return <LineSeries<_SampleData, DateTime>>[
      LineSeries<_SampleData, DateTime>(
        dataSource: chartData!,
        xValueMapper: (_SampleData sales, _) => sales.x,
        yValueMapper: (_SampleData sales, _) => sales.y1,
        name: 'Product A',
      ),
      LineSeries<_SampleData, DateTime>(
        dataSource: chartData!,
        name: 'Product B',
        xValueMapper: (_SampleData sales, _) => sales.x,
        yValueMapper: (_SampleData sales, _) => sales.y2,
      )
    ];
  }

  @override
  void Dispose(){
    super.dispose();
  }

}

class _SampleData {
  _SampleData(this.x, this.y1, this.y2);
  factory _SampleData.fromJson(Map<dynamic, dynamic> parsedJson) {
    return _SampleData(
      DateTime.parse(parsedJson['x']),
      parsedJson['y1'],
      parsedJson['y2'],
    );
  }
  DateTime x;
  num y1;
  num y2;
}

class WeeklyStepsData{
  WeeklyStepsData(this.day, this.steps);
  final String day;
  final int steps;
}
