import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/network_client.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/custom_dialog.dart';
import '../../../routes/app_pages.dart';

class ResetPasswordController extends GetxController {
  RxBool isShow = true.obs;
  RxBool isConfirmShow = true.obs;

  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

  final passwordToken = Get.arguments as String?;

  apiResetPassword(
      {required BuildContext context, required String password}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};

    dict["password"] = password;

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.ResetPassword}/$passwordToken",
      MethodType.Post,
      params: dict,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        Fluttertoast.showToast(msg: "Successfully reset password");

        Get.offAllNamed(Routes.LOGIN);
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
      },
    );
  }
}
