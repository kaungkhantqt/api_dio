import 'dart:convert';

import 'package:inter_day1/model/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyShare {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static addLogin(Login login) {
    sharedPreferences!.setString("login", jsonEncode(login));
  }
}
