import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsightsTabPage extends StatelessWidget {
  const InsightsTabPage({Key? key}) : super(key: key);

  final String minDays = "3 Days";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.1),
      height: Get.height * 0.25,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Need Data for at least '),
            Text(minDays,style: TextStyle(color: Colors.purple.shade900),),
            Text(' to Calculate Detail Insights for this period'),

            // Row(
            //   children: [
            //     Text('Need Data for at least '),
            //     Text(minDays,style: TextStyle(color: Colors.purple.shade900),),
            //     Text(' to Calculate Detail Insights for this period'),
            //   ],
            // ) ,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.search,color: Colors.grey.withOpacity(0.25),size: 128,),
            ],)
          ],
        ),
      ),
    );
  }
}
