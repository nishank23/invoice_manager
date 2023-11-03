// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/widgets/title_widget.dart';
import '../../../global/widgets/my_button.dart';
import '../../../global/widgets/my_date_picker.dart';
import '../../../global/widgets/my_dropdown.dart';
import '../../../global/widgets/mytextfiled.dart';
import '../../CreateInvoice/controllers/create_invoice_controller.dart';
import '../controllers/invoice_add_client_controller.dart';

class InvoiceAddClientView extends GetView<InvoiceAddClientController> {
  InvoiceAddClientView({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CreateInvoiceController myController = Get.put(CreateInvoiceController());
    Get.put(InvoiceAddClientController());

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(right: 20.h, left: 20.h),
        reverse: false,
        child: Form(
          key: formKey,
          child: Column(children: [
            myTitleWidget(title: "Add Client").marginSymmetric(
              vertical: 20.h,
            ),
            GetBuilder<InvoiceAddClientController>(builder: (controller) {
              return CustomDropdown(
                onValidator: (value) {
                  if (value == null) {
                    return "Please select client";
                  }
                  return null;
                },
                prefixIcon: Icon(Icons.person_outline_rounded,
                    color: AppColor.filedIcon, size: 22.w),
                items: controller.myClientList,
                value: controller.selectedAddClient.value,
                lableText: 'Add client',
                onChanged: (value) {
                  controller.selectedAddClient.value = value!;
                  controller.update();
                },
              );
            }),
            SizedBox(
              height: 16.h,
            ),
            myTitleWidget(title: "Invoice Date").marginSymmetric(
              vertical: 20.h,
            ),
            MyTextFiled(
              onValidator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return "Please select date";
                }
                return null;
              },
              lableText: "Invoice date",
              keyboardType: TextInputType.datetime,
              readOnly: true,
              onTap: () async {
                controller.selectedInvoiceDate =
                    await DatePicker.showDatePickerDialog(context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2002),
                        lastDate: DateTime(2040));

                controller.invoiceDateController.value.text =
                    controller.selectedInvoiceDate.toString().substring(0, 10);
                controller.update();
              },
              suffixIcon: Transform.scale(
                scale: .65,
                child: GestureDetector(
                  onTap: () async {
                    /*  controller.selectedDate =
                        await DatePicker.showDatePickerDialog(context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2002),
                            lastDate: DateTime(2040));

                    controller.dateController.value.text =
                        controller.selectedDate.toString().substring(0, 10);
                    controller.update();*/
                  },
                  child: SvgPicture.asset(AppAsset.calendarIcon,
                      height: 15.h, width: 15.w),
                ),
              ),
              controller: controller.invoiceDateController.value,
            ),
            SizedBox(
              height: 16.h,
            ),
            MyTextFiled(
              onValidator: (value) {
                if (value == null || value.toString().isEmpty) {
                  return "Please select date";
                }
                return null;
              },
              lableText: "Due date",
              keyboardType: TextInputType.datetime,
              readOnly: true,
              onTap: () async {
                controller.selectedDueDate =
                    await DatePicker.showDatePickerDialog(context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2002),
                        lastDate: DateTime(2040));

                controller.dueDateController.value.text =
                    controller.selectedDueDate.toString().substring(0, 10);
                controller.update();
              },
              suffixIcon: Transform.scale(
                scale: .65,
                child: GestureDetector(
                  onTap: () async {
                    /*  controller.selectedDate =
                        await DatePicker.showDatePickerDialog(context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2002),
                            lastDate: DateTime(2040));

                    controller.dateController.value.text =
                        controller.selectedDate.toString().substring(0, 10);
                    controller.update();*/
                  },
                  child: SvgPicture.asset(AppAsset.calendarIcon,
                      height: 15.h, width: 15.w),
                ),
              ),
              controller: controller.dueDateController.value,
            ),
            myTitleWidget(title: "Invoice Currency").marginSymmetric(
              vertical: 20.h,
            ),
            GetBuilder<InvoiceAddClientController>(builder: (controller) {
              return MyTextFiled(
                onValidator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return "Please select currency";
                  }
                  return null;
                },
                prefixIcon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.selectedCountryIcon.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24)),
                  ],
                ),
                lableText: 'Select currency',
                readOnly: true,
                onTap: () async {
                  controller.pickCountry(context);
                },
                controller: controller.currencyController.value,
              );
            }),
            SizedBox(
              height: 20.h,
            ),
            GetBuilder(
              builder: (InvoiceAddClientController controller) {
                return mybutton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      myController.updateActive(1);
                    }
                    debugPrint("taped");
                  },
                  title: "Next",
                );
              },
            ),
            SizedBox(
              height: 50.h,
            )
          ]),
        ),
      ),
    );
  }
}
