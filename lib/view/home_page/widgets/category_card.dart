import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goatreport/view/graph_view_page/graph_view_page.dart';
import 'package:goatreport/view/tracker_page/tracker_homepage.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../graph_view_page/chart_graph_data/line_chart_default.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard(
      {Key? key,
      required this.title,
      required this.categoryIcon,
      required this.onTap,
      required this.buttonOnTap, required this.categoryChart})
      : super(key: key);

  final String title;
  final Icon categoryIcon;
  final Function() onTap;
  final Function() buttonOnTap;
  final Widget categoryChart;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onLongPress: () {
      //   Get.to(() => GraphViewPage());
      // },
      onTap: onTap,
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        categoryIcon,
                        Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                  GestureDetector(
                    onTap: buttonOnTap,
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade900),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 30,
                        width: 60,
                        child: Center(
                            child: Icon(
                          Icons.add,
                          color: Colors.blue.shade900,
                        ))),
                  )
                  // customButton(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.2,
                  width: Get.width * 0.85,
                  child: categoryChart,
                ),
              ],
            ),
            Row()
          ]),
        ),
      ),
    );
  }

  Widget customButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade900),
            borderRadius: BorderRadius.circular(8),
          ),
          height: 30,
          width: 60,
          child: Center(
              child: Icon(
            Icons.add,
            color: Colors.blue.shade900,
          ))),
    );
  }
}

