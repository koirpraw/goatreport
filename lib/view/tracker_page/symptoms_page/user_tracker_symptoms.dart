import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goatreport/view/tracker_page/symptoms_page/user_health_symptoms_page.dart';
import 'package:health/health.dart';
import '../../../controller/health_controller.dart';
import '../../../controller/user_tracker_controller.dart';
import '../../../model/health_category.dart';
import '../../../model/health_tag.dart';

import 'package:intl/intl.dart';

class UserTrackerSymptoms extends StatefulWidget {
  final List<HealthTag>? tagList;
  final UserTrackerController userTrackerController;

  const UserTrackerSymptoms(
      {Key? key, required this.tagList, required this.userTrackerController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => UserTrackerSymptomsState();
}

class UserTrackerSymptomsState extends State<UserTrackerSymptoms> {
  late String formattedDate;
  final HealthController healthController = Get.put(HealthController());

  @override
  void initState() {
    DateTime now = DateTime.now();
    formattedDate = DateFormat('MMM dd, kk:mm').format(now);
    healthController.getAllHealthCategory();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Symptoms',
          ),
        ),
        body: SingleChildScrollView(
          child: Card(
            elevation: 16,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    formattedDate,
                    style: TextStyle(
                        fontSize: 14, color: Colors.purple),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // Let the ListView know how many items it needs to build.
                  itemCount: widget.tagList?.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    final item = widget.tagList?[index];
                    return buildTag(item);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      healthController.insertAllSymptomsData();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Added successfully"),
                      ));
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Text('Submit'),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ));
  }

  Widget buildTag(HealthTag? item) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                  child: Text(
                    item!.tagName!,
                    style: TextStyle(fontSize: 16),
                  )),
            ),
            UserHealthSymptomsPage(
                categories: item.categories!,
                userTrackerController: widget.userTrackerController,
                healthController: healthController,
                tagId: item.tagId!),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Add ${item.tagName }',
                          style: TextStyle(color: Colors.black),
                        ),
                        content: Container(
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextField(
                                onChanged: (value) {
                                  healthController.categoryName.value = value;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration:
                                InputDecoration(hintText: "Enter name"),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            color: Colors.green,
                            textColor: Colors.white,
                            child: Text('OK'),
                            onPressed: () {
                              if (healthController
                                  .categoryName.value.isNotEmpty) {
                                healthController.insertHealthCategory(
                                    HealthCategory(
                                        catName:
                                        healthController.categoryName.value,
                                        tagId: item.tagId,
                                        catType: item.tagName,
                                        catStatus: 1));
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '+Add/Edit',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
