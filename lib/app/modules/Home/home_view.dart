import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/global/constants/app_color.dart';
import 'package:invoice_generator/app/global/widgets/TitleWidget.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';
import 'package:invoice_generator/app/modules/bottomsheet/views/bottomsheet_view.dart';
import 'package:invoice_generator/app/modules/chart/app_chart.dart';

import '../../global/constants/app_asset.dart';
import '../../global/constants/app_fonts.dart';
import '../../routes/app_pages.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColor.white,
      extendBody: false,
      body: SafeArea(
        child: Column(children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(30.r),
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
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.ESTIMATE_PREVIEW);
                },
                child: SizedBox(
                  height: 46.h,
                  width: 46.h,
                  child: const Icon(
                    Icons.notifications_none_outlined,
                    size: 24,
                  ),
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 20.w),
          Divider(
            height: 20.h,
          ),
          myTitleWidget(title: "Dashboard").paddingSymmetric(horizontal: 20.w),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.lightGreen),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAsset.totalClients,
                              height: 40.h,
                              width: 40.w,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "Total Clients",
                              style:
                                  text600_16white.copyWith(color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(height: 11.h),
                        Text(
                          "3,642",
                          style: text500_25black,
                        ),
                        SizedBox(height: 12.5.h),
                        Text.rich(
                          TextSpan(
                            text: '2.37%',
                            style: text700_14,
                            children: <TextSpan>[
                              TextSpan(
                                text: " since last week  ",
                                style: text300_14,
                              ),
                            ],
                          ),
                        ),
                      ]),
                  Container(
                    height: 112.h,
                    width: 171.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.white),
                  )
                ]),
          ).paddingSymmetric(horizontal: 20.w),
          SizedBox(
            height: 16.h,
          ),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.lightred),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAsset.invoiceIcon,
                              height: 40.h,
                              width: 40.w,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "Invoices",
                              style:
                                  text600_16white.copyWith(color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(height: 11.h),
                        Text(
                          "1,041",
                          style: text500_25black,
                        ),
                        SizedBox(height: 12.5.h),
                        Text.rich(
                          TextSpan(
                            text: '3.77%',
                            style: text700_14,
                            children: <TextSpan>[
                              TextSpan(
                                text: " since last week  ",
                                style: text300_14,
                              ),
                            ],
                          ),
                        ),
                      ]),
                  Container(
                    height: 112.h,
                    width: 171.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.white),
                  )
                ]),
          ).paddingSymmetric(horizontal: 20.w),
        ]),
      ),
    );
  }
}
