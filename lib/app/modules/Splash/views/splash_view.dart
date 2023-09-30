import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/global/constants/app_color.dart';
import 'package:invoice_generator/app/global/constants/app_fonts.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: AppColor.primaryBlue,
      body: Center(
          child: Text.rich(
        TextSpan(
          text: 'Invoice ',
          style: text700_28white,
          children: <TextSpan>[
            TextSpan(
              text: "Manager",
              style: text200_28white,
            ),
          ],
        ),
      )),
    );
  }
}
