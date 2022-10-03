
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

String fixture(String path) => File('assets/raw/$path').readAsStringSync();

Future<String> loadAsset() async {
  var s =  await rootBundle.loadString('assets/raw/health_list.json');
  return s;
}