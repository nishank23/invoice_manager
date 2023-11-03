import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/global/constants/app_color.dart';

import '../../../../main.dart';
import '../../../global/constants/app_fonts.dart';
import '../../../global/constants/constants.dart';
import '../../../routes/app_pages.dart';
import '../../AddressInfo/views/address_info_view.dart';
import '../../BankInfo/views/bank_info_view.dart';
import '../../BusinessInfo/views/business_info_view.dart';
import '../../bottomsheet/controllers/bottomsheet_controller.dart';
import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () {
          Get.offAllNamed(Routes.HOME);
          final bottomsheetController = Get.put(BottomsheetController());
          bottomsheetController.selectedIndex.value = 0;
          return Future.value(false);
        },
        child: SafeArea(
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (box.read(Constant.isProfileUpdated) != null ||
                                box.read(Constant.isProfileUpdated) == false) {
                              Get.offAllNamed(Routes.HOME);
                              final bottomsheetController =
                                  Get.put(BottomsheetController());
                              bottomsheetController.selectedIndex.value = 0;
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please update your profile first");
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(16.48.w),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffF8F9FA),
                            ),
                            child: Icon(
                              Icons.close,
                              size: 13.h,
                              color: AppColor.darkGrey,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xffF8F9FA),
                            ),
                            child: Text.rich(
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
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 20.h,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Obx(
                  () => SizedBox(
                    height: 45.h,
                    child: Stack(
                      children: [
                        TabBar(
                          splashBorderRadius: BorderRadius.circular(5.r),
                          unselectedLabelStyle: text300_16grey,
                          labelStyle: text500_16black,
                          unselectedLabelColor:
                              AppColor.hintTextGrey.withOpacity(.6),
                          controller: controller.tabController,
                          tabs: controller.myTabs,
                          labelColor: AppColor.darkGrey,
                          indicatorColor: AppColor.primaryBlue,
                          dividerColor: Colors.brown,
                          isScrollable: false,
                        ),
                        const Align(
                          alignment: Alignment.bottomCenter,
                          child: Divider(
                            height: 0,
                            thickness: 1,
                            color: AppColor.dividerGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.tabController,
                    children: [
                      GetBuilder<TabsController>(
                        builder: (_) => BusinessInfoView(false),
                        init: controller,
                      ),
                      GetBuilder<TabsController>(
                        builder: (_) => AddressInfoView(
                          isAdded: false.obs,
                        ),
                        init: controller,
                      ),
                      GetBuilder<TabsController>(
                        builder: (_) => BankInfoView(),
                        init: controller,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
