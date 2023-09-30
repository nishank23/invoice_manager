import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';
import 'package:invoice_generator/app/global/widgets/mytextfiled.dart';

import '../../../global/constants/api_const.dart';
import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../../../routes/app_pages.dart';
import '../../bottomsheet/controllers/bottomsheet_controller.dart';
import '../../bottomsheet/views/bottomsheet_view.dart';
import '../controllers/my_products_controller.dart';

class MyProductsView extends GetView<MyProductsController> {
  const MyProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyProductsController());

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
            Get.toNamed(Routes.CREATE_PRODUCTS);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColor.white,
        extendBody: false,
        body: FocusDetector(
          onFocusGained: () {
            controller.ApiGetAllProducts(context: context);
          },
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
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
                            "My Products",
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
                    texthint: "Search products...",
                    height: 56.h,
                    controller: controller.searchController,
                    onChanged: (value) {
                      controller.searchProducts(value);
                    },
                  ).marginSymmetric(horizontal: 20.h),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: Obx(
                      () => RefreshIndicator(
                        onRefresh: () {
                          controller.ApiGetAllProducts(context: context);
                          return Future.delayed(const Duration(seconds: 3));
                        },
                        child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              String? image;
                              if (controller
                                  .filteredList[i].images!.isNotEmpty) {
                                image = controller.filteredList[i].images![0];
                              }

                              return Container(
                                padding: EdgeInsets.all(16.h),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8F9FA),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(children: [
                                  Row(children: [
                                    Container(
                                      width: 45.w,
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: image != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.network(
                                                ibaseURL + image.toString(),
                                                fit: BoxFit.fill,
                                              ))
                                          : Container(),
                                    ),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.filteredList[i].name
                                                  .toString(),
                                              style: text400_14,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              controller
                                                  .filteredList[i].description
                                                  .toString(),
                                              style: text400_13grey,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              controller.filteredList[i]
                                                      .currencySymbol
                                                      .toString() +
                                                  controller
                                                      .filteredList[i].price
                                                      .toString(),
                                              style: text500_16black.copyWith(
                                                  fontSize: 18),
                                            )
                                          ]).paddingSymmetric(horizontal: 8),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: mybutton(
                                            height: 50.h,
                                            onTap: () {
                                              Map<String, dynamic> myEdit =
                                                  Map();
                                              myEdit["id"] = controller
                                                  .filteredList[i].id
                                                  .toString();
                                              myEdit["isEdit"] = true;
                                              Get.toNamed(
                                                  Routes.CREATE_PRODUCTS,
                                                  arguments: myEdit);
                                            },
                                            title: "Edit",
                                            textStyle: text400_14,
                                            backgroundColor: AppColor.white),
                                      ),
                                      SizedBox(
                                        width: 8.h,
                                      ),
                                      Expanded(
                                        child: mybutton(
                                            height: 50.h,
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      insetPadding: EdgeInsets.zero,

                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      actions: [
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width*.8,
                                                          child: Column(
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  const SizedBox(),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      "Delete",
                                                                      style:
                                                                          text700_18,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child: const Icon(
                                                                          Icons
                                                                              .close),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 15.h,
                                                              ),
                                                              SvgPicture.asset(
                                                                  AppAsset
                                                                      .deleteIcon),
                                                              SizedBox(
                                                                height: 15.h,
                                                              ),
                                                              Text(
                                                                "Are you sure! Want  to delete?",
                                                                style:
                                                                    text700_18,
                                                              ),
                                                              SizedBox(
                                                                height: 16.h,
                                                              ),
                                                              Text(
                                                                "Do you really want to delete these records?\nYou can't view this in your list anymore if you delete!",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    text300_16grey,
                                                              ),
                                                              SizedBox(
                                                                height: 15.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                      child: mybutton(
                                                                          onTap: () {
                                                                            Get.back();
                                                                          },
                                                                          title: "Cancel",
                                                                          backgroundColor: Colors.white,
                                                                          borderColor: const Color(0x4C97A1B1),
                                                                          textStyle: text400_16grey.copyWith(color: Colors.black))),
                                                                  SizedBox(
                                                                    width: 8.w,
                                                                  ),
                                                                  Expanded(
                                                                      child: mybutton(
                                                                          onTap: () {
                                                                            controller.ApiDeleteProduct(
                                                                                context: context,
                                                                                productId: controller.filteredList![i].id.toString());
                                                                          },
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
                                            title: "Delete",
                                            textStyle: text400_14.copyWith(
                                                color: AppColor.white),
                                            backgroundColor:
                                                const Color(0xFFFF8080)),
                                      ),
                                    ],
                                  )
                                ]),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 16.h,
                                ),
                            itemCount: controller.filteredList.length),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
