import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../../../global/widgets/my_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/bottomsheet_controller.dart';
import 'menu_item.dart';

class BottomsheetView extends GetView<BottomsheetController> {
  const BottomsheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomsheetController());
    return SafeArea(
      child: DraggableScrollableSheet(
        initialChildSize: 0.75,
        // expand: ,
        minChildSize: 0.60,
        maxChildSize: 0.75,
        builder: (BuildContext context, ScrollController scrollController) {
          return Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: scrollController,
                  child: Column(children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Center(
                      child: Container(
                        height: 3.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffD0D0D0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.h),
                            decoration: BoxDecoration(
                              color: const Color(0xffF8F9FA),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child:
                                Row(mainAxisSize: MainAxisSize.max, children: [
                              Container(
                                height: 50.h,
                                width: 50.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.profileBlue,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Obx(
                                () => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.companyName.value,
                                      style: text600_16.copyWith(
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      controller.userNo.value,
                                      style: text400_13grey,
                                    )
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: SizedBox(
                                width: 24.w, child: const Icon(Icons.close)))
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: controller.menuItems.length,
                      itemBuilder: (context, index) {
                        MenuItem menuItem = controller.menuItems[index];
                        return Obx(() => InkWell(
                              onTap: () {
                                controller.onTapped(index);
                                controller.menuItems[index].onTap();
                              },
                              borderRadius: BorderRadius.circular(10),
                              splashColor: AppColor.black.withOpacity(0.2),
                              highlightColor:
                                  AppColor.primaryBlue.withOpacity(.05),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: controller.selectedIndex.value == index
                                      ? AppColor.primaryBlue.withOpacity(.05)
                                      : Colors.transparent,
                                ),
                                child: ListTile(
                                  dense: true,
                                  //    selected: controller.selected_index == index,
                                  minVerticalPadding: 0,
                                  horizontalTitleGap: -5,
                                  //  selectedTileColor: Colors.black,
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  title: Text(
                                    menuItem.title,
                                    style: text400_16grey.copyWith(
                                      color: AppColor.black,
                                    ),
                                  ),

                                  leading:
                                      controller.selectedIndex.value == index
                                          ? menuItem.selectedIcon
                                          : menuItem.icon,
                                  // SvgPicture(
                                  //       menuItem.icon as BytesLoader ,
                                  //       color: controller.selected_index == index ? AppColor.primaryBlue : null,
                                  //       size:controller.selected_index == index? 20:18,
                                  // ),
                                ),
                              ),
                            ));
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    mybutton(
                        onTap: () {},
                        widget: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.diamond_outlined,
                              color: Colors.white,
                              size: 16.h,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "Premium",
                              style: text600_16white,
                            ),
                          ],
                        ),
                        backgroundColor: const Color(0xffEEBB4D)),
                    SizedBox(
                      height: 8.h,
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
                                        Text('Are you sure, You want to logout',
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
                                                      box.erase();
                                                      Get.offNamed(
                                                          Routes.LOGIN);
                                                    },
                                                    title: "Yes, Logout"))
                                          ],
                                        )
                                      ]),
                                ),
                              );
                            },
                          );
                        },
                        widget: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.black,
                              size: 16.h,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "Log Out",
                              style:
                                  text600_16white.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        borderColor: AppColor.buttonGrey,
                        backgroundColor: Colors.white),
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
