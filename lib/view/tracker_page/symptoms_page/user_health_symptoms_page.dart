import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/health_controller.dart';
import '../../../controller/user_tracker_controller.dart';
import '../../../model/health_category.dart';
import '../elements/user_health_symptoms_item.dart';


class UserHealthSymptomsPage extends StatefulWidget {
  final List<HealthCategory> categories;
  final UserTrackerController userTrackerController;
  final HealthController healthController;
  final int tagId;

  UserHealthSymptomsPage(
      {Key? key,
      required this.categories,
      required this.userTrackerController,
      required this.healthController,
      required this.tagId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => UserHealthSymptomsPageState();
}

class UserHealthSymptomsPageState extends State<UserHealthSymptomsPage> {
  List<int> selectedIndex = [];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<HealthCategory> healthCategories = <HealthCategory>[];
      healthCategories.addAll(widget.categories);
      widget.healthController.allCategories.reversed.forEach((element) {
        if (element.tagId == widget.tagId) {
          healthCategories.add(element);
        }
      });
      return GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          children: List.generate(healthCategories.length, (index) {
            var category = healthCategories[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UserHealthSymptomsItem(
                        valueChanged: (value) {
                          if(value == "0"){
                            widget.healthController
                                .removeSymptomsCategory(category);
                          }else {
                            if (selectedIndex.contains(index)) {
                              widget.healthController
                                  .updateSymptomsCategory(category, value);
                            } else {
                              widget.healthController
                                  .addSymptomsCategory(category, value);
                              selectedIndex.add(index);
                            }
                          }

                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: Text(
                          category.catName!.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }));
    });
  }
}
