import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/global/constants/app_color.dart';
import 'package:invoice_generator/app/global/constants/app_fonts.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';
import 'package:invoice_generator/app/global/widgets/mytextfiled.dart';
import 'package:invoice_generator/app/routes/app_pages.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColor.white,
      extendBodyBehindAppBar: true,
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
                          height: 271.h,
                          child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              AppAsset.LoginMan,
                            ),
                          ),
                        ),
                        Text(
                          "Welcome Back!",
                          style: text500_25black,
                        ),
                        Text(
                          "Please log in to your account.",
                          style: text300_16grey,
                        ),
                        SizedBox(
                          height: 47.h,
                        ),
                        SizedBox(
                          height: 42.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    controller.signInwithGoogle(context);
                                    print("Tapped");
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
                                          "Sign in with Google",
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
                                child: GestureDetector(
                                  onTap: () {
                                    controller.signInWithFacebook();
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
                                        SvgPicture.asset(
                                          AppAsset.facebook,
                                          height: 22.h,
                                          width: 21.h,
                                        ),
                                        Text(
                                          "Sign in with FB",
                                          style: text300_16black,
                                        ),
                                      ],
                                    ),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1.w,
                                    color: AppColor.hintTextGrey.withOpacity(.3),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 2.h),
                                    color: const Color(0xffFBFBFB),
                                    child: Text(
                                      "or sign in with",
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
                          height: 22.h,
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
                              if (value!.length < 6) {
                                return "Password should be at least 6 characters long.";
                              } else {
                                return null;
                              }
                            },
                            suffixIcon: InkWell(
                              borderRadius: BorderRadius.circular(100.r),
                              onTap: () {
                                controller.isShow.value =
                                    !controller.isShow.value;
                              },
                              child: Icon(
                                controller.isShow.value
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 19.w,
                                color: AppColor.primaryBlue,
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
                          height: 18.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.FORGOT_PASSWORD);
                            },
                            child: Text(
                              "Forgot password?",
                              style: text400_16purple,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        mybutton(
                          title: "Log In",
                          onTap: () {
                            String email = controller.emailController.value.text;
                            String password =
                                controller.passwordController.value.text;
                            if (!Constant.validateEmail(email)) {
                              Fluttertoast.showToast(
                                  msg: 'Please enter valid email ');
                            } else if (password.length < 6) {
                              Fluttertoast.showToast(
                                  msg:
                                      'Password should be at least 6 characters long.');
                            } else {
                              controller.ApiSignInEmail(
                                  context: context,
                                  email: email,
                                  password: password);
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
                              Get.toNamed(Routes.SIGN_UP);
                              print("hello");
                            },
                            title: "Sign Up",
                            textStyle: text600_16white.copyWith(
                                color: AppColor.darkGrey),
                            backgroundColor: AppColor.white,
                            borderColor: AppColor.buttonGrey),

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
