import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:goatreport/controller/user_tracker_controller.dart';
import 'package:goatreport/model/health_header.dart';
import 'package:goatreport/view/home_page/home_page.dart';
import 'package:goatreport/view/search_page/search_page.dart';
import 'package:goatreport/view/tracker_page/event_page/user_tracker_events.dart';
import 'package:goatreport/view/tracker_page/factors_page/user_tracker_factor.dart';
import 'package:goatreport/view/tracker_page/health_data_page.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.175,
        title: Container(child: Image.asset('assets/logos/logo-color.png'),),
        elevation: 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.search,color: Colors.black,),
          color: Colors.black,
          onPressed: () {
           Get.to(()=>SearchPage());
          },
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.to(()=>HomePage());
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  ut_controller.getHealthHeader();
                  Get.to(()=>HealthDataPage());
                },
                icon: const Icon(
                  Icons.display_settings_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
        //   IconButton(
        //     onPressed: () {
        //
        //     },
        //     icon: const Icon(Icons.settings,color: Colors.black,),
        //   ),
        //   IconButton(
        //     onPressed: () {
        //   Get.back();
        //     },
        //     icon: const Icon(Icons.close,color: Colors.black,),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount:ut_controller.userheaders.length,
              itemBuilder: (context, index) {
                final item = ut_controller.userheaders[index];
                return buildHeaderCard(item);
              },
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
        }else if(header.headerId ==2){
          Get.to(()=>UserTrackerSymptoms(tagList: header.tagList, userTrackerController: ut_controller),
          arguments: header.tagList);
        }else{
          Get.to(()=>UserTrackerEvents());
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
          height: Get.height * 0.125,
          child: Center(
            child: Text(header.headerName!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
          ),
        )

      ),
    );

  }
}
