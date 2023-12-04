import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/global/constants/app_asset.dart';

import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../controllers/add_new_client_controller.dart';

class AddNewClientView extends GetView<AddNewClientController> {
  const AddNewClientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddNewClientController());
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      extendBody: false,
      body: SafeArea(
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
                  Expanded(child:
                  InkWell(
                    onTap: () => Get.back(),
                    borderRadius: BorderRadius.circular(100.r),

                      child: Container(
                          padding: EdgeInsets.all(16.48.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: Colors.white,
                          ),
                          child: SvgPicture.asset(AppAsset.backIcon)),
                    ),
                  ),
                  Expanded(flex: 5,
                    child: Center(
                      child: Text(
                        controller.id !=null ? "Edit Client": "Add New Client",
                        style: text700_18,
                      ),
                    ),
                  ),

                  const Expanded(
                    child: SizedBox(
                      width: 50,

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
                      unselectedLabelColor: AppColor.hintTextGrey.withOpacity(.6),
                      controller: controller.tabController,
                      tabs: controller.myTabs.value,
                      onTap: (int index) => onTap(index),
                      labelColor: AppColor.darkGrey,
                      indicatorColor: AppColor.primaryBlue,
                      dividerColor: Colors.brown,
                      isScrollable: false,
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Divider(
                        height: 0,thickness: 1,
                        color: AppColor.dividerGrey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: TabBarView(
                    controller: controller.tabController,
                    children: controller.screens))
          ],
        ),
      ),
    );
  }
  void onTap(int index) {
    controller.tabController!.index = index == 1 ? controller.tabController!.previousIndex : index;

  }
}
