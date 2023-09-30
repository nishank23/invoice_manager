import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/AddressInfo/controllers/address_info_controller.dart';
import 'package:invoice_generator/app/modules/BusinessInfo/controllers/business_info_controller.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/networkClient.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/constants/constants.dart';
import '../../../global/widgets/custom_dialog.dart';
import '../../../routes/app_pages.dart';

import 'package:path/path.dart' as path;

import 'package:dio/dio.dart' as DIO;
class BankInfoController extends GetxController {
  //TODO: Implement BankInfoController

  final count = 0.obs;
  AddressInfoController addresscntlr = Get.find();
  BusinessInfoController businesscntlr = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Rx<TextEditingController> bankNameController = TextEditingController().obs;
  Rx<TextEditingController> accNumController = TextEditingController().obs;
  Rx<TextEditingController> reAccNumController = TextEditingController().obs;
  Rx<TextEditingController> ifscController = TextEditingController().obs;

  Map<String, dynamic> requestData = {};

  void submitProfileData(BuildContext context) {
    requestData['company'] = {
      'name': businesscntlr.companyNameController.value.text,
      'owner': businesscntlr.ownerNameController.value.text,
      'mobileNumber': businesscntlr.mobileNumberController.value.text,
      'alternativeMobileNumber':
          businesscntlr.alterMobileNumberController.value.text,
      'gstNumber': businesscntlr.gstController.value.text,
      'email': businesscntlr.businessEmailController.value.text,
      'website': businesscntlr.businessWebsiteController.value.text,
    };
    requestData['address'] = {
      'addressLine': addresscntlr.addressBillController.value.text,
      'city': addresscntlr.selectedCity!.value,
      'state': addresscntlr.selectedState!.value,
      'country': addresscntlr.selectedCountry!.value,
      'postalCode': addresscntlr.zipBillController!.value.text,
    };
    requestData['bankInfo'] = {
      'bankName': bankNameController.value.text,
      'accountNumber': accNumController.value.text,
      'ifscCode': ifscController.value.text,
    };


    var selectedphoto = businesscntlr.selectedPhoto==null?"":businesscntlr.selectedPhoto!.path;


    ApiCallUpdateProfile(context: context,filepath: selectedphoto, requestBody: requestData);
  }

  ApiCallUpdateProfile(
      {required BuildContext context,
        String? filepath,
      required Map<String, dynamic> requestBody}) async {


    final form = DIO.FormData();


    if (filepath != null && filepath.isNotEmpty) {

      final file = await DIO.MultipartFile.fromFile(
        filepath,
        filename: path.basename(filepath),
      );
      form.files.add(MapEntry('file', file));

    }

    requestBody.forEach((key, value) {
      if (value is List<Map<String, dynamic>>) {
        final jsonString = jsonEncode(value);
        form.fields.add(MapEntry<String, String>(key, jsonString));
      } else {
        final jsonString = jsonEncode(value);
        form.fields.add(MapEntry<String, String>(key, jsonString));
      }
    });


    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);

    return NetworkClient.getInstance.callApiForm(
      context,
      baseURL,
      ApiConstant.createUpdateProfile,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: form,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        box.write(Constant.isProfileUpdated, true);
        box.write(Constant.companyName, businesscntlr.companyNameController.value.text);
        box.write(Constant.mobilenumber, businesscntlr.mobileNumberController.value.text);

        if(businesscntlr.selectedPhoto!=null){
          box.write(Constant.userPhoto, businesscntlr.selectedPhoto!.path.toString());
        }


        Fluttertoast.showToast(msg: "Profile Updated Successfully");
        Get.offNamed(Routes.HOME);
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }
}
