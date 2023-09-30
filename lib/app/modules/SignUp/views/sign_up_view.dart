import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:invoice_generator/app/global/constants/app_asset.dart';
import 'package:invoice_generator/app/global/constants/app_color.dart';
import 'package:invoice_generator/app/global/constants/app_fonts.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';
import 'package:invoice_generator/app/global/widgets/mytextfiled.dart';
import 'package:invoice_generator/app/routes/app_pages.dart';

import '../../../global/constants/constants.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());

    return Scaffold(
      backgroundColor: AppColor.white,
      extendBody: true,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          reverse: false,
          child: Stack(
            children: [
              Positioned(
                right: -20.h,
                top: -20.h,
                height: 601.h,
                width: 457.w,
                child: SvgPicture.asset(
                  AppAsset.LoginBackGround,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SafeArea(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(
                          height: 8,
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
                          height: 217.h,
                          child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              AppAsset.LoginMan,
                              width: 134.81.w,
                              height: 140.h,
                            ),
                          ),
                        ),
                        Text(
                          "Create Account",
                          style: text500_25black,
                        ),
                        SizedBox(
                          height: 5.5.h,
                        ),
                        Text(
                          "Hello user! "
                          "\nPlease fill out the form below to get stared.",
                          style: text300_16grey,
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        SizedBox(
                          height: 42.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    controller.signUpwithGoogle(context);
                                  },
                                  child: Container(
                                    // padding: EdgeInsets.symmetric(horizontal: 20.w,),
                                    height: 42.h,

                                    decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColor.hintTextGrey
                                                .withOpacity(.3))),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(AppAsset.googleIcon),
                                        Text(
                                          "Sign up with Google",
                                          style: text300_16black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Container(
                                  // padding: EdgeInsets.symmetric(horizontal: 20.w,),
                                  height: 42.h,

                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppColor.hintTextGrey
                                              .withOpacity(.3))),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        AppAsset.facebook,
                                        height: 22.h,
                                        width: 21.h,
                                      ),
                                      Text(
                                        "Sign up with FB",
                                        style: text300_16black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 23.h,
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
                                    )),
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
                          height: 30.h,
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
                        Obx(
                          () => MyTextFiled(
                            controller: controller.passwordController.value,
                            obscureText: controller.isShow.value,
                            onValidator: (value) {
                              String password =
                                  controller.passwordController.value.text;
                              String confirmPassword =
                                  controller.confirmPasswordController.value.text;

                              if (value!.length < 8) {
                                return "Must be at least 8 characters.";
                              } else {
                                return null;
                              }
                            },
                            suffixIcon: InkWell(
                              borderRadius: BorderRadius.circular(100.0),
                              onTap: () {
                                controller.isShow.value =
                                    !controller.isShow.value;
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
                          height: 16.h,
                        ),
                        Obx(
                          () => MyTextFiled(
                            controller:
                                controller.confirmPasswordController.value,
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
                          height: 16.h,
                        ),
                        mybutton(
                          title: "Sign Up",
                          onTap: () {
                            String email = controller.emailController.value.text;

                            String password =
                                controller.passwordController.value.text;
                            String confirmPassword =
                                controller.confirmPasswordController.value.text;
                            if (!Constant.validateEmail(email)) {
                              Fluttertoast.showToast(
                                  msg: 'Please enter valid email ');
                            } else if (password.length < 6) {
                              Fluttertoast.showToast(
                                  msg:
                                      'Password should be at least 8 characters long.');
                            } else if (password.length < 6) {
                              Fluttertoast.showToast(
                                  msg:
                                      'Confirm Password should be at least 8 characters long.');
                            } else if (password != confirmPassword) {
                              // Password and confirm password fields do not match
                              Fluttertoast.showToast(
                                  msg:
                                      'Both password must match.');
                            } else {
                              controller.ApiSignUpEmail(
                                  context: Get.context!,
                                  email: controller.emailController.value.text,
                                  password:
                                      controller.passwordController.value.text);
                            }
                          },
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
                            },
                            title: "Log In",
                            textStyle: text600_16white.copyWith(
                                color: AppColor.darkGrey),
                            backgroundColor: AppColor.white,
                            borderColor: AppColor.buttonGrey),
                        SizedBox(
                          height: 26.h,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
