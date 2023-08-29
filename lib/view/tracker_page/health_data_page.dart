import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goatreport/controller/health_controller.dart';


class HealthDataPage extends StatelessWidget {
   HealthDataPage({Key? key}) : super(key: key);

  final HealthController healthController = Get.put(HealthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Data'),
      ),
      body: healthController.tagList.length==0?const Center(child: Text('No Data')):ListView.builder(
        itemCount: healthController.tagList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height:Get.height*0.5,
            width: Get.width*0.9,
            child: Card(
              child: Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(healthController.tagList[index].date.toString()),
                        Text(healthController.tagList[index].time.toString()),
                      ],
                    ),
                    Text(healthController.tagList[index].tag),
                    Text(healthController.tagList[index].value.toString()),



                  ],
                ),
              ),
            ),
          );
        },
      ),
    //   ListView.builder(
    //     itemCount: healthController.tagList.length,
    //       itemBuilder: (context, index) {
    //         return ListTile(
    //           title: Text(healthController.tagList[index].text),
    //           trailing: IconButton(
    //             icon: const Icon(Icons.delete),
    //             onPressed: () {
    //               healthController.tagList.removeAt(index);
    //             },
    //           ),
    //         );
    //       }
    // )
    );
  }
}
