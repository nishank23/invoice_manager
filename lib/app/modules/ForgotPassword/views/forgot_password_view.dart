import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/global/widgets/mytextfiled.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../../../global/constants/constants.dart';
import '../../../global/widgets/my_button.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordController());
    return Scaffold(
        backgroundColor: AppColor.white,
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        debugPrint("hello");
                      },
                      child: SizedBox(
                        child: SvgPicture.asset(AppAsset.backIcon),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Invoice ',
                        style: text700_23blue,
                        children: <TextSpan>[
                          TextSpan(
                            text: "Manager",
                            style: text300_23blue,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 217.h,
                  child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AppAsset.forgotPassBackground,
                      height: 140.h,
                      width: 156.w,
                    ),
                  ),
                ),
                Text(
                  "Forgot your password?",
                  style: text500_25black,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Please enter the email address associated with your \naccount and We will email you a link to reset your password.",
                  style: text300_16grey,
                ),
                SizedBox(
                  height: 38.h,
                ),
                Obx(
                  () => MyTextFiled(
                    controller: controller.emailController.value,
                    lableText: "Email address",
                    onValidator: (value) {
                      if (value!.length < 1) {
                        return "Email can't be empty ";
                      } else if (!Constant.validateEmail(value)) {
                        return "Please enter valid email.";
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: AppColor.filedIcon,
                      size: 21.25.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                mybutton(
                  onTap: () {
                    String email = controller.emailController.value.text;
                    if (!Constant.validateEmail(email)) {
                      Fluttertoast.showToast(msg: 'Please enter valid email ');
                    } else {
                      controller.apiForgetPassword(
                          context: context, email: email);
                    }
                  },
                  title: "Forgot Password",
                ),
                SizedBox(
                  height: 14.h,
                ),
                SizedBox(
                  height: 20.h,
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1.w,
                            color: AppColor.hintTextGrey.withOpacity(.3),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 2.h),
                          child: Text(
                            "or",
                            style: text400_16grey,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1.w,
                            color: AppColor.hintTextGrey.withOpacity(.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                mybutton(
                    onTap: () {
                      Get.back();
                      debugPrint("hello");
                    },
                    title: "Back to Log In",
                    textStyle:
                        text600_16white.copyWith(color: AppColor.darkGrey),
                    backgroundColor: AppColor.white,
                    borderColor: AppColor.buttonGrey),
                SizedBox(
                  height: 26.h,
                ),
              ],
            ),
          ),
        ));
  }
}
