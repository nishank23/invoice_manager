import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/global/widgets/image_picker_dialog.dart';
import 'package:invoice_generator/app/global/widgets/title_widget.dart';
import 'package:invoice_generator/app/global/widgets/my_button.dart';
import 'package:invoice_generator/app/global/widgets/mytextfiled.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';

import '../../../global/widgets/my_photo_view.dart';
import '../controllers/create_products_controller.dart';

class CreateProductsView extends GetView<CreateProductsController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CreateProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CreateProductsController);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      extendBody: true,
      body: SafeArea(
          child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      controller.title,
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
            Divider(
              height: 20.h,
            ),
            Expanded(
              child: ListView(
                children: [
                  myTitleWidget(title: "Product Details")
                      .marginOnly(left: 20.h, bottom: 7.h),
                  GetBuilder<CreateProductsController>(builder: (controller) {
                    return MyTextFiled(
                      controller: controller.productTitleController.value,
                      lableText: "Product title/name",
                      onValidator: (value) {
                        if (value.toString().isEmpty) {
                          return "Please enter product name";
                        }
                        return null;
                      },
                      prefixIcon: Transform.scale(
                          scale: 36.h / 53.h,
                          child: SvgPicture.asset(AppAsset.inventoryIcon)),
                    ).marginSymmetric(horizontal: 20.h);
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  GetBuilder<CreateProductsController>(builder: (controller) {
                    return MyTextFiled(
                      controller: controller.productPriceController.value,
                      lableText: "Product price",
                      onValidator: (value) {
                        if (value.toString().isEmpty) {
                          return "Price cant be empty";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      prefixIcon: Transform.scale(
                        scale: 36.h / 53.h,
                        child: SvgPicture.asset(AppAsset.paymentsIcon),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          controller.showCurrencyPicker(context);
                        },
                        child: Container(
                          width: 53,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF97A1B1),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12.r),
                                bottomRight: Radius.circular(
                                  12.r,
                                )),
                          ),
                          child: Obx(
                            () => Text(
                              controller.selectedCurrency.value,
                              style: text400_14,
                            ),
                          ),
                        ),
                      ),
                    ).marginSymmetric(horizontal: 20.h);
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  GetBuilder<CreateProductsController>(builder: (controller) {
                    return MyTextFiled(
                      controller: controller.productDescriptionController.value,
                      maxLines: 4,
                      lableText: "Product description",
                    ).marginSymmetric(horizontal: 20.h);
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(height: 20.h),
                  myTitleWidget(title: "Product Images").marginOnly(
                    left: 20.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16),
                    child: GetBuilder<CreateProductsController>(
                        builder: (controller) {
                      return InkWell(
                        onTap: () {
                          ImagePickerDialog.showMultiImagePickerDialog(
                            context,
                            onImagesSelected: (files) {
                              controller.imageFileList!.addAll(files);
                              controller.update();
                            },
                          );
                        },
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: const [6, 3],
                          color: AppColor.buttonBorderGrey,
                          radius: const Radius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(18.0),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF8F9FA),
                                borderRadius: BorderRadius.circular(20)),
                            width: double.infinity,
                            // height: MediaQuery.of(context).size.height * .13,
                            child: Column(
                              children: [
                                Text(
                                  "UPLOAD YOUR PRODUCT IMAGES HERE",
                                  style: text500_13black,
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  decoration: ShapeDecoration(
                                    color: AppColor.primaryBlue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  child: Text(
                                    "Browse",
                                    style: text400_14.copyWith(
                                        color: AppColor.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  GetBuilder<CreateProductsController>(builder: (controller) {
                    return Visibility(
                      visible: controller.imageFileList!.isNotEmpty,
                      child: SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: ListView.separated(
                          padding: EdgeInsets.all(20.h),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.imageFileList!.length,
                          //uploadedimagepath.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => MyPhotoView(
                                    imageUrl:
                                        controller.imageFileList![index]));
                              },
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      controller.imageFileList![index],
                                      width: 135,
                                      height: 180,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.imageFileList!
                                            .removeAt(index);
                                        controller.update();
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            size: 20,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 20,
                            );
                          },
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  mybutton(
                    onTap: () {
                      if (controller.selectedCurrency.value == "Select") {
                        Fluttertoast.showToast(
                            msg: "Please select Product Currency");
                        return;
                      }

                      if (formKey.currentState!.validate()) {
                        Map<String, Object> myformdata = {};

                        myformdata["name"] =
                            controller.productTitleController.value.text;
                        myformdata["price"] = int.parse(
                            controller.productPriceController.value.text);

                        myformdata["currencySymbol"] =
                            controller.selectedSymbol.value.toString();
                        myformdata["productCurrency"] =
                            controller.selectedCurrency.value.toString();
                        myformdata["description"] =
                            controller.productDescriptionController.value.text;

                        List<String> uploadFiles = [];
                        for (var file in controller.imageFileList!) {
                          uploadFiles.add(file.path);
                          log(file.path);
                        }

                        if (controller.isEdit) {
                          myformdata["_id"] = controller.mymap["id"];
                          controller.apiEditProduct(
                            context: context,
                            filePaths: uploadFiles,
                            formData: myformdata,
                          );
                        } else {
                          controller.apiAddProduct(
                            context: context,
                            filePaths: uploadFiles,
                            formData: myformdata,
                          );
                        }
                      }
                    },
                    title: controller.isEdit ? "Edit Product" : "Add Product",
                    horizontal: 20.h,
                  ).marginOnly(bottom: 30).paddingSymmetric(horizontal: 16)
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
