import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_detail.dart';

void saveUserDetails(userDetails) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('current_user', jsonEncode(userDetails));
}

Future<UserDetails?> getUserDetails() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('current_user')) {
    var value = prefs.get('current_user').toString();
    if(value.isNotEmpty){
      return UserDetails.fromMap(jsonDecode(value));
    }else{
      return null;
    }
  } else {
    return null;
  }
}