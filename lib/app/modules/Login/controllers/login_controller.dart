import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/network_client.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/constants/constants.dart';
import '../../../global/widgets/custom_dialog.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  RxBool isShow = false.obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'openid'],
  );

  Future<void> signInwithGoogle(BuildContext context) async {
    try {
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      String? email = googleSignInAccount.email;

      String? googleId = googleSignInAccount.id;

      debugPrint(googleSignInAuthentication.idToken);
      debugPrint(email);

      // ignore: use_build_context_synchronously
      apiSignInGoogle(context: context, email: email, googleId: googleId);

      // callApiForGoogleSignInFirebase(
      //     context: Get.context!,
      //     token: idTokenGenerate,
      //     email: usercredential.user!.email!,
      //     name: usercredential.user!.displayName!);
    } catch (err) {
      debugPrint("GoogleAuthException : $err");
    }
    return;
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    log(loginResult.message!);

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  apiSignInGoogle(
      {required BuildContext context,
      required String email,
      required String googleId}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    final fcmtoken = await FirebaseMessaging.instance.getToken();

    dict["email"] = email;
    dict["googleId"] = googleId;
    dict["fcm"] = fcmtoken;

    debugPrint(jsonEncode(dict));
    debugPrint(fcmtoken);

    log(jsonEncode(dict));
    // ignore: use_build_context_synchronously
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.SignInGoogle,
      MethodType.Post,
      params: dict,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        box.write(Constant.tokenKey, response["token"]);
        box.write(Constant.userId, response['user']['_id']);
        box.write(Constant.isProfileUpdated, true);

        debugPrint(response['user']['_id']);
        debugPrint(response['token']);

        box.write(Constant.isAlreadyLoggedIn, true);

        Fluttertoast.showToast(msg: "User Logged in Successfully");

        Get.offAllNamed(Routes.HOME);
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
      },
    );
  }

  apiSignInEmail(
      {required BuildContext context,
      required String email,
      required String password}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    final fcmtoken = await FirebaseMessaging.instance.getToken();

    dict["email"] = email;
    dict["password"] = password;
    dict["fcm"] = fcmtoken;

    debugPrint(jsonEncode(dict));
    debugPrint(fcmtoken);

    log(jsonEncode(dict));
    // ignore: use_build_context_synchronously
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.SignInEmail,
      MethodType.Post,
      params: dict,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        box.write(Constant.tokenKey, response["token"]);
        box.write(Constant.userId, response['user']['_id']);
        box.write(Constant.isProfileUpdated, true);

        debugPrint(response['user']['_id']);
        debugPrint(response['token']);

        box.write(Constant.isAlreadyLoggedIn, true);

        Fluttertoast.showToast(msg: "User Logged in Successfully");

        Get.offAllNamed(Routes.HOME);
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
      },
    );
  }
}
