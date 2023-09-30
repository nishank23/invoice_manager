// Common Dialogs

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_color.dart';

class CustomDialogs {
  void showCircularDialog(
    BuildContext context,
  ) {
    CircularDialog.showLoadingDialog(
      context,
    );
  }

  void hideCircularDialog(
    BuildContext context,
  ) {
    Navigator.pop(
      context,
    );
  }

  getDialog({
    String title = "Error",
    String desc = "Some Thing went wrong....",
  }) {
    return Get.defaultDialog(
      barrierDismissible: false,
      title: title,
      content: Text(
        desc,
        textAlign: TextAlign.center,
      ),
      buttonColor: AppColor.primaryBlue,
      textConfirm: "Ok",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
      },
    );
  }

  getDialogWithAction({String title = "Error", String desc = "Some Thing went wrong....", VoidCallback? onClick}) {
    return Get.defaultDialog(
      barrierDismissible: false,
      title: title,
      content: Text(
        desc,
        textAlign: TextAlign.center,
      ),
      buttonColor: AppColor.normalGrey,
      textConfirm: "Ok",
      confirmTextColor: Colors.white,
      onConfirm: (onClick != null)
          ? onClick
          : () {
              Get.back();
            },
    );
  }
}

class CircularDialog {
  static Future<void> showLoadingDialog(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const Dialog(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: AppColor.primaryBlue,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Please wait...',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

  }}