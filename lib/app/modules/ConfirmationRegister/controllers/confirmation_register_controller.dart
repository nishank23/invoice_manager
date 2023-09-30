import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../services/Connectivity/networkClient.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/constants/constants.dart';
import '../../../routes/app_pages.dart';

class ConfirmationRegisterController extends GetxController {
  //TODO: Implement ConfirmationRegisterController
  Timer? periodicTimer; // Timer variable
  GetStorage box = GetStorage();
  final count = 0.obs;

  final userId = Get.arguments??"";

  @override
  void onInit() {
    super.onInit();

    startPeriodicCheck(); // Start the periodic check when the controller is initialized
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    stopPeriodicCheck(); // Stop the periodic check when the controller is closed
  }

  Future<void> checkGetStorageValues() async {
    // Perform actions based on the checked values
  }

  void startPeriodicCheck() {
    periodicTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      ApiCheckVerification(context: Get.context!,userId:userId );
    });
  }

  void stopPeriodicCheck() {
    periodicTimer?.cancel();
  }

  void increment() => count.value++;

  openEmailApps() async {
    await LaunchApp.openApp(
      appStoreLink:
          'https://apps.apple.com/us/app/gmail-email-by-google/id422689480',
      openStore: false,
      androidPackageName: 'com.google.android.gm',
      iosUrlScheme: 'gmailemailbygoogle://',
    );
  }

  ApiCheckVerification({required BuildContext context, required userId}) async {
    FocusScope.of(context).unfocus();
    Map<String, dynamic> dict = {};

    dict['userId'] = userId;

    // ignore: use_build_context_synchronously
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "userIsVerified",
      MethodType.Post,
      params: dict,
      successCallback: (response, message) {


        bool isVerified =response['data']['isEmailVerified'];
        if (isVerified) {
          box.write(Constant.tokenKey, response["token"]);
          box.write(Constant.userId, response['data']['_id']);


          Get.offAllNamed(Routes.TABS);

        }
      },
      failureCallback: (status, message) {
        print("error");
      },
    );
  }
}
