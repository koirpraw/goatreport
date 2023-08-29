import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goatreport/view/home_page/home_page.dart';
import 'package:goatreport/view/tracker_page/tracker_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
      // const TrackerHomePage(),
    );
  }
}


