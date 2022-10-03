import 'dart:convert';

import 'package:get/get.dart';

import '../fixtures/fixture_reader.dart';
import '../model/health_header.dart';

class UserTrackerController extends GetxController{
  var userheaders = [].obs;
  Map<String, String> listOfSelectedItems = Map();

  getHealthHeader(){
    userheaders.clear();
    loadAsset().then((value){
      List<HealthHeader> headers = [];
      List jsonResponse = json.decode(value);
      jsonResponse.forEach((element) {
        headers.add(HealthHeader.fromJson(element));
      });
      userheaders.assignAll(headers);
    });
  }
}