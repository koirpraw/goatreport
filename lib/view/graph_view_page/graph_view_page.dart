import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


class GraphViewPage extends StatefulWidget {
  const GraphViewPage({Key? key}) : super(key: key);

  @override
  State<GraphViewPage> createState() => _GraphViewPageState();
}

class _GraphViewPageState extends State<GraphViewPage>
    with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

    final _kTabPages = <Widget>[
     Container(
       color: Colors.grey.withOpacity(0.1),
       height: Get.height * 0.5,
       // width: Get.width * 0.9,
       child: Center(child:Text('Insights')),),
      Container(
       decoration: BoxDecoration(
         color: Colors.grey.withOpacity(0.1),),
        height: Get.height * 0.5,
        // width: Get.width * 0.9,
        child: Center(child:Text('Insights')),),

  ];

  final _kTabs = <Tab>[
    // const Tab(icon: Icon(Icons.data_saver_off), text: 'Insights'),
    // const Tab(icon: Icon(Icons.sd_storage), text: 'Data'),
    Tab(text: 'Insight',),
    Tab(text: 'Data',),
  ];

  static const List<String> timePeriodItems = <String>['14 D', 'Month', '60 D', 'Year'];

static const List<String> editItems = <String>[
    'Edit',
    'Delete',
  ];

String dropdownValue = timePeriodItems.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.directions_walk,
              color: Colors.black,
            ),
            Text(
              "Steps",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share,color: Colors.grey,),
          ),
         DropdownButton(
           icon: Icon(Icons.more_horiz,color: Colors.grey,),
           items: editItems.map<DropdownMenuItem<String>>((String value) {
             return DropdownMenuItem<String>(
               value: value,
               child: Text(value),
             );
           }).toList(),
           onChanged: (String? value) {
             // This is called when the user selects an item.
             setState(() {
               dropdownValue = value!;
             });
           },)
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.1,
                    width: Get.width * 0.95,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.event_note_outlined)),
                          // TextButton(onPressed: () {}, child: Text('Y')),
                          TextButton(onPressed: () {}, child: Text('M')),
                          TextButton(onPressed: () {}, child: Text('W')),
                          TextButton(onPressed: () {}, child: Text('D')),
                          DropdownButton(
                            items: timePeriodItems.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue = value!;
                              });
                            },),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Past Week",
                    style: TextStyle(fontSize: 18),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.compare_arrows),
                          Text("Compare"),
                        ],
                      ))
                ],
              ),
              SfCartesianChart(),
              SizedBox(
                height: Get.height * 0.065,
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],


                    color: Colors.blue.shade900,
                  ),
                  unselectedLabelColor: Colors.black,
                  tabs: _kTabs,
                  controller: _tabController,
                ),
              ),
              SizedBox(
                height: Get.height * 0.25,
                width: Get.width * 0.9,
                child: TabBarView(
                    children: _kTabPages,
                    controller: _tabController,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Colors.purple.shade900,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}

class CustomSelectorButton extends StatelessWidget {
  const CustomSelectorButton(
      {Key? key,
      required this.buttonTitle,
      required this.onButtonTap,
      required this.buttonIcon})
      : super(key: key);
  final String buttonTitle;
  final Function() onButtonTap;
  final Icon buttonIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Container()],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final DateTime x;
  final double y;
}
