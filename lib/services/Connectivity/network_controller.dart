// ignore_for_file: must_call_super, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, prefer_const_constructors

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:get/get.dart';
import '../../app/global/constants/other_Screen/Internate_connection.dart';

class NetworkController extends GetxController {
  bool isConnected = false;

  void fetchData() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        isConnected = false;
        Get.to(InternateConnection());
      } else {
        isConnected = true;
        Get.back();
      }
    });
  }
}
