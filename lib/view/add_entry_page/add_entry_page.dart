import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goatreport/view/graph_view_page/widgets/date_time_custom_button.dart';
import 'package:intl/intl.dart';



class AddEntryPage extends StatefulWidget {
  AddEntryPage({Key? key}) : super(key: key);

  @override
  State<AddEntryPage> createState() => _AddEntryPageState();
}

class _AddEntryPageState extends State<AddEntryPage> {
  late double sliderValue = 2.0;

  final String currentDate = DateFormat('MMM dd yyyy').format(DateTime.now());

  final String currentTime = DateFormat('H:MM a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Add Entry",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.directions_walk_rounded,
                                color: Colors.grey,

                              ),
                              Text(
                                'steps',
                                style: TextStyle(
                                    color: Colors.grey),

                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DateTimeCustomButton(
                            currentTimeIcon: Icons.calendar_month_rounded,
                            currentTimeText: currentDate,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2101),
                              );
                            },
                          ),
                          DateTimeCustomButton(
                            currentTimeIcon: Icons.watch_later_outlined,
                            currentTimeText: currentTime,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                            },
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
              child: Center(
                child: Slider(
                    label: sliderValue.toString(),
                    min: 0,
                    max: 5,
                    divisions: 5,

                    onChanged: (double newValue) {
                      setState(() {
                       sliderValue = newValue;
                      });
                    },
                    value: sliderValue),

              ),
            ),
            SizedBox(
              height: Get.height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text("# Tags",style: TextStyle(fontSize: 24),),
                  Wrap(
                    spacing: 8.0,
                    children:  [
                      InputChip(label: Text("Tag 1"),onDeleted: (){},),
                      InputChip(label: Text("Tag 2"),onDeleted: (){},),
                      InputChip(label: Text("Tag 3"),onDeleted: (){},),
                      InputChip(label: Text("Tag 4"),onDeleted: (){},),
                      InputChip(label: Text("Tag 5"),onDeleted: (){},),
                      InputChip(label: Text("Tag 6"),onDeleted: (){},),
                      // InputChip(label: Text("Tag 7"),onDeleted: (){},),
                      // InputChip(label: Text("Tag 8"),onDeleted: (){},),
                      // InputChip(label: Text("Tag 9"),onDeleted: (){},),
                      // InputChip(label: Text("Tag 10"),onDeleted: (){},),

                    ],
                  )


                ],
              ),
            ),
            // SizedBox(
            //   height: Get.height * 0.25,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children:  [
            //       Text("# Tags",style: TextStyle(fontSize: 24),),
            //       Wrap(
            //         spacing: 8.0,
            //         children:  [
            //           InputChip(label: Text("Tag 1"),onDeleted: (){},),
            //           SizedBox(width: Get.width*0.6,)
            //
            //         ],
            //       )
            //
            //
            //     ],
            //   ),
            // ),
            SizedBox(
              height: Get.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Row(
                      children: [
                        Icon(Icons.chat_outlined,size: 36,),
                        Text("Note",style: TextStyle(fontSize: 24),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        height: 60,
                        width: Get.width*0.4,
                        child: const TextField(
                          textAlign: TextAlign.start,
                          maxLines: 10,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            prefixIcon: Icon(Icons.add),
                            hintText: 'Add note',


                          ),

                        ),
                      ),
                    ),
                    SizedBox(width: Get.width*0.9,)


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddEntryPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
