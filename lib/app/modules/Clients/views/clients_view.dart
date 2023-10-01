import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../../../global/widgets/mytextfiled.dart';
import '../../../routes/app_pages.dart';
import '../../bottomsheet/controllers/bottomsheet_controller.dart';
import '../../bottomsheet/views/bottomsheet_view.dart';
import '../controllers/clients_controller.dart';

class ClientsView extends GetView<ClientsController> {
  const ClientsView({Key? key}) : super(key: key);

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
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryBlue,
            elevation: 0,
            onPressed: () {
              Get.toNamed(Routes.ADD_NEW_CLIENT);
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
              controller.ApiGetAllClients(context: context);
            },
            child: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                enableDrag: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
                                backgroundColor: Colors.transparent,
                                context: context,
                                isScrollControlled: true,
                                isDismissible: true,
                                builder: (context) {
                                  // final Bcontroller = Get.put(BottomsheetController());
                                  //
                                  // Bcontroller.selected_index.value = 1;

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
                              "Clients",
                              style: text700_18,
                            ),
                          ),
                        ),
                        Expanded(
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
                    ),
                  ),
                  Divider(
                    height: 20.h,
                  ),
                  mySearchFiled(
                    texthint: "Search estimates...",
                    height: 56.h,
                    controller: controller.searchController.value,
                    onChanged: (value) {
                      controller.searchClients(value);
                    },
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
                            controller.ApiGetAllClients(context: context);
                            return Future.delayed(const Duration(seconds: 3));
                          },
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                            padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(bottom: 70.h),
                            itemCount: controller.filteredList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: AppColor.searchgrey,
                                highlightColor: AppColor.searchgrey,
                                // overlayColor: MaterialStatePropertyAll(Colors.red),

                                borderRadius: BorderRadius.circular(20.r),
                                onTap: () {
                                  print("apjdf");
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          insetPadding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          actions: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * .8,
                                              child: Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      const SizedBox(),
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Estimated",
                                                          style: text700_18,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment.topRight,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: const Icon(Icons.close),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 12.w,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                                                    decoration: BoxDecoration(
                                                      color: AppColor.searchgrey,
                                                      borderRadius: BorderRadius.circular(20.r),
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
                                                        Text(
                                                          controller.filteredList[index].company!.personName.toString(),
                                                          style:
                                                              text400_16grey.copyWith(color: const Color(0xff1D1B20)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 16.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: mybutton(
                                                              onTap: () {
                                                                print("IDDDDD ${controller.filteredList[index].id}");
                                                                Get.back();

                                                                Get.toNamed(Routes.ADD_NEW_CLIENT,
                                                                    arguments: controller.filteredList[index].id);
                                                              },
                                                              title: "Edit",
                                                              backgroundColor: Colors.white,
                                                              borderColor: const Color(0x4C97A1B1),
                                                              textStyle: text400_16grey.copyWith(color: Colors.black))),
                                                      SizedBox(
                                                        width: 8.w,
                                                      ),
                                                      Expanded(
                                                          child: mybutton(
                                                              onTap: () {},
                                                              title: "Yes, Delete",
                                                              textStyle: text400_14.copyWith(color: AppColor.white),
                                                              backgroundColor: const Color(0xFFFF8080)))
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
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.filteredList[index].company!.personName.toString(),
                                            style: text400_16grey.copyWith(color: const Color(0xff1D1B20)),
                                          ),
                                          SizedBox(
                                            height: 9.h,
                                          ),
                                          Text(
                                            controller.filteredList[index].company!.mobileNumber.toString(),
                                            style: text400_13grey.copyWith(color: const Color(0xff758090)),
                                          ),
                                        ],
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
