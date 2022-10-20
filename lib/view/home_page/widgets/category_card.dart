import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goatreport/view/graph_view_page/graph_view_page.dart';
import 'package:goatreport/view/tracker_page/tracker_homepage.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategoryCard extends StatelessWidget {
   CategoryCard({Key? key, required this.title, required this.categoryIcon, this.onTap}) : super(key: key);

   final String title;
   final Icon categoryIcon;
   final Function()? onTap;


  List<WeeklyChart> weeklyData =[WeeklyChart('Mon', 35),
    WeeklyChart('Tue', 28),
    WeeklyChart('Wed', 34),
    WeeklyChart('Thu', 32),
    WeeklyChart('Fri', 40),
    WeeklyChart('Sat', 35),
    WeeklyChart('Sun', 28),];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onLongPress: () {
      //   Get.to(() => GraphViewPage());
      // },
      onTap: () {
        Get.to(() => const GraphViewPage());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),

        height: Get.height * 0.3,
        // width: Get.width * 0.9,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        categoryIcon,
                        Text(title,style: TextStyle(fontWeight: FontWeight.bold),),

                      ]
                    ),
                    customButton(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.2,
                    width: Get.width * 0.85,
                    child: SfCartesianChart(
                      // title: ChartTitle(text: 'Weekly Steps'),
                        primaryXAxis:CategoryAxis(),
                        series:<ChartSeries>[
                          LineSeries<StepsData, String>(
                            dataSource:[
                              StepsData('Sun',4700),
                              StepsData('Mon', 4300),
                              StepsData('Tue', 5000),
                              StepsData('Wed', 4800),
                              StepsData('Thu', 4500),
                              StepsData('Fri', 4200),
                              StepsData('Sat', 4000),

                            ],
                            xValueMapper:(StepsData steps,_)=>steps.x,
                            yValueMapper:(StepsData steps,_)=>steps.y,
                          )
                        ]
                    ),
                  ),

                ],

              ),
              Row()
            ]

          ),
        ),
      ),
    );
  }

}

Widget customButton(){


  return GestureDetector(
    onTap: (){

    },
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade900),
        borderRadius: BorderRadius.circular(8),
      ),
        height: 30,
        width: 60,
        child:Center(
          child:Icon(Icons.add,color: Colors.blue.shade900,)
        )),
  );
}

class WeeklyChart{
  WeeklyChart(this.day,this.steps);
  final String day;
  final int steps;
}
class StepsData {
  StepsData(this.x, this.y);

  final String x;
  final double y;
}

