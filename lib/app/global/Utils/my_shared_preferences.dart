import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

class MySharedPreferences {
  static const String backNotificationKey = Constant.backNotification;
  static const String fcmKeyKey = Constant.fcmKey;
  static const String fcmValueKey = Constant.fcmValue;

  // Method to set backNotification
  static Future<void> setBackNotification(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(backNotificationKey, value);
  }

  // Method to get backNotification
  static Future<bool> getBackNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(backNotificationKey) ?? false;
  }

  // Method to set fcmKey
  static Future<void> setFcmKey(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(fcmKeyKey, value);
  }

  // Method to get fcmKey
  static Future<String> getFcmKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(fcmKeyKey) ?? '';
  }

  // Method to set fcmValue
  static Future<void> setFcmValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(fcmValueKey, value);
  }

  // Method to get fcmValue
  static Future<String> getFcmValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(fcmValueKey) ?? '';
  }
}
