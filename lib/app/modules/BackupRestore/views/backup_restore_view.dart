import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/global/widgets/TitleWidget.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../../../routes/app_pages.dart';
import '../../bottomsheet/controllers/bottomsheet_controller.dart';
import '../../bottomsheet/views/bottomsheet_view.dart';
import '../controllers/backup_restore_controller.dart';

class BackupRestoreView extends GetView<BackupRestoreController> {
  const BackupRestoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offAllNamed(Routes.HOME);
        final bottomsheetController = Get.put(BottomsheetController());
        bottomsheetController.selected_index.value = 0;
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.white,
        extendBody: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            enableDrag: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.r),
                                    topRight: Radius.circular(30.r))),
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            isDismissible: true,
                            builder: (context) {
                              return const BottomsheetView();
                            },
                          );
                        },
                        child: Container(
                          height: 46.h,
                          width: 46.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.profileBlue,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Text(
                          "Backup & Restore",
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
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0x4C758090)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(children: [
                    myTitleWidget(title: "Backup"),
                    SizedBox(
                      height: 16.h,
                    ),
                    SvgPicture.asset(AppAsset.Backup),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'To backup your invoices,\nplease click on',
                              style: text300_16grey),
                          TextSpan(
                              text: ' “Backup” ',
                              style:
                                  text600_16.copyWith(color: AppColor.black)),
                          TextSpan(text: 'button', style: text300_16grey),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    mybutton(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                insetPadding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                content: SizedBox(
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(AppAsset.Backup),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text(
                                          'Are you sure?',
                                          textAlign: TextAlign.center,
                                          style: text700_18,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                            'Are you sure, You want to backup\nyour invoice?',
                                            textAlign: TextAlign.center,
                                            style: text300_16black.copyWith(
                                                color:
                                                    const Color(0xFF758090))),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: mybutton(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                title: "Not Now",
                                                textStyle: text600_16.copyWith(
                                                    color: AppColor.black),
                                                backgroundColor: AppColor.white,
                                                borderColor:
                                                    const Color(0x4C97A1B1),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                                child: mybutton(
                                                    onTap: () {
                                                      Get.offNamed(
                                                          Routes.BACKUP);
                                                    },
                                                    title: "Yes, Backup"))
                                          ],
                                        )
                                      ]),
                                ),
                              );
                            },
                          );
                        },
                        title: "Start Backup")
                  ]),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0x4C758090)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(children: [
                    myTitleWidget(title: "Restore"),
                    SizedBox(
                      height: 16.h,
                    ),
                    SvgPicture.asset(AppAsset.Restore),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  'To restore your invoices,\nplease click on',
                              style: text300_16grey),
                          TextSpan(
                              text: ' “Restore” ',
                              style:
                                  text600_16.copyWith(color: AppColor.black)),
                          TextSpan(text: 'button', style: text300_16grey),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    mybutton(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                insetPadding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                content: SizedBox(
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(AppAsset.Restore),
                                      SizedBox(height: 16.h),
                                      Text(
                                        'Are you sure?',
                                        textAlign: TextAlign.center,
                                        style: text700_18,
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        'Are you sure you want to restore\nyour invoice?',
                                        textAlign: TextAlign.center,
                                        style: text300_16black.copyWith(
                                          color: const Color(0xFF758090),
                                        ),
                                      ),
                                      SizedBox(height: 12.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: mybutton(
                                              onTap: () {
                                                Navigator.pop(
                                                    context); // Close the dialog
                                              },
                                              title: "Not Now",
                                              textStyle: text600_16.copyWith(
                                                  color: AppColor.black),
                                              backgroundColor: AppColor.white,
                                              borderColor:
                                                  const Color(0x4C97A1B1),
                                            ),
                                          ),
                                          SizedBox(width: 8.w),
                                          Expanded(
                                            child: mybutton(
                                              onTap: () {
                                                Navigator.pop(
                                                    context); // Close the dialog
                                                Get.offNamed(Routes.RESTORE);
                                              },
                                              title: "Yes, Restore",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        title: "Start Restore")
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
