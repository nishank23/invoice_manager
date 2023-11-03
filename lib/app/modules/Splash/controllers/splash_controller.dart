import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/routes/app_pages.dart';

import '../../../../main.dart';
import '../../../global/constants/constants.dart';

class SplashController extends GetxController {
  String? uid;

  @override
  void onInit() {
    debugPrint("hello");
    // GetStorage.init();
    splash();
    super.onInit();
  }

  splash() async {
    /*var token = await FirebaseMessaging.instance.getToken();
    log(token.toString());
    bool isVersionMatched = await initPackageInfo();
    isVisible.value = false;*/
    Timer(const Duration(seconds: 3), () {
      /*if (!isVersionMatched) {
        Get.offAll(AppUpdateScreen());
      } else {*/
      /*if (userList.value!.appUnderMaintenance == true) {
          Get.offAll(UnderMaintenance());
        } else {*/
      if (box.read(Constant.tokenKey) != null) {
        if (box.read(Constant.isProfileUpdated) == null ||
            box.read(Constant.isProfileUpdated) == false) {
          Get.offAllNamed(Routes.TABS);
        } else {
          Get.offAllNamed(Routes.HOME);
        }
/*
            callApiForUpdateFcmToken(context: Get.context!);
*/
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    });
  }
}
