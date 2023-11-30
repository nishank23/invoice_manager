import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/global/constants/app_fonts.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/widgets/mytextfiled.dart';
import '../../../routes/app_pages.dart';
import '../../bottomsheet/controllers/bottomsheet_controller.dart';
import '../../bottomsheet/views/bottomsheet_view.dart';
import '../controllers/estimated_controller.dart';

class EstimatedView extends GetView<EstimatedController> {
  const EstimatedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EstimatedController());
    return WillPopScope(
      onWillPop: () {
        Get.offAllNamed(Routes.HOME);
        final bottomsheetController = Get.put(BottomsheetController());
        bottomsheetController.selected_index.value = 0;
        return Future.value(false);
      },
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryBlue,
            elevation: 0,
            onPressed: () {
              Get.toNamed(Routes.CREATE_ESTIMATED);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColor.white,
          extendBody: true,
          body: FocusDetector(
            onFocusGained: () {
              controller.ApiGetAllEstimate(context: context);
            },
            child: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
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
                            "Estimated",
                            style: text700_18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 46.h,
                          width: 46.h,
                          child: SvgPicture.asset(
                            AppAsset.filterIcon,
                          ),
                        ),
                      ),
                    ],
                  ).marginSymmetric(horizontal: 20.h),
                  Divider(
                    height: 20.h,
                  ),
                  mySearchFiled(
                    texthint: "Search estimates...",
                    height: 56.h,
                    controller: controller.searchController.value,
                    onChanged: (value) {},
                  ).paddingSymmetric(horizontal: 20.h),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(
                    () => Visibility(
                      visible: !controller.isLoading.value,
                      replacement: const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primaryBlue,
                          ),
                        ),
                      ),
                      child: Expanded(
                        child: RefreshIndicator(
                          color: AppColor.primaryBlue,
                          onRefresh: () {
                            controller.ApiGetAllEstimate(context: context);

                            return Future.delayed(const Duration(seconds: 3));
                          },
                          child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(
                                parent: BouncingScrollPhysics()),
                            padding: EdgeInsets.symmetric(horizontal: 20.w)
                                .copyWith(bottom: 70.h),
                            itemCount: controller.myEstimatelist.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var data = controller.myEstimatelist[index];
                              return InkWell(
                                splashColor: AppColor.searchgrey,
                                highlightColor: AppColor.searchgrey,
                                // overlayColor: MaterialStatePropertyAll(Colors.red),

                                borderRadius: BorderRadius.circular(20.r),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          insetPadding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          actions: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .8,
                                              child: Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      const SizedBox(),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "Estimated",
                                                          style: text700_18,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: const Icon(
                                                              Icons.close),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 12.w,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.w,
                                                            vertical: 16.h),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColor.searchgrey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          AppAsset
                                                              .clientsPersonFillIcon,
                                                          height: 50.h,
                                                          width: 50.w,
                                                        ),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        Text(
                                                          data.client!.company!
                                                              .personName
                                                              .toString(),
                                                          style: text400_16grey
                                                              .copyWith(
                                                                  color: const Color(
                                                                      0xff1D1B20)),
                                                        ),
                                                        const Spacer(),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.h),
                                                          decoration: BoxDecoration(
                                                              color: const Color(
                                                                  0x0C663CEF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.r)),
                                                          child: Text(
                                                            '#${data.estimationNo}',
                                                            style: text300_15,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 16.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                  height: 50.h,
                                                                  decoration: BoxDecoration(
                                                                      color: AppColor
                                                                          .primaryBlueLight,
                                                                      borderRadius:
                                                                          BorderRadius.circular(12
                                                                              .r)),
                                                                  child:
                                                                      Transform
                                                                          .scale(
                                                                    scale: .4,
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      AppAsset
                                                                          .printIcon,
                                                                    ),
                                                                  )),
                                                            ),
                                                            SizedBox(
                                                              width: 8.w,
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                height: 50.h,
                                                                decoration: BoxDecoration(
                                                                    color: AppColor
                                                                        .primaryBlueLight,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.r)),
                                                                child: Transform
                                                                    .scale(
                                                                  scale: .4,
                                                                  child: SvgPicture
                                                                      .asset(AppAsset
                                                                          .shareIcon),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 8.w,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          height: 50.h,
                                                          decoration: BoxDecoration(
                                                              color: AppColor
                                                                  .primaryBlueLight,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.r)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                  AppAsset
                                                                      .downloadIcon),
                                                              SizedBox(
                                                                width: 8.w,
                                                              ),
                                                              Text(
                                                                "Download",
                                                                style:
                                                                    text600_16blue,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 16.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: mybutton(
                                                              onTap: () {
                                                                Get.back();

                                                                Get.toNamed(
                                                                    Routes
                                                                        .CREATE_ESTIMATED,
                                                                    arguments:
                                                                        data.id);
                                                              },
                                                              title: "Edit",
                                                              backgroundColor:
                                                                  Colors.white,
                                                              borderColor:
                                                                  const Color(
                                                                      0x4C97A1B1),
                                                              textStyle: text400_16grey
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .black))),
                                                      SizedBox(
                                                        width: 8.w,
                                                      ),
                                                      Expanded(
                                                          child: mybutton(
                                                              onTap: () {},
                                                              title:
                                                                  "Yes, Delete",
                                                              textStyle: text400_14
                                                                  .copyWith(
                                                                      color: AppColor
                                                                          .white),
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFFFF8080)))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ).paddingAll(20.h)
                                          ],
                                        );
                                      });
                                },
                                focusColor: AppColor.searchgrey,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 16.h),
                                  decoration: const BoxDecoration(
                                      // color: AppColor.searchgrey,

                                      ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppAsset.clientsPersonFillIcon,
                                        height: 50.h,
                                        width: 50.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            data.client!.company!.personName
                                                .toString(),
                                            style: text400_16grey.copyWith(
                                                color: const Color(0xff1D1B20)),
                                          ),
                                          SizedBox(
                                            height: 9.h,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  "${data.currency} ${data.totalAmount!.abs().toStringAsFixed(0)} • ",
                                                  style: text600_16.copyWith(
                                                      color: Colors.black)),
                                              Text(
                                                  controller.convertDateFormat(
                                                      data.estimationDate!),
                                                  style: text400_13grey),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: EdgeInsets.all(8.h),
                                        decoration: BoxDecoration(
                                            color: const Color(0x0C663CEF),
                                            borderRadius:
                                                BorderRadius.circular(5.r)),
                                        child: Text(
                                          '#${data.estimationNo}',
                                          style: text300_15,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          )),
    );
  }
}
