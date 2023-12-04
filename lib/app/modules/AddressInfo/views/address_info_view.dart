import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/global/constants/app_color.dart';
import 'package:invoice_generator/app/global/constants/app_fonts.dart';
import 'package:invoice_generator/app/global/widgets/TitleWidget.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';
import 'package:invoice_generator/app/global/widgets/mytextfiled.dart';
import 'package:material_dialogs/material_dialogs.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/widgets/myDropDown.dart';
import '../../Tabs/controllers/tabs_controller.dart';
import '../controllers/address_info_controller.dart';

class AddressInfoView extends GetView<AddressInfoController> {
  final RxBool isAdded;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddressInfoView({
    Key? key,
    required this.isAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressInfoController());

    controller.isClient = isAdded.value;
    final TabsController ctabsController = Get.put(TabsController());

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
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
                Visibility(
                  visible: isAdded.value,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: MyTextFiled(
                        lableText: "Person name",
                        controller: controller.nameBillController.value,
                        prefixIcon: Icon(Icons.person_outline_rounded,
                            color: AppColor.filedIcon, size: 22.25.w)),
                  ),
                ),
                Visibility(
                  visible: isAdded.value,
                  child: Padding(
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
                GetBuilder<AddressInfoController>(builder: (controller) {
                  return CustomDropdown(
                    prefixIcon: SvgPicture.asset(AppAsset.countryIcon),
                    items: controller.mycountryDataList,
                    value: controller.selectedCountry.value,
                    lableText: 'Country',
                    onChanged: (value) {
                      controller.setSelectedCountry(value!);
                      controller.selectedState.value = null;
                      controller.selectedCity.value = null;
                    },
                  );
                }),
                SizedBox(
                  height: 16.h,
                ),
                GetBuilder<AddressInfoController>(builder: (controller) {
                  return CustomDropdown(
                    prefixIcon: SvgPicture.asset(AppAsset.stateIcon),
                    items: controller.mystateDataList,
                    value: controller.selectedState.value,
                    lableText: 'State',
                    onChanged: (value) {
                      controller.setSelectedState(value!);

                      controller.selectedCity.value = null;
                    },
                  );
                }),
                SizedBox(
                  height: 16.h,
                ),
                GetBuilder<AddressInfoController>(builder: (controller) {
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
                    }  if (value.length < 6) {
                      return 'ZIP/Postal code should be at least 6 digits';
                    }  if (value!.contains(RegExp(r'[^0-9]'))) {
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


                Visibility(
                    visible: isAdded.value,
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
                        GetBuilder<AddressInfoController>(
                            builder: (controller) {
                          return CustomDropdown(
                            prefixIcon: SvgPicture.asset(AppAsset.countryIcon),
                            items: controller.mycountryshipDataList,
                            value: controller.ship_selectedCountry.value,
                            lableText: 'Country',
                            onChanged: (value) {
                              controller.ship_selectedCountry.value = value!;
                              controller.update();
                              controller.ApiGetAllShipStates(
                                  context: Get.context!,
                                  countryId: int.parse(value.toString()));
                              controller.ship_selectedState.value = null;
                              controller.ship_selectedCity.value = null;
                            },
                          );
                        }),
                        SizedBox(
                          height: 16.h,
                        ),
                        GetBuilder<AddressInfoController>(
                            builder: (controller) {
                          return CustomDropdown(
                            prefixIcon: SvgPicture.asset(AppAsset.stateIcon),
                            items: controller.mystateshipDataList,
                            value: controller.ship_selectedState.value,
                            lableText: 'State',
                            onChanged: (value) {
                              controller.ship_selectedState.value = value!;

                              controller.update();

                              controller.ApiGetAllShipCity(
                                  context: Get.context!,
                                  stateId: int.parse(value.toString()));
                               controller.ship_selectedCity.value = null;
                            },
                          );
                        }),
                        SizedBox(
                          height: 16.h,
                        ),
                        GetBuilder<AddressInfoController>(
                            builder: (controller) {
                          return CustomDropdown(
                            prefixIcon: SvgPicture.asset(AppAsset.cityIcon),
                            items: controller.mycityshipDataList,
                            value: controller.ship_selectedCity.value,
                            lableText: 'City',
                            onChanged: (value) {
                              controller.ship_selectedCity.value = value!;
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
                    )),
                SizedBox(
                  height: 16.h,
                ),
                GetBuilder(
                  builder: (AddressInfoController controller) {
                    return Visibility(
                      visible: isAdded.value,
                      replacement: mybutton(
                        onTap: () {
                          print("taped");
                          if (formKey.currentState!.validate()) {
                            ctabsController.tabController!
                                .animateTo(2, curve: Curves.easeInOutQuint);
                          }
                          // tabsController.screens[1];
                        },
                        title: "Next",
                      ),
                      child: mybutton(
                        onTap: () {
                          print("taped");


                            print("taped");

                            if (formKey.currentState!.validate()) {
                              controller.submitProfileData(context);
                            }
                            // tabsController.screens[1];

                          /*Dialogs.materialDialog(
                            color: Colors.white,
                            context: context,
                            actions: [
                              Column(
                                children: [
                                  SvgPicture.asset(AppAsset.sucessIcon),
                                  SizedBox(
                                    height: 15.5.h,
                                  ),
                                  Text(
                                    "Rock On!👍",
                                    style: text700_18,
                                  ),
                                  SizedBox(
                                    height: 17.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Your client  ",
                                        style: text300_16grey,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 3.w,
                                        ),
                                        decoration: BoxDecoration(
                                            color: AppColor.primaryBlue
                                                .withOpacity(.20),
                                            borderRadius:
                                                BorderRadius.circular(3.r)),
                                        child: Text(
                                          "Wealth Zone Group",
                                          style: text400_16purple.copyWith(
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Text(
                                    "successfully added on the list",
                                    style: text300_16grey,
                                  ),
                                  SizedBox(
                                    height: 18.h,
                                  ),
                                  mybutton(
                                      onTap: () {
                                        Get.back();
                                      },
                                      title: "Close",
                                      textStyle: TextStyle(
                                          color: AppColor.primaryBlue,
                                          fontSize: 16.sp,
                                          fontFamily: fontFamily,
                                          fontWeight: w600),
                                      backgroundColor: Colors.transparent,
                                      borderColor: AppColor.primaryBlue)
                                ],
                              )
                            ],
                          );*/
                          // tabsController.screens[1];
                        },
                        title: "Create Client",
                      ),
                    );
                  },
                ),
              ]),
        ));
  }
}
