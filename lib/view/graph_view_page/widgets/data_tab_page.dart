import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DataTabPage extends StatelessWidget {
   DataTabPage({Key? key}) : super(key: key);

  final String minDays = "3 Days";
  final String todaysDate = DateFormat('yMMMMEEEEd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.1),
      height: Get.height * 0.5,
      child: Center(
        child: SingleChildScrollView(
          child: Column(

            children: [
            Text(todaysDate),
              SizedBox(
                height: Get.height * 0.1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          height: Get.height * 0.1,
                          width: 60,
                          child: Card(
                            child: Center(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(Icons.directions_walk,color: Colors.green.withOpacity(0.7),),
                                  Text('$index'),
                                ],
                              ),
                            )),
                          ),
                        ),
                      );
                    }),
              ),


            ],
          ),
        ),
      ),
    );
  }
}