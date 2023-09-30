import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/global/widgets/TitleWidget.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';

import '../../../global/constants/app_color.dart';
import '../../../global/widgets/mytextfiled.dart';
import '../controllers/bank_info_controller.dart';

class BankInfoView extends GetView<BankInfoController> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  BankInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BankInfoController());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20.h,
            ),
            myTitleWidget(title: "Bank Details"),
            SizedBox(
              height: 20.h,
            ),
            MyTextFiled(
              controller: controller.bankNameController.value,
              lableText: "Bank name",
              prefixIcon: Icon(
                Icons.account_balance_outlined,
                color: AppColor.filedIcon,
                size: 22.25.w,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            MyTextFiled(
              controller: controller.accNumController.value,
              lableText: "Account number",
              prefixIcon: Icon(
                Icons.dialpad_outlined,
                color: AppColor.filedIcon,
                size: 22.25.w,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            MyTextFiled(
              controller: controller.reAccNumController.value,
              lableText: "Re-enter Account number",
              onValidator: (value) {
                if (value != controller.accNumController.value.text) {
                  return "Both account number need to be same";
                }
                return null;
              },
              prefixIcon: Icon(
                Icons.dialpad_outlined,
                color: AppColor.filedIcon,
                size: 22.25.w,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            MyTextFiled(
              controller: controller.ifscController.value,
              lableText: "IFSC code",
              prefixIcon: Icon(
                Icons.looks_one_outlined,
                color: AppColor.filedIcon,
                size: 22.25.w,
              ),
            ),
            const Spacer(),
            mybutton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    controller.submitProfileData(context);
                  }

/*
                  Get.offNamed(Routes.HOME);
*/
                },
                title: "Submit"),
            SizedBox(
              height: 26.h,
            )
          ]),
        ),
      ),
    );
  }
}
