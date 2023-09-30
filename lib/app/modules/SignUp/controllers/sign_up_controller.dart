import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/networkClient.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/constants/constants.dart';
import '../../../global/widgets/custom_dialog.dart';
import '../../../routes/app_pages.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController

  RxBool isShow = false.obs;
  RxBool isConfirmShow = false.obs;


  Rx<TextEditingController> emailController =  TextEditingController().obs;
  Rx<TextEditingController> passwordController =  TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =  TextEditingController().obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'openid'
    ],
  );
  @override
  void onInit() {
    super.onInit();
  }
  Future<void> signUpwithGoogle(BuildContext context) async {
    try {
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      String? email = googleSignInAccount.email;

      String? googleId = googleSignInAccount.id;


      print(googleSignInAuthentication.idToken);
      print(email);

      // ignore: use_build_context_synchronously
      ApiSignUpGmail(context: context, email: email, googleId: googleId);

    } catch(err){
      debugPrint("GoogleAuthException : $err");
    }
    return null;
  }

  ApiSignUpEmail(
      {required BuildContext context, required String email, required String password}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    final fcmtoken = await FirebaseMessaging.instance.getToken();

    dict["email"] = email;
    dict["password"] = password;
    dict["fcm"] = fcmtoken;

    print(jsonEncode(dict));
    print(fcmtoken);

    log(jsonEncode(dict));
    // ignore: use_build_context_synchronously
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.SignUpEmail,
      MethodType.Post,
      params: dict,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        
        Get.toNamed(Routes.CONFIRMATION_REGISTER,arguments: response["data"]);
        
        
        
        
       /* box.write(Constant.tokenKey, response["token"]);
        box.write(Constant.userId, response['user']['_id']);


          print(response['user']['_id']);
          print(response['token']);

          box.write(Constant.isAlreadyLoggedIn, true);

          Get.offAllNamed(Routes.TABS);*/

      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }




  ApiSignUpGmail(
      {required BuildContext context, required String email,required String googleId}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    final fcmtoken = await FirebaseMessaging.instance.getToken();

    dict["email"] = email;
    dict["googleId"] = googleId;
    dict["fcm"] = fcmtoken;

    print(jsonEncode(dict));
    print(fcmtoken);

    log(jsonEncode(dict));
    // ignore: use_build_context_synchronously
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.SignUpGoogle,
      MethodType.Post,
      params: dict,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        box.write(Constant.tokenKey, response["token"]);
        box.write(Constant.userId, response['user']['_id']);


        print(response['user']['_id']);
        print(response['token']);

        box.write(Constant.isAlreadyLoggedIn, true);

        Get.offAllNamed(Routes.TABS);

      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }



}








