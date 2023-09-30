import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/routes/app_pages.dart';

import '../../../../main.dart';
import '../../../global/constants/constants.dart';


class SplashController extends GetxController {
  //TODO: Implement SplashController
  String? uid;

  @override
  void onInit() {
    print("hello");
     // GetStorage.init();
    splash();
    super.onInit();


  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  splash() async {
    /*var token = await FirebaseMessaging.instance.getToken();
    log(token.toString());
    bool isVersionMatched = await initPackageInfo();
    isVisible.value = false;*/
    Timer(Duration(seconds: 3), () {
      /*if (!isVersionMatched) {
        Get.offAll(AppUpdateScreen());
      } else {*/
        /*if (userList.value!.appUnderMaintenance == true) {
          Get.offAll(UnderMaintenance());
        } else {*/
          if (box.read(Constant.tokenKey) != null) {


            if(box.read(Constant.isProfileUpdated)==null || box.read(Constant.isProfileUpdated)==false){
              Get.offAllNamed(Routes.TABS);

            }else{
              Get.offAllNamed(Routes.HOME);

            }
/*
            callApiForUpdateFcmToken(context: Get.context!);
*/
          } else {
            Get.offAllNamed(Routes.LOGIN);
          }

      }
    );
  }
}
