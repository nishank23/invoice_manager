import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';
import 'package:invoice_generator/app/global/widgets/mytextfiled.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        extendBody: true,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      print("hello");
                    },
                    child: SizedBox(
                      child: SvgPicture.asset(AppAsset.backIcon),
                    ),
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Text(
                  "Create new password",
                  style: text500_25black,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Your new password must be different from previous used passwords.",
                  style: text300_16grey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Obx(
                  () => MyTextFiled(
                    controller: controller.passwordController.value,
                    obscureText: controller.isShow.value,
                    onValidator: (value) {
                      if (value!.length < 8) {
                        return "Must be at least 8 characters.";
                      } else {
                        return null;
                      }
                    },

                    suffixIcon: InkWell(
                      borderRadius: BorderRadius.circular(100.0),
                      onTap: () {
                        controller.isShow.value = !controller.isShow.value;
                      },
                      child: Icon(
                        controller.isShow.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 19.w,
                        color: controller.isShow.value
                            ? AppColor.textFiledGrey
                            : AppColor.primaryBlue,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      color: AppColor.filedIcon,
                      size: 21.25.w,
                    ),
                    lableText: "password",
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Visibility(

                  visible: false,
                  child: Text(
                    "Must be at least 8 characters.",
                    style: text400_13grey,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Obx(
                  () => MyTextFiled(
                    controller: controller.confirmPasswordController.value,
                    obscureText: controller.isConfirmShow.value,
                    onValidator: (value) {
                      if (value!.length < 8) {
                        return "Must be at least 8 characters.";
                      } else if (value! !=
                          controller.passwordController.value.text) {
                        return "Both password must match";
                      } else {
                        return null;
                      }
                    },
                    suffixIcon: InkWell(
                      borderRadius: BorderRadius.circular(100.0),
                      onTap: () {
                        controller.isConfirmShow.value =
                            !controller.isConfirmShow.value;
                      },
                      child: Icon(
                        controller.isConfirmShow.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 19.w,
                        color: controller.isConfirmShow.value
                            ? AppColor.textFiledGrey
                            : AppColor.primaryBlue,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      color: AppColor.filedIcon,
                      size: 21.25.w,
                    ),
                    lableText: "Confirm password",
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Visibility(
                  visible: false,
                  child: Text(
                    "Both password must match.",
                    style: text400_13grey,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                mybutton(title: "Reset Password", onTap: () {
                  String password =
                      controller.passwordController.value.text;
                  String confirmPassword =
                      controller.confirmPasswordController.value.text;

                  if (password.length < 8) {
                    Fluttertoast.showToast(
                        msg:
                        'Must be at least 8 characters.');
                  } else if (password.length < 8) {
                    Fluttertoast.showToast(
                        msg:
                        'Must be at least 8 characters.');
                  } else if (password != confirmPassword) {
                    // Password and confirm password fields do not match
                    Fluttertoast.showToast(
                        msg:
                        'Both password must match.');
                  } else {
                    controller.ApiResetPassword(
                        context: Get.context!,
                        password:
                        controller.passwordController.value.text);
                  }

                })
              ],
            ),
          ),
        ));
  }
}
