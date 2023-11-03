import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/network_client.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/constants/constants.dart';
import '../../../global/widgets/custom_dialog.dart';
import '../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;

  apiForgetPassword(
      {required BuildContext context, required String email}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    final fcmtoken = await FirebaseMessaging.instance.getToken();

    dict["email"] = email;
    dict["fcm"] = fcmtoken;

    debugPrint(jsonEncode(dict));
    debugPrint(fcmtoken);

    log(jsonEncode(dict));
    // ignore: use_build_context_synchronously
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.ForgotPassword,
      MethodType.Post,
      params: dict,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        debugPrint(response['token']);

        box.write(Constant.isAlreadyLoggedIn, true);

        Fluttertoast.showToast(msg: response['message']);

        Get.offAllNamed(Routes.CONFIRMATION_MAIL);
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
      },
    );
  }
}
