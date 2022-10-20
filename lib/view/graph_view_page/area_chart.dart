import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class AreaChart extends StatefulWidget {
  const AreaChart({Key? key}) : super(key: key);

  @override
  State<AreaChart> createState() => _AreaChartState();
}

class _AreaChartState extends State<AreaChart> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      series: <ChartSeries<_ChartData, num>>[
        AreaSeries<_ChartData, num>(
          dataSource: <_ChartData>[
            _ChartData(2005, 21, 28),
            _ChartData(2006, 24, 44),
            _ChartData(2007, 36, 48),
            _ChartData(2008, 38, 50),
            _ChartData(2009, 54, 66),
            _ChartData(2010, 57, 78),
            _ChartData(2011, 70, 84)
          ],
          xValueMapper: (_ChartData sales, _) => sales.year,
          yValueMapper: (_ChartData sales, _) => sales.sales,
          name: 'Sales',
        ),
        AreaSeries<_ChartData, num>(
          dataSource: <_ChartData>[
            _ChartData(2005, 21, 28),
            _ChartData(2006, 24, 44),
            _ChartData(2007, 36, 48),
            _ChartData(2008, 38, 50),
            _ChartData(2009, 54, 66),
            _ChartData(2010, 57, 78),
            _ChartData(2011, 70, 84)
          ],
          xValueMapper: (_ChartData sales, _) => sales.year,
          yValueMapper: (_ChartData sales, _) => sales.expenses,
          name: 'Expenses',
        ),
      ],
    );
  }

}
class _ChartData {
  _ChartData(this.year, this.sales, this.expenses);
  final double year;
  final double sales;
  final double expenses;
}
