import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:focus_detector/focus_detector.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/global/constants/app_color.dart';
import 'package:invoice_generator/app/global/constants/app_fonts.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';
import 'package:invoice_generator/app/routes/app_pages.dart';

import '../../../../Models/client_by_id_model.dart';
import '../../../global/widgets/TitleWidget.dart';
import '../../CreateInvoice/controllers/create_invoice_controller.dart';
import '../controllers/invoice_address_controller.dart';

class InvoiceAddressView extends GetView<InvoiceAddressController> {
  const InvoiceAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(InvoiceAddressController());
    CreateInvoiceController createInvoiceController =
        Get.find<CreateInvoiceController>();
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: Obx(
          () => Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.h),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0x4C758090)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myTitleWidget(title: "Billing Address"),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                        controller.clientById.value?.clientData!.company!.name
                                .toString() ??
                            "",
                        style: text600_16.copyWith(color: Colors.black)),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                        controller.clientById.value?.clientData!.billingAddress!
                                .addressLine
                                .toString() ??
                            "",
                        style: text400_16black),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                        controller.clientById.value?.clientData!
                                .billingAddressDetails!.city
                                .toString() ??
                            "",
                        style: text400_16black),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                        "${controller.clientById.value?.clientData!.billingAddressDetails!.state ?? ""},${controller.clientById.value?.clientData!.billingAddressDetails!.country ?? ""}-${controller.clientById.value?.clientData!.billingAddress!.postalCode ?? ""}",
                        style: text400_16black),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        myPreviewTitle(
                          title: 'Mobile No.: ',
                        ),
                        Text(
                            controller.clientById.value?.clientData!.company!
                                    .mobileNumber ??
                                "",
                            style: text400_16black),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        String title = "Billing Address";
                        var myData =
                            await Get.toNamed(Routes.EDIT_ADDRESS, arguments: {
                          'title': title,
                          'model': controller.clientById.value!.clientData
                        });
                        if (myData != null) {
                          controller.clientById.value!.sClientData = myData;
                          debugPrint("myData ${jsonEncode(myData)}");
                          controller.update();
                        }
                      },
                      child: Text('Edit Address',
                          style:
                              text600_16.copyWith(color: AppColor.primaryBlue)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0x4C758090)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myTitleWidget(title: "Shipping Address"),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                        controller.clientById.value?.clientData!.company!.name
                                .toString() ??
                            "",
                        style: text600_16.copyWith(color: Colors.black)),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                        controller.clientById.value?.clientData!
                                .shippingAddress!.addressLine
                                .toString() ??
                            "",
                        style: text400_16black),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                        controller.clientById.value?.clientData!
                                .shippingAddressDetails!.city
                                .toString() ??
                            "",
                        style: text400_16black),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                        "${controller.clientById.value?.clientData!.shippingAddressDetails!.state ?? ""},${controller.clientById.value?.clientData!.shippingAddressDetails!.country ?? ""}-${controller.clientById.value?.clientData!.shippingAddress!.postalCode ?? ""}",
                        style: text400_16black),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        myPreviewTitle(
                          title: 'Mobile No.: ',
                        ),
                        Text(
                            controller.clientById.value?.clientData!.company!
                                    .mobileNumber ??
                                "",
                            style: text400_16black),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        String title = "Shipping Address";
                        var id = "#${createInvoiceController.estimateNo}";
                        Get.toNamed(Routes.EDIT_ADDRESS, arguments: {
                          'title': title,
                          'model': controller.clientById.value!.clientData
                        });
                      },
                      child: Text('Edit Address',
                          style:
                              text600_16.copyWith(color: AppColor.primaryBlue)),
                    )
                  ],
                ),
              ),
              const Spacer(),
              GetBuilder(
                builder: (CreateInvoiceController controller) {
                  return mybutton(
                    onTap: () {
                      controller.updateActive(2);

                      print("taped");
                    },
                    title: "Next",
                  );
                },
              ),
            ],
          ).paddingSymmetric(horizontal: 20.h).paddingOnly(bottom: 16.h),
        ));
  }
}
