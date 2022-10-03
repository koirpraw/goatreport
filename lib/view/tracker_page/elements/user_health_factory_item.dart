import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/health_controller.dart';
import '../../../controller/user_tracker_controller.dart';
import '../../../model/health_category.dart';




class UserHealthFactoryPage extends StatefulWidget {
  final List<HealthCategory> categories;
  final UserTrackerController userTrackerController;
  final HealthController healthController;
  final int? tagId;

  UserHealthFactoryPage(
      {Key? key,
        required this.categories,
        required this.userTrackerController,
        required this.healthController,
        required this.tagId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => UserHealthFactoryPageState();
}

class UserHealthFactoryPageState extends State<UserHealthFactoryPage> {
  List<int> selectedIndex = [];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<HealthCategory> healthCategories = <HealthCategory>[];
      healthCategories.addAll(widget.categories);
      widget.healthController.allCategories.reversed.forEach((element) {
        if(element.tagId == widget.tagId){
          healthCategories.add(element);
        }
      });
      return Wrap(
        children: [
          ...List.generate(
            healthCategories.length,
                (index) {
              var category = healthCategories[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (selectedIndex.contains(index)) {
                      selectedIndex.remove(index);
                      widget.healthController.removeClickedFactorCategory(category);
                    } else {
                      selectedIndex.add(index);
                      widget.healthController.addClickedFactorCategory(category);
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0, bottom: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black87),

                        color: selectedIndex.contains(index)
                            ? Colors.purple[200]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, bottom: 2, top: 2),
                        child: Text(
                          category.catName!,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      );
    });
  }
}
