// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../global/constants/app_asset.dart';
import '../../../../global/constants/app_color.dart';
import '../../../../global/constants/app_fonts.dart';
import '../../../../global/widgets/title_widget.dart';
import '../../../../global/widgets/my_button.dart';
import '../../../../global/widgets/my_dropdown.dart';
import '../../../../global/widgets/mytextfiled.dart';
import '../../controllers/tabs_controller.dart';
import '../controllers/profile_address_controller.dart';

class ProfileAddressView extends GetView<ProfileAddressController> {
  final bool isAdded;
  const ProfileAddressView(this.isAdded, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final TabsController ctabsController = Get.find();

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
                visible: isAdded,
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
                visible: isAdded,
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
              Obx(
                () => CustomDropdown(
                  prefixIcon: SvgPicture.asset(AppAsset.countryIcon),
                  items: controller.mycountryDataList,
                  value: controller.selectedCountry!.value,
                  lableText: 'Country',
                  onChanged: (value) {
                    controller.selectedCountry!.value = value!;
                    controller.update();

                    controller.apiGetAllStates(
                        context: context,
                        countryId: int.parse(value.toString()));
                    controller.update();
                    // controller.refresh();
                  },
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Obx(
                () => CustomDropdown(
                  prefixIcon: SvgPicture.asset(AppAsset.stateIcon),
                  items: controller.mystateDataList,
                  value: controller.selectedState!.value,
                  lableText: 'State',
                  onChanged: (value) {
                    controller.selectedState!.value = value!;
                    controller.update();

                    controller.apiGetAllCity(
                        context: context, stateId: int.parse(value.toString()));
                  },
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              GetBuilder<ProfileAddressController>(builder: (controller) {
                return CustomDropdown(
                  prefixIcon: SvgPicture.asset(AppAsset.cityIcon),
                  items: controller.dropdownItems,
                  value: controller.selectedCity!.value,
                  lableText: 'City',
                  onChanged: (value) {
                    controller.selectedCity!.value = value!;
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
              Visibility(
                  visible: isAdded,
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
                          controller: controller.mobileNumShipController.value,
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
                      GetBuilder<ProfileAddressController>(
                          builder: (controller) {
                        return CustomDropdown(
                          prefixIcon: SvgPicture.asset(AppAsset.countryIcon),
                          items: controller.dropdownItems,
                          value: controller.shipSelectedCountry!.value,
                          lableText: 'Country',
                          onChanged: (value) {
                            controller.shipSelectedCountry!.value = value!;
                            controller.update();
                          },
                        );
                      }),
                      SizedBox(
                        height: 16.h,
                      ),
                      GetBuilder<ProfileAddressController>(
                          builder: (controller) {
                        return CustomDropdown(
                          prefixIcon: SvgPicture.asset(AppAsset.stateIcon),
                          items: controller.dropdownItems,
                          value: controller.shipSelectedState!.value,
                          lableText: 'State',
                          onChanged: (value) {
                            controller.shipSelectedState!.value = value!;
                            controller.update();
                          },
                        );
                      }),
                      SizedBox(
                        height: 16.h,
                      ),
                      GetBuilder<ProfileAddressController>(
                          builder: (controller) {
                        return CustomDropdown(
                          prefixIcon: SvgPicture.asset(AppAsset.cityIcon),
                          items: controller.dropdownItems,
                          value: controller.shipSelectedCity!.value,
                          lableText: 'City',
                          onChanged: (value) {
                            controller.shipSelectedCity!.value = value!;
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
                builder: (ProfileAddressController controller) {
                  return Visibility(
                    visible: isAdded,
                    replacement: mybutton(
                      onTap: () {
                        debugPrint("taped");

                        ctabsController.tabController!
                            .animateTo(2, curve: Curves.easeInOutQuint);
                        // tabsController.screens[1];
                      },
                      title: "Next",
                    ),
                    child: mybutton(
                      onTap: () {
                        debugPrint("taped");

                        if (formKey.currentState!.validate()) {
                          controller.submitProfileData(context);
                        }
                        // tabsController.screens[1];
                      },
                      title: "Create Client",
                    ),
                  );
                },
              ),
              SizedBox(
                height: 26.h,
              ),
            ]),
      ),
    );
  }
}
