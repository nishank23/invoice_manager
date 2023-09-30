import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../controllers/confirmation_mail_controller.dart';

class ConfirmationMailView extends GetView<ConfirmationMailController> {
  const ConfirmationMailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        SizedBox(
          height: 283.h,
        ),
        Center(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColor.primaryBlue.withOpacity(.1)),
          padding: EdgeInsets.fromLTRB(28.75.w, 32.7.h, 27.9.w, 27.5.h),
          child: SvgPicture.asset(AppAsset.sendMailIcon),
        )),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "Check your mail",
          style: text500_25black,
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "We have sent a password recover \ninstructions to your email.",
          textAlign: TextAlign.center,
          style: text300_16grey,
        ),
        SizedBox(
          height: 16.h,
        ),
        mybutton(title: "Open Email App", horizontal: 20.w,onTap: () {

         controller.openEmailApps();
          /*
          Get.toNamed(Routes.RESET_PASSWORD);*/
        },),
        SizedBox(
          height: 24.h,
        ),
        Text(
          "Skip,I’ll confirm later",
          style: text400_16grey.copyWith(color: const Color(0xff374253)),
        ),
        SizedBox(
          height: 265.h,
        ),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: 'Did not receive the email? Check your spam filter,\nor ',
            style: text300_16grey.copyWith(color: AppColor.darkGrey),
            children: <TextSpan>[
              TextSpan(
                text: "try another email address",
                style: text600_16blue,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
