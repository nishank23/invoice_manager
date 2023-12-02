import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../../../global/widgets/TitleWidget.dart';
import '../../../global/widgets/myButton.dart';
import '../../../global/widgets/myDropDown.dart';
import '../../../global/widgets/mytextfiled.dart';
import '../../CreateInvoice/controllers/create_invoice_controller.dart';
import '../controllers/edit_address_controller.dart';

class EditAddressView extends GetView<EditAddressController> {
  const EditAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CreateInvoiceController createInvoiceController = Get.find<CreateInvoiceController>();
  final EditAddressController controller = Get.put(EditAddressController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GetBuilder(
            builder: (EditAddressController controller) {
              return SingleChildScrollView(
                reverse: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Text(
                          "Edit Address",
                          style: text700_18,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                          decoration: BoxDecoration(
                              color: AppColor.primaryBlue.withOpacity(.05)),
                          child: Text(
                            "#${createInvoiceController.estimateNo}",
                            style: text300_14.copyWith(color: AppColor.primaryBlue),
                          ),
                        )
                      ],
                    ).paddingSymmetric(
                      horizontal: 20.w,
                    ),
                    SizedBox(height: 16.h),
                    const Divider(
                      height: 0,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    myTitleWidget(
                      title: controller.title ?? "",
                    ).paddingSymmetric(
                      horizontal: 20.w,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    MyTextFiled(
                            lableText: "Person name",
                            controller: controller.nameBillController.value,
                            prefixIcon: Icon(Icons.person_outline_rounded,
                                color: AppColor.filedIcon, size: 22.25.w))
                        .paddingSymmetric(
                      horizontal: 20.w,
                    ),
                    MyTextFiled(
                      lableText: "Mobile number",
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      controller: controller.mobileBillNumController.value,
                      onValidator: (value) {
                        if (value!.contains(RegExp(r'[^0-9]'))) {
                          return "Only numbers are allowed";
                        } else if (value.length < 10) {
                          return "Mobile number must be at least 10 digits";
                        }
                        return null;
                      },
                      prefixIcon: Transform.scale(
                        scale: 17.h / 53.h,
                        // Adjust the scale factor according to your desired size
                        child: SvgPicture.asset(
                          AppAsset.callIcon,
                          color: AppColor.filedIcon,
                        ),
                      ),
                    ).paddingSymmetric(
                      horizontal: 20.w,
                    ),
                    MyTextFiled(
                      controller: controller.addressBillController.value,
                      lableText: "Address",
                      height: 120.h,
                      onValidator: (value) {
                        if (value.toString().isEmpty) {
                          return "Address can't be empty";
                        }
                        return null;
                      },
                      maxLines: 5,
                    ).paddingSymmetric(
                      horizontal: 20.w,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Street address, company name, c/o, apartment, building, floor etc...",
                      style: text400_13grey,
                    ).paddingSymmetric(
                      horizontal: 20.w,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GetBuilder<EditAddressController>(builder: (controller) {
                      return CustomDropdown(
                        prefixIcon: SvgPicture.asset(AppAsset.countryIcon),
                        items: controller.mycountryDataList,
                        value: controller.selectedCountry.value,
                        lableText: 'Country',
                        onChanged: (value) {
                          controller.selectedCountry.value = value!;
                          controller.update();

                          controller.ApiGetAllStates(
                              context: context,
                              countryId: int.parse(value.toString()));
                        },
                      );
                    }).paddingSymmetric(horizontal: 20.w),
                    SizedBox(height: 16.h),
                    GetBuilder<EditAddressController>(builder: (controller) {
                      return CustomDropdown(
                        prefixIcon: SvgPicture.asset(AppAsset.stateIcon),
                        items: controller.mystateDataList,
                        value: controller.selectedState.value,
                        lableText: 'State',
                        onChanged: (value) {
                          controller.selectedState.value = value!;
                          controller.update();

                          controller.ApiGetAllCity(
                              context: context,
                              stateId: int.parse(value.toString()));
                        },
                      );
                    }).paddingSymmetric(
                      horizontal: 20.w,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    GetBuilder<EditAddressController>(builder: (controller) {
                      return CustomDropdown(
                        prefixIcon: SvgPicture.asset(AppAsset.cityIcon),
                        items: controller.mycityDataList,
                        value: controller.selectedCity.value,
                        lableText: 'City',
                        onChanged: (value) {
                          controller.selectedCity.value = value!;
                          controller.update();
                        },
                      );
                    }).paddingSymmetric(
                      horizontal: 20.w,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    MyTextFiled(
                      controller: controller.zipBillController.value,
                      lableText: "ZIP/Postal code",
                      maxLength: 6,
                      onValidator: (value) {
                        if (value!.isEmpty) {
                          return 'ZIP/Postal code cannot be empty';
                        } else if (value.length < 6) {
                          return 'ZIP/Postal code should be at least 6 digits';
                        } else if (value!.contains(RegExp(r'[^0-9]'))) {
                          return 'ZIP/Postal code should contain only numeric digits';
                        }
                        return null;
                      },
                      prefixIcon: Transform.scale(
                        scale: 17.h / 60.h,
                        // Adjust the scale factor according to your desired size
                        child: SvgPicture.asset(
                          AppAsset.hashIcon,
                          color: AppColor.filedIcon,
                        ),
                      ),
                    ).paddingSymmetric(
                      horizontal: 20.w,
                    ),
                    SizedBox(
                      height: 62.h,
                    ),
                    mybutton(
                      onTap: () {
                        print("taped");
                      },
                      title: "Save & Continue",
                    )
                        .paddingSymmetric(
                          horizontal: 20.w,
                        )
                        .paddingOnly(bottom: 30.h),
                  ],
                ),
              );
            }
          ),
        ));
  }
}
