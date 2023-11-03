import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/constants/app_color.dart';
import '../controllers/backup_controller.dart';

class BackupView extends GetView<BackupController> {
  const BackupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*
        backgroundColor: Colors.grey,
*/
        body:myBubbles()); /*SafeArea(
            child: Column(
          children: [



            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Get.back(),
                    borderRadius: BorderRadius.circular(100.r),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(AppAsset.backIcon),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      "Backup",
                      style: text700_18,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 46.h,
                    width: 46.h,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 16.h),
            Divider(
              height: 0,
            ),
            SizedBox(
              height: 192.h,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '9', style: text400_65),
                  TextSpan(text: ' %', style: text300_16grey),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              "Backup in progress...",
              style: text400_25,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Do not restart or turn off the phone. as invoice mat be lost or damage if you do so.',
              textAlign: TextAlign.center,
              style: text300_16grey,
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              padding: EdgeInsets.all(16.sp),
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0x0C663CEF)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(
                children: [
                  Container(
                      width: 50.h,
                      height: 50.h,
                      padding: EdgeInsets.all(12.sp),
                      decoration: ShapeDecoration(
                        color: AppColor.primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: SvgPicture.asset(
                        AppAsset.InvoicesIcon,
                        color: AppColor.white,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Invoices",
                        style: text400_18,
                      ),
                      SizedBox(
                        height: 6.5.w,
                      ),
                      Text(
                        "23/1476",
                        style: text400_13grey,
                      )
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            mybutton(
              onTap: () {},
              title: "Stop Backup",
              textStyle: text600_16.copyWith(color: AppColor.primaryBlue),
              backgroundColor: AppColor.white,
              borderColor: AppColor.primaryBlue,
            ).paddingSymmetric(horizontal: 20.w),
            SizedBox(
              height: 20,
            ),
          ],
        )));*/
  }

  Stack myBubbles() {
    return Stack(children: [
      Positioned.fill(
        child: Container(
          color: Colors.white,
        ),
      ),
      Positioned.fill(
          child: FloatingBubbles.alwaysRepeating(
        noOfBubbles: 10,
        colorsOfBubbles: const [
          AppColor.primaryBlue,
        ],

        sizeFactor: 0.055,
        opacity: 40,
        paintingStyle: PaintingStyle.fill,
        shape: BubbleShape.circle,
        speed: BubbleSpeed.normal,
      )),Positioned.fill(
          child: FloatingBubbles.alwaysRepeating(
        noOfBubbles: 10,

        colorsOfBubbles: const [
          AppColor.primaryBlue,
        ],

        sizeFactor: 0.035,
        opacity: 255,
        paintingStyle: PaintingStyle.fill,
        shape: BubbleShape.circle,
        speed: BubbleSpeed.normal,
      )),
    ]);
  }
}
