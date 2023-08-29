import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goatreport/view/add_entry_page/add_entry_page.dart';
import 'package:goatreport/view/graph_view_page/chart_graph_data/circular_chart.dart';

import 'package:goatreport/view/graph_view_page/graph_view_page.dart';
import 'package:goatreport/view/graph_view_page/chart_graph_data/line_chart_default.dart';
import 'package:goatreport/view/home_page/widgets/category_card.dart';
import 'package:goatreport/view/temp_pages/temp_page1.dart';
import 'package:goatreport/view/tracker_page/tracker_homepage.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../graph_view_page/chart_graph_data/area_chart.dart';
import '../user_preference_page.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<_ChartData>? chartData;

  @override void initState() {
    // chartData = <_ChartData>[
    //   _ChartData(2005, 21, 28),
    //   _ChartData(2006, 24, 44),
    //   _ChartData(2007, 36, 48),
    //   _ChartData(2008, 38, 50),
    //   _ChartData(2009, 54, 66),
    //   _ChartData(2010, 57, 78),
    //   _ChartData(2011, 70, 84)
    // ];
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.125,
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          color: Colors.black,
          onPressed: () {
            Get.to(() => TrackerHomePage());
          },
        ),
        title: Container(
          child: Image.asset('assets/icons/goatReport_icon.png'),
        ),
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
          IconButton(
            onPressed: () {
              Get.to(()=>TempPage1());
            },
            icon: const Icon(
              Icons.display_settings_rounded,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.25,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        height: Get.height * 0.2,
                        width: Get.width * 0.8,
                        child: Card(
                          elevation: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Card Info $index',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text('subtitle $index'),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              CategoryCard(title: 'Factors', categoryIcon: const Icon(Icons.assistant_navigation), buttonOnTap: () {
                Get.to(()=>const TrackerHomePage());
              }, onTap: () {
                Get.to(()=>GraphViewPage(categoryPageTitle: 'Factors', categoryPageIcon: const Icon(Icons.assistant_navigation), categoryChart: LineChartDefault(),));
              }, categoryChart: LineChartDefault(),),

              CategoryCard(title: 'Symptoms', categoryIcon: const Icon(Icons.medication_liquid_outlined), buttonOnTap: () {
                Get.to(()=>TrackerHomePage());
              }, onTap: () {
                Get.to(()=>GraphViewPage(categoryPageTitle: 'Symptoms', categoryPageIcon: Icon(Icons.medication_liquid_outlined), categoryChart: LineChartDefault(),));
              }, categoryChart: LineChartDefault(),),
              CategoryCard(title: 'Steps', categoryIcon: Icon(Icons.directions_walk_rounded), buttonOnTap: () {
                Get.to(()=>AddEntryPage(title: 'Steps', cardIcon: Icons.directions_walk_rounded,));
              }, onTap: () {
                Get.to(()=>GraphViewPage(categoryPageTitle: 'Steps', categoryPageIcon: Icon(Icons.directions_walk_rounded), categoryChart: LineChartDefault(),));
              }, categoryChart: LineChartDefault(),),
              CategoryCard(title: 'Energy', categoryIcon: Icon(Icons.battery_charging_full_outlined), buttonOnTap: () {
                Get.to(()=>AddEntryPage(title: 'Energy', cardIcon: Icons.battery_charging_full_outlined,));
              }, onTap: () {
                Get.to(()=>GraphViewPage(categoryPageTitle: 'Energy', categoryPageIcon: Icon(Icons.battery_charging_full_outlined), categoryChart: CircularChart(),));
              }, categoryChart:CircularChart(),),

              CategoryCard(title: 'Exercise', categoryIcon: Icon(Icons.fitness_center_rounded), buttonOnTap: () {
                Get.to(()=>AddEntryPage(title: 'Exercise', cardIcon: Icons.fitness_center_rounded,));
              }, onTap: () {
                Get.to(()=>GraphViewPage(categoryPageTitle: 'Exercise', categoryPageIcon: Icon(Icons.fitness_center_rounded), categoryChart: LineChartDefault(),));
              }, categoryChart: LineChartDefault(),),

              CategoryCard(title: 'Sleep', categoryIcon: Icon(Icons.bedtime_outlined), buttonOnTap: () {
                Get.to(()=>AddEntryPage(title: 'Sleep', cardIcon: Icons.bedtime_outlined,));
              }, onTap: () {
                Get.to(()=>GraphViewPage(categoryPageTitle: 'Sleep', categoryPageIcon: Icon(Icons.bedtime_outlined), categoryChart:AreaChart(),));
              }, categoryChart: AreaChart(),),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("goat-report",style: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 24),),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Colors.purple.shade900,
        onPressed: () {
          Get.to(() => UserPreferencePage());
        },
        child: const Icon(Icons.add_chart,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'STEPS'),
      legend: Legend(
          isVisible:  true,
          overflowMode: LegendItemOverflowMode.wrap),
      axes: [

      ],
      primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 2,
          majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}%',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(color: Colors.transparent)),

      series: _getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<LineSeries<_ChartData, num>> _getDefaultLineSeries() {
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartData!,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2,
          name: 'Germany',
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartData!,
          width: 2,
          name: 'England',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y,this.y2);

  final double x;
  final double y;
  final double y2;
}

class StepsData {
  StepsData(this.x, this.y);

  final String x;
  final double y;
}