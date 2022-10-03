import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:goatreport/controller/user_tracker_controller.dart';
import 'package:goatreport/model/health_header.dart';
import 'package:goatreport/view/tracker_page/factors_page/user_tracker_factor.dart';
import 'package:goatreport/view/tracker_page/symptoms_page/user_tracker_symptoms.dart';

class TrackerHomePage extends StatefulWidget {
  const TrackerHomePage({Key? key}) : super(key: key);

  @override
  State<TrackerHomePage> createState() => _TrackerHomePageState();
}

class _TrackerHomePageState extends State<TrackerHomePage> {
  UserTrackerController ut_controller = Get.put(UserTrackerController());

  @override
  void initState() {
    ut_controller.getHealthHeader();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tracker',style: TextStyle(color: Colors.black),),
        elevation: 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Container(
              height: Get.height * 0.8,
              child: ListView.builder(
                itemCount:ut_controller.userheaders.length,
                itemBuilder: (context, index) {
                  final item = ut_controller.userheaders[index];
                  return buildHeaderCard(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderCard(HealthHeader header){
    return GestureDetector(
      onTap: (){
        if(header.headerId ==1){
          Get.to(()=>UserTrackerFactor(tagList: header.tagList, userTrackerController: ut_controller),
         );
        }else{
          Get.to(()=>UserTrackerSymptoms(tagList: header.tagList, userTrackerController: ut_controller),
          arguments: header.tagList);
        }

      },
      child: Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: Get.height * 0.1,
          child: Center(
            child: Text(header.headerName!),
          ),
        )

      ),
    );

  }
}
