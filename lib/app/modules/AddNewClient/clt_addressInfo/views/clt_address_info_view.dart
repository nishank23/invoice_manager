import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../global/constants/app_asset.dart';
import '../../../../global/constants/app_color.dart';
import '../../../../global/constants/app_fonts.dart';
import '../../../../global/widgets/TitleWidget.dart';
import '../../../../global/widgets/myButton.dart';
import '../../../../global/widgets/myDropDown.dart';
import '../../../../global/widgets/mytextfiled.dart';
import '../controllers/clt_address_info_controller.dart';

class CltAddressInfoView extends GetView<CltAddressInfoController> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CltAddressInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Get.put(CltAddressInfoController());
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  myTitleWidget(title: "Billing Address"),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: MyTextFiled(
                        lableText: "Person name",
                        controller: controller.nameBillController.value,
                        prefixIcon: Icon(Icons.person_outline_rounded,
                            color: AppColor.filedIcon, size: 22.25.w)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: MyTextFiled(
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
                    ),
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
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Street address, company name, c/o, apartment, building, floor etc...",
                    style: text400_13grey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GetBuilder<CltAddressInfoController>(builder: (controller) {
                    return CustomDropdown(
                      prefixIcon: SvgPicture.asset(AppAsset.countryIcon),
                      items: controller.mycountryDataList,
                      value: controller.selectedCountry.value,
                      lableText: 'Country',
                      onChanged: (value) {
                        controller.setSelectedCountry(value!);
                      },
                    );
                  }),
                  SizedBox(
                    height: 16.h,
                  ),
                  GetBuilder<CltAddressInfoController>(builder: (controller) {
                    return CustomDropdown(
                      prefixIcon: SvgPicture.asset(AppAsset.stateIcon),
                      items: controller.mystateDataList,
                      value: controller.selectedState.value,
                      lableText: 'State',
                      onChanged: (value) {
                        controller.setSelectedState(value!);
                      },
                    );
                  }),
                  SizedBox(
                    height: 16.h,
                  ),
                  GetBuilder<CltAddressInfoController>(builder: (controller) {
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
                  }),
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
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: GetBuilder<CltAddressInfoController>(
                          builder: (controller) {
                            return Checkbox(
                              activeColor: AppColor.primaryBlue,


                              value: controller.isAddressSame, onChanged: (value) {


                                controller.isAddressSame = value!;
                                controller.update();


                            },);
                          }
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("Same as Billing Address"),


                    ],
                  ),



                    GetBuilder<CltAddressInfoController>(
                      builder: (controller) {
                        return Visibility(
                          visible: !controller.isAddressSame,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              myTitleWidget(title: "Shipping Address"),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: MyTextFiled(
                                    lableText: "Person name",
                                    controller: controller.nameShipController.value,
                                    prefixIcon: Icon(Icons.person_outline_rounded,
                                        color: AppColor.filedIcon, size: 22.25.w)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: MyTextFiled(
                                  lableText: "Mobile number",
                                  maxLength: 10,
                                  keyboardType: TextInputType.phone,
                                  onValidator: (value) {
                                    if (value!.contains(RegExp(r'[^0-9]'))) {
                                      return "Only numbers are allowed";
                                    } else if (value.length < 10) {
                                      return "Mobile number must be at least 10 digits";
                                    }
                                    return null;
                                  },
                                  controller:
                                  controller.mobileNumShipController.value,
                                  prefixIcon: Transform.scale(
                                    scale: 17.h / 53.h,
                                    // Adjust the scale factor according to your desired size
                                    child: SvgPicture.asset(
                                      AppAsset.callIcon,
                                      color: AppColor.filedIcon,
                                    ),
                                  ),
                                ),
                              ),
                              MyTextFiled(
                                controller: controller.addressShipController.value,
                                lableText: "Address",
                                height: 120.h,
                                maxLines: 5,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "Street address, company name, c/o, apartment, building, floor etc...",
                                style: text400_13grey,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              GetBuilder<CltAddressInfoController>(
                                  builder: (controller) {
                                    return CustomDropdown(
                                      prefixIcon: SvgPicture.asset(AppAsset.countryIcon),
                                      items: controller.mycountryshipDataList,
                                      value: controller.ship_selectedCountry!.value,
                                      lableText: 'Country',
                                      onChanged: (value) {
                                        controller.ship_selectedCountry!.value = value!;
                                        controller.update();
                                        controller.ApiGetAllShipStates(
                                            context: Get.context!,
                                            countryId: int.parse(value.toString()));
                                      },
                                    );
                                  }),
                              SizedBox(
                                height: 16.h,
                              ),
                              GetBuilder<CltAddressInfoController>(
                                  builder: (controller) {
                                    return CustomDropdown(
                                      prefixIcon: SvgPicture.asset(AppAsset.stateIcon),
                                      items: controller.mystateshipDataList,
                                      value: controller.ship_selectedState!.value,
                                      lableText: 'State',
                                      onChanged: (value) {
                                        controller.ship_selectedState!.value = value!;

                                        controller.update();

                                        controller.ApiGetAllShipCity(
                                            context: Get.context!,
                                            stateId: int.parse(value.toString()));
                                      },
                                    );
                                  }),
                              SizedBox(
                                height: 16.h,
                              ),
                              GetBuilder<CltAddressInfoController>(
                                  builder: (controller) {
                                    return CustomDropdown(
                                      prefixIcon: SvgPicture.asset(AppAsset.cityIcon),
                                      items: controller.mycityshipDataList,
                                      value: controller.ship_selectedCity!.value,
                                      lableText: 'City',
                                      onChanged: (value) {
                                        controller.ship_selectedCity!.value = value!;
                                        controller.update();
                                      },
                                    );
                                  }),
                              SizedBox(
                                height: 16.h,
                              ),
                              MyTextFiled(
                                controller: controller.zipShipController.value,
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
                              ),
                            ],
                          ),
                        );
                      }
                    ),

                  SizedBox(
                    height: 16.h,
                  ),
                  GetBuilder(
                    builder: (CltAddressInfoController controller) {
                      return mybutton(
                        onTap: () {
                          print("taped");


                          print("taped");

                          if (formKey.currentState!.validate()) {
                            controller.submitProfileData(context);
                          }
                        },
                        title: "Create Client",
                      );

                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                ]),
          ),
        ));
  }
}
