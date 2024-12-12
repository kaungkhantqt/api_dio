import 'dart:convert';

import 'package:inter_day1/model/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyShare {
  static SharedPreferences? sharedPreferences;
  MyShare._();
  static Future<MyShare> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return MyShare._();
  }

  static addLogin(Login login) {
    sharedPreferences!.setString("login", jsonEncode(login));
  }

  static String getToken() {
    String? raw = sharedPreferences?.getString("login");
    if (raw == null) {
      return '';
    }
    Login login = Login.fromJson(jsonDecode(raw));
    return login.accessToken;
  }
}
