import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/AddressInfo/controllers/address_info_controller.dart';
import 'package:invoice_generator/app/modules/AddressInfo/views/address_info_view.dart';
import 'package:invoice_generator/app/modules/BankInfo/views/bank_info_view.dart';
import 'package:invoice_generator/app/modules/BusinessInfo/controllers/business_info_controller.dart';
import 'package:invoice_generator/app/modules/BusinessInfo/views/business_info_view.dart';

import '../../../../Models/get_profile_model.dart';
import '../../../../main.dart';
import '../../../../services/Connectivity/network_client.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/constants/constants.dart';
import '../../../global/widgets/custom_dialog.dart';
import '../../AddressInfo/bindings/address_info_binding.dart';
import '../../BankInfo/bindings/bank_info_binding.dart';
import '../../BankInfo/controllers/bank_info_controller.dart';
import '../../BusinessInfo/bindings/business_info_binding.dart';

class TabsController extends GetxController with GetSingleTickerProviderStateMixin {
  TabController? tabController;

  final count = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: myTabs.length, vsync: this);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (box.read(Constant.isProfileUpdated) != null) {
      apiGetUserProfile(context: Get.context!);
    }
  }

  @override
  void onClose() {
    super.onClose();
    tabController!.dispose();
  }

  RxList<Tab> myTabs = <Tab>[
    const Tab(
      text: "Business Info",
    ),
    const Tab(
      text: "Address",
    ),
    const Tab(
      text: "Bank Info",
    ),
  ].obs;

  final screens = [
    BusinessInfoView(false),
    AddressInfoView(
      isAdded: false.obs,
    ),
    BankInfoView()
  ];

  final pageRoutes = [
    '/business_info',
    '/address_info',
    '/bank_info',
  ];
  final pageBindings = [
    BusinessInfoBinding(),
    AddressInfoBinding(),
    BankInfoBinding(),
  ];
  void changeTabIndex(int index) {
    Get.toNamed(pageRoutes[index]);
  }

  apiGetUserProfile({required BuildContext context}) async {
    FocusScope.of(context).unfocus();

    app.resolve<CustomDialogs>().showCircularDialog(context);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getProfile,
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        log(response.toString());

        GetProfileModel getprofile = GetProfileModel.fromJson(response);

        BusinessInfoController bcontroller = Get.put(BusinessInfoController());
        AddressInfoController addresscontroller =
            Get.put(AddressInfoController());
        BankInfoController bankcontroller = Get.put(BankInfoController());
        bcontroller.companyNameController.value.text =
            getprofile.userProfile!.company!.name.toString();
        bcontroller.ownerNameController.value.text =
            getprofile.userProfile!.company!.owner.toString();
        bcontroller.mobileNumberController.value.text =
            getprofile.userProfile!.company!.mobileNumber.toString();
        bcontroller.alterMobileNumberController.value.text =
            getprofile.userProfile!.company!.alternativeMobileNumber.toString();
        bcontroller.gstController.value.text =
            getprofile.userProfile!.company!.gstNumber.toString();
        bcontroller.businessEmailController.value.text =
            getprofile.userProfile!.company!.email.toString();
        bcontroller.businessWebsiteController.value.text =
            getprofile.userProfile!.company!.website.toString();
        addresscontroller.addressBillController.value.text =
            getprofile.userProfile!.address!.addressLine.toString();
        addresscontroller.selectedCountry.value =
            getprofile.userProfile!.address!.country.toString();
        addresscontroller
            .setSelectedCountry(addresscontroller.selectedCountry.value!);
        addresscontroller.selectedState.value =
            getprofile.userProfile!.address!.state.toString();
        addresscontroller
            .setSelectedState(addresscontroller.selectedState.value!);
        addresscontroller.selectedCity.value =
            getprofile.userProfile!.address!.city.toString();
        addresscontroller.zipBillController.value.text =
            getprofile.userProfile!.address!.postalCode.toString();

        bankcontroller.bankNameController.value.text =
            getprofile.userProfile!.bank!.bankName.toString();
        bankcontroller.accNumController.value.text =
            getprofile.userProfile!.bank!.accountNumber.toString();
        bankcontroller.reAccNumController.value.text =
            getprofile.userProfile!.bank!.accountNumber.toString();
        bankcontroller.ifscController.value.text =
            getprofile.userProfile!.bank!.ifscCode.toString();
/*
        bcontroller.profile_img = getprofile.userProfile!.userPhoto.toString();
*/

        var selectedPhoto = box.read(Constant.userPhoto);
        if (selectedPhoto != null) {
          bcontroller.selectedPhoto = File(selectedPhoto);
        }

        update();
        refresh();
        bcontroller.update();
        bcontroller.refresh();
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
      },
    );
  }
}
