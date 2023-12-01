import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/CreateEstimated/controllers/create_estimated_controller.dart';

import '../../../../global/constants/app_asset.dart';
import '../../../../global/constants/app_color.dart';
import '../../../../global/widgets/TitleWidget.dart';
import '../../../../global/widgets/myButton.dart';
import '../../../../global/widgets/myDatePicker.dart';
import '../../../../global/widgets/myDropDown.dart';
import '../../../../global/widgets/mytextfiled.dart';
import '../controllers/est_add_client_controller.dart';

class EstAddClientView extends GetView<EstAddClientController> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EstAddClientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selected_date = DateTime.now();
    CreateEstimatedController myController =
        Get.put(CreateEstimatedController());

    final EstAddClientController controller  = Get.put(EstAddClientController());

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
            // Divider(thickness: 2.h,height: 2.h,),

            Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                child: myTitleWidget(title: "Add Client")),

            GetBuilder<EstAddClientController>(builder: (controller) {
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

            SizedBox(height: 16.h),

            Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                child: myTitleWidget(title: "Invoice Date")),

            GetBuilder<EstAddClientController>(builder: (controller) {
              return MyTextFiled(
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
                  controller.selectedDate =
                      await DatePicker.showDatePickerDialog(context,
                          initialDate:
                              controller.dateController.value.text.isEmpty
                                  ? DateTime.now()
                                  : DateTime.parse(
                                      controller.dateController.value.text),
                          firstDate: DateTime(2002),
                          lastDate: DateTime(2040));

                  controller.dateController.value.text =
                      controller.selectedDate.toString().substring(0, 10);
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
                controller: controller.dateController.value,
              );
            }),

            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
              ),
              child: myTitleWidget(title: "Invoice Currency"),
            ),
            GetBuilder<EstAddClientController>(builder: (controller) {
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
              builder: (EstAddClientController controller) {
                return mybutton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      myController.updateActive(1);
                    }
                    print("taped");
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
