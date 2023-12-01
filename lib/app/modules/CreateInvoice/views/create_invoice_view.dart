import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';

import 'package:get/get.dart';

import '../controllers/create_invoice_controller.dart';

class CreateInvoiceView extends GetView<CreateInvoiceController> {
  const CreateInvoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CreateInvoiceController());
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      extendBody: false,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 2,
                    child: Align(alignment: Alignment.centerLeft,
                      child:InkWell(
                      onTap: () => Get.back(),
                      borderRadius: BorderRadius.circular(100.r),
                      child:  Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(AppAsset.backIcon),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 5,
                    child: Center(
                      child: Text(
                        controller.id!=null?"Edit Invoice":"Create Invoice" ,
                        style: text700_18,
                      ),
                    ),
                  ),
                  Expanded(flex: 2,
                    child: Align(alignment: Alignment.centerRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                        decoration: BoxDecoration(
                            color: AppColor.primaryBlue.withOpacity(.05)),
                        child: Text(
                          "#${controller.estimateNo.value}",
                          style: text300_14.copyWith(color: AppColor.primaryBlue),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => SizedBox(
                child: EasyStepper(
                  activeStep: controller.activeStep.value,
                  lineLength: 75.h,
                  lineThickness: .5,
                  lineSpace: 0,
                  lineType: LineType.normal,
                  defaultLineColor: AppColor.stepGrey,
                  finishedLineColor: AppColor.primaryBlue,
                  steppingEnabled: true,
                  showTitle: true,
                  internalPadding: 0,
                  showLoadingAnimation: false,
                  stepRadius: 12,
                  showStepBorder: false,
                  steps: [
                    EasyStep(
                      customStep: controller.activeStep.value >= 1
                          ? CircleAvatar(
                        radius: 14.r,
                        backgroundColor:
                        controller.activeStep.value >= 0
                            ? AppColor.primaryBlue
                            : Colors.white,
                        child: const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        ),
                      )
                          : Icon(Icons.radio_button_checked,
                          color: controller.activeStep.value >= 0
                              ? AppColor.primaryBlue
                              : Colors.white,
                          size: 26),
                      customTitle: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('ADD CLIENT',
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            softWrap: false,
                            overflow: TextOverflow.visible,
                            style: controller.activeStep.value != 0
                                ? text300_14.copyWith(
                                color: AppColor.darkGrey)
                                : text500_13black.copyWith(
                                color: AppColor.black)),
                      ),
                    ),
                    EasyStep(
                      enabled: false,
                      customStep: controller.activeStep.value >= 2
                          ? CircleAvatar(
                        radius: 14.r,
                        backgroundColor:
                        controller.activeStep.value >= 0
                            ? AppColor.primaryBlue
                            : Colors.white,
                        child: const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        ),
                      )
                          : controller.activeStep.value > 0
                          ? Icon(Icons.radio_button_checked,
                          color: controller.activeStep.value >= 0
                              ? AppColor.primaryBlue
                              : Colors.white,
                          size: 26.h)
                          : Container(
                        height: 21.h,
                        width: 21.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.stepGrey),
                            shape: BoxShape.circle),
                      ),
                      customLineWidget: Container(
                        color: Colors.pink,
                        height: 1,
                      ),
                      customTitle: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('ADDRESS',
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            softWrap: false,
                            overflow: TextOverflow.visible,
                            style: controller.activeStep.value != 1
                                ? text300_14.copyWith(
                                color: AppColor.darkGrey)
                                : text500_13black.copyWith(
                                color: AppColor.black)),
                      ),
                    ),
                    EasyStep(
                      enabled: false,
                      customStep: controller.activeStep.value >= 3
                          ? CircleAvatar(
                        radius: 14.r,
                        backgroundColor:
                        controller.activeStep.value >= 1
                            ? AppColor.primaryBlue
                            : Colors.white,
                        child: const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                            ),
                          )
                          : controller.activeStep.value > 1
                          ? Icon(Icons.radio_button_checked,
                          color: controller.activeStep.value >= 2
                              ? AppColor.primaryBlue
                              : Colors.white,
                          size: 26.h)
                          : Container(
                        height: 21.h,
                        width: 21.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.stepGrey),
                            shape: BoxShape.circle),
                      ),
                      customLineWidget: Container(
                        color: Colors.pink,
                        height: 1,
                      ),
                      customTitle: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('ADD ITEMS',
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            softWrap: false,
                            overflow: TextOverflow.visible,
                            style: controller.activeStep.value != 2
                                ? text300_14.copyWith(
                                color: AppColor.steptextGrey)
                                : text500_13black.copyWith(
                                color: AppColor.black)),
                      ),
                    ),
                    EasyStep(
                      enabled: false,

                      customStep: controller.activeStep.value > 2
                          ? Icon(Icons.radio_button_checked,
                          color: controller.activeStep.value >= 3
                              ? AppColor.primaryBlue
                              : Colors.white,
                          size: 26.h)
                          : Container(
                        height: 21.h,
                        width: 21.w,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: AppColor.stepGrey),
                            shape: BoxShape.circle),
                      ),
                      customLineWidget: Container(
                        color: Colors.pink,
                        height: 1,
                      ),
                      customTitle: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('ADD SIGN',
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            softWrap: false,
                            overflow: TextOverflow.visible,
                            style: controller.activeStep.value != 3
                                ? text300_14.copyWith(
                                color: AppColor.steptextGrey)
                                : text500_13black.copyWith(
                                color: AppColor.black)),
                      ),
                    ),
                  ],
                  onStepReached: (index) {
                    controller.updateActive(index);
                  },
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller.pageController,
/*
                physics: const NeverScrollableScrollPhysics(),
*/
                onPageChanged: (value) {
                  controller.updateActive(value);
                },
                children: controller.pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
