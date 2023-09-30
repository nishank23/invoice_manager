import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../global/constants/app_asset.dart';
import '../../../../global/constants/app_color.dart';
import '../../../../global/widgets/myButton.dart';
import '../../../../global/widgets/mytextfiled.dart';
import '../../controllers/add_new_client_controller.dart';
import '../controllers/clt_business_info_controller.dart';

class CltBusinessInfoView extends GetView<CltBusinessInfoController> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

   CltBusinessInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CltBusinessInfoController());
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(right: 20.h, left: 20.h),
        reverse: false,
        child: Form(
          key: formKey,
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 90.w,
              height: 102.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: DottedBorder(
                      dashPattern: const [5, 5, 5, 5],
                      borderType: BorderType.RRect,
                      color: AppColor.primaryBlue,
                      radius: const Radius.circular(60),
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(
                        width: 90.w,
                        height: 90.h,
                      ),
                    ),
                  ),
                  GetBuilder<CltBusinessInfoController>(
                      builder: (controller) {
                        return Positioned(
                          left: 5,
                          top: 5,
                          child: SizedBox(
                            width: 80.w,
                            height: 80.h,
                            child:
                            controller.selectedPhoto == null
                                ? Image.asset(AppAsset.defaultProfileIcon)
                                : Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: ClipOval(
                                child: Image.file(
                                  controller.selectedPhoto!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        controller.updateClientPhoto();
                      },
                      child: Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF1D1B20),
                          shape: OvalBorder(
                            side: BorderSide(width: 0.50, color: Colors.white),
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: SvgPicture.asset(
                              AppAsset.ProfileCamera,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            MyTextFiled(
              lableText: "Company name",
              controller: controller.companyNameController.value,
              onValidator: (value) {
                if (value!.isEmpty) {
                  return "Please enter Company Name";
                }
                return null;
              },
              prefixIcon: Icon(Icons.apartment_outlined,
                  color: AppColor.filedIcon, size: 22.25.w),
            ),
            SizedBox(
              height: 16.h,
            ),
            MyTextFiled(
              lableText: "Owner name",
              controller: controller.ownerNameController.value,
              onValidator: (value) {
                if (value!.toString().isEmpty) {
                  return "Name can't be empty";
                }
                return null;
              },
              prefixIcon: Icon(Icons.person_outline_rounded,
                  color: AppColor.filedIcon, size: 22.25.w),
            ),
            SizedBox(
              height: 16.h,
            ),
            Obx(
                  () => MyTextFiled(
                lableText: "Mobile number",
                keyboardType: TextInputType.phone,
                maxLength: 10,
                controller: controller.mobileNumberController.value,
                onValidator: (value) {
                  final mobileNumber =
                      controller.alterMobileNumberController.value.text;
                  if (value == mobileNumber) {
                    return "Mobile number should be different from the alternative mobile number";
                  } else if (value!.contains(RegExp(r'[^0-9]'))) {
                    return "Only numbers are allowed";
                  } else if (value.length < 10) {
                    return "Mobile number must be at least 10 digits";
                  }
                  return null;
                },
                prefixIcon: Transform.scale(
                  scale: 17.h / 53.h,
                  child: SvgPicture.asset(
                    AppAsset.callIcon,
                    color: AppColor.filedIcon,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            MyTextFiled(
              lableText: "Alternative mobile number",
              keyboardType: TextInputType.phone,
              maxLength: 10,
              controller: controller.alterMobileNumberController.value,
              onValidator: (value) {
                final mobileNumber =
                    controller.mobileNumberController.value.text;

                if (value == mobileNumber) {
                  return "Alternative mobile number should be different from the mobile number";
                } else if (value!.isNotEmpty &&
                    (value.contains(RegExp(r'[^0-9]')) || value.length < 10)) {
                  return "Alternative mobile number must be at least 10 digits";
                }
                return null;
              },
              prefixIcon: Transform.scale(
                scale: 17.h / 53.h,
                child: SvgPicture.asset(
                  AppAsset.callIcon,
                  color: AppColor.filedIcon,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            MyTextFiled(
              lableText: "GST/TAX number",
              controller: controller.gstController.value,
              maxLength: 15,
              onValidator: (value) {
                if (value!.isNotEmpty && value.length < 15) {
                  return "GST/TAX number must be at least 15 characters";
                }
                return null;
              },
              prefixIcon: Icon(Icons.pin_outlined,
                  color: AppColor.filedIcon, size: 22.25.w),
            ),
            SizedBox(
              height: 16.h,
            ),
            MyTextFiled(
              lableText: "Business email",
              controller: controller.businessEmailController.value,
              onValidator: (value) {
                if (value!.toString().isEmpty &&
                    !GetUtils.isEmail(value.trim())) {
                  return "Please enter a valid email";
                }
                return null;
              },
              prefixIcon: Icon(Icons.mail_outline,
                  color: AppColor.filedIcon, size: 22.25.w),
            ),
            SizedBox(
              height: 16.h,
            ),
            MyTextFiled(
              lableText: "Business website",
              controller: controller.businessWebsiteController.value,
              onValidator: (value) {
                if (value!.isNotEmpty && !GetUtils.isURL(value.trim())) {
                  return "Please enter a valid website URL";
                }
                return null;
              },
              prefixIcon: Icon(Icons.language_outlined,
                  color: AppColor.filedIcon, size: 22.25.w),
            ),
            SizedBox(
              height: 27.h,
            ),
            GetBuilder<CltBusinessInfoController>(
              builder: (controller) {
                return mybutton(
                  onTap: () {

                      AddNewClientController mycontroller = Get.find();

                      if (formKey.currentState!.validate()) {
                        mycontroller.tabController!
                            .animateTo(1, curve: Curves.easeInOutQuint);
                      }


                    // tabsController.screens[1];
                  },
                  title: "Next",
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
