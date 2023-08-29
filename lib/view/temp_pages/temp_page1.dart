import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goatreport/view/home_page/widgets/prompt_box_custom_paint.dart';
import 'package:goatreport/view/temp_pages/chart_json_data_source.dart';
import 'package:goatreport/view/temp_pages/height_measure.dart';
import 'package:goatreport/view/temp_pages/water_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../home_page/widgets/chatbox_custompaint.dart';

class TempPage1 extends StatelessWidget {
  const TempPage1({Key? key}) : super(key: key);
  final double width1 = 1000;
  final double width2 = 1500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TempPage1'),
        iconTheme: IconThemeData(color: Colors.black26),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 100,
            // ),
            Text("temp1"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.18),
                      spreadRadius: 5,
                      blurRadius: 16,
                      offset: const Offset(2, 12), // changes position of shadow
                    ),
                  ],

                ),
                child: CustomPaint(
                  size: Size(300, 100),
                  painter: PromptBoxCustomPaint(),
                  child: SizedBox(
                    height: 100,
                    child: Center(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              'What Kind of Metrics Do You Want to Track?',
                              textStyle: const TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Montserrat',
                              ),
                              textAlign: TextAlign.center,
                              speed: const Duration(milliseconds: 30),
                            ),
                          ],
                          isRepeatingAnimation: false,
                        )),
                  ),
                ),

              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Card(
                elevation: 4,
                child: Column(
                  children: [
                    Text("Track your water intake",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                    SizedBox(
                      height: Get.height*0.25,
                        child: WaterLevelTracker()),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Card(
                elevation: 4,
                child: Column(
                  children: [
                    Text("Record your Height",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                    SizedBox(
                        height: Get.height*0.4,
                        child: HeightMeasureWidget()),
                  ],
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              Get.to(()=>ChartJsonDataSource());
            }, child: Text("Json Chart"))


          ],
        ),
      ),
    );
  }
}

