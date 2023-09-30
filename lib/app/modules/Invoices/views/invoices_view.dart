import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';

import '../../../global/constants/app_fonts.dart';
import '../../bottomsheet/controllers/bottomsheet_controller.dart';
import '../controllers/invoices_controller.dart';
import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/widgets/mytextfiled.dart';
import '../../../routes/app_pages.dart';
import '../../bottomsheet/views/bottomsheet_view.dart';

class InvoicesView extends GetView<InvoicesController> {
  const InvoicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(InvoicesController());
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
              Get.toNamed(Routes.CREATE_INVOICE);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColor.white,
          extendBody: true,
          body: SafeArea(
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
                          "Invoices",
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
                  texthint: "Search invoice...",
                  height: 56.h,
                  controller: controller.searchController.value,
                  onChanged: (value) {},
                ).marginSymmetric(horizontal: 20.w),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20.w)
                        .copyWith(bottom: 70.h),
                    itemCount: 50,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: AppColor.searchgrey,
                        highlightColor: AppColor.searchgrey,
                        // overlayColor: MaterialStatePropertyAll(Colors.red),

                        borderRadius: BorderRadius.circular(20.r),
                        onTap: () {},
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Eugene L. Morris",
                                    style: text400_16grey.copyWith(
                                        color: const Color(0xff1D1B20)),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Row(
                                    children: [
                                      Text("₹ 1,748 •",
                                          style: text600_16.copyWith(
                                              color: Colors.black)),
                                      Text("19 Dec, 2022",
                                          style: text400_13grey),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 5.h),
                                    decoration: BoxDecoration(
                                        color: const Color(0x0C663CEF),
                                        borderRadius:
                                            BorderRadius.circular(5.r)),
                                    child: Text(
                                      '#EST1463',
                                      style: text300_15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 5.h),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: index.isEven
                                          ? const Color(0xFF5AA469)
                                          : const Color(0xFFEEBB4D),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    child: Text(
                                      index.isEven ? 'Paid' : "Unpaid",
                                      textAlign: TextAlign.center,
                                      style: text400_15blue.copyWith(
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
