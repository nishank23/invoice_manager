// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/global/constants/app_asset.dart';
import 'package:invoice_generator/app/global/constants/app_fonts.dart';
import 'package:invoice_generator/app/global/widgets/image_picker_dialog.dart';
import 'package:invoice_generator/app/modules/CreateEstimated/est_add_client/controllers/est_add_client_controller.dart';

import '../../../../global/constants/app_color.dart';
import '../../../../global/widgets/title_widget.dart';
import '../../../../global/widgets/my_button.dart';
import '../../controllers/create_estimated_controller.dart';
import '../../est_add_items/controllers/est_add_items_controller.dart';
import '../controllers/est_add_sign_controller.dart';

class EstAddSignView extends GetView<EstAddSignController> {
  const EstAddSignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EstAddSignController());

    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(right: 20.h, left: 20.h),
          reverse: false,
          child: Column(children: [
            Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                child: myTitleWidget(title: "Upload Sign")),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              child: DottedBorder(
                strokeWidth: 1.5,
                dashPattern: const [8, 8, 8, 8],
                color: const Color(0xff758090),
                borderPadding: EdgeInsets.zero,
                radius: const Radius.circular(20),
                borderType: BorderType.RRect,
                child: Container(
                  width: double.infinity,
                  height: 110.h,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(18.r)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Upload your e-signature here".toUpperCase(),
                        style: text500_13black,
                      ),
                      GetBuilder<EstAddSignController>(builder: (controller) {
                        return SizedBox(
                            width: 100.w,
                            child: mybutton(
                                onTap: () {
                                  ImagePickerDialog.showSingleImagePickerDialog(
                                    context,
                                    onImageSelected: (p0) {
                                      controller.selectedSign = p0;

                                      controller.update();
                                      // controller.refresh();
                                    },
                                  );
                                },
                                title: "Browse"));
                      })
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GetBuilder<EstAddSignController>(builder: (controller) {
              return controller.selectedSign != null
                  ? Container(
                      width: double.infinity,
                      height: 170.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.buttonBorderGrey),
                          borderRadius: BorderRadius.circular(18.r)),
                      child: controller.selectedSign != null
                          ? Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      controller.selectedSign = null;
                                      controller.update();
                                      // controller.refresh();
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: SvgPicture.asset(
                                            AppAsset.closeSign)),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 24, horizontal: 40),
                                      child: Container(
                                          color: Colors.white,
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: controller.selectedSign != null
                                              ? Image.file(
                                                  controller.selectedSign!,
                                                  fit: BoxFit.fill,
                                                )
                                              : const SizedBox())),
                                ),

                                /* SizedBox(
                              width: 100.w,
                              child: mybutton(onTap: (){},title: "Browse"))*/
                              ],
                            )
                          : const SizedBox())
                  : Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "${controller.createEstimatedController.estimation.value?.sign}",
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    );
            }),
            const SizedBox(
              height: 12,
            ),
            GetBuilder(
              builder: (EstAddSignController controller) {
                return mybutton(
                  onTap: () {
                    debugPrint("taped");
                    Map<String, dynamic> mydata = {};
                    List<Map<String, dynamic>> myproductlist = [];
                    List<Map<String, dynamic>> mytaxlist = [];
                    EstAddClientController myClientController =
                        Get.put(EstAddClientController());
                    EstAddItemsController myItemsController =
                        Get.put(EstAddItemsController());
                    mydata["client"] =
                        myClientController.selectedAddClient.value;
                    for (var data in myItemsController.myaddedProductsList) {
                      Map<String, dynamic> myproductData = {};
                      myproductData["product"] = data.id;
                      myproductData["quantity"] = data.qty;
                      myproductlist.add(myproductData);
                    }
                    mydata["products"] = myproductlist;
                    mydata["estimationDate"] =
                        myClientController.selectedDate.toString();
                    mydata["currency"] = myClientController
                        .selectedCountry!.currencySymbol
                        .toString();
                    mydata["currencyId"] =
                        myClientController.selectedCountry!.id.toString();

                    mydata["itemTotal"] = myItemsController.subtotal.toString();

                    debugPrint("myitemsTotal${myItemsController.subtotal}");

                    mydata["subTotal"] =
                        myItemsController.afterDiscountText.toString();

                    if (myItemsController.myformattedDiscount.value == "%") {
                      mydata["discount"] =
                          myItemsController.dscCntlr.value.text;
                      mydata["discountType"] = "0";
                    } else {
                      mydata["discount"] = myItemsController.dscCntlr.text;
                      mydata["discountType"] = "1";
                    }
                    for (var data in myItemsController.myTextList) {
                      Map<String, dynamic> mytaxdata = {};

                      mytaxdata["percentage"] = data['taxValue'];
                      mytaxdata["name"] = data['taxType'];
                      mytaxdata["amount"] = data['value'];

                      mytaxlist.add(mytaxdata);
                    }
                    mydata["taxes"] = mytaxlist;

                    mydata["totalAmount"] = myItemsController.getFinalTotal;

                    debugPrint(jsonEncode(mydata));
                    String? id = Get.find<CreateEstimatedController>().id;
                    id != null
                        ? controller.ApiEditEstimate(
                            context: context,
                            id: id,
                            formData: mydata,
                            filePaths: controller.selectedSign == null
                                ? ""
                                : controller.selectedSign!.path)
                        : controller.ApiCreateEstimate(
                            context: context,
                            formData: mydata,
                            filePaths: controller.selectedSign == null
                                ? ""
                                : controller.selectedSign!.path);
                  },
                  title: "Submit",
                );
              },
            ),
          ]),
        ));
  }
}
