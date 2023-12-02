import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/AddNewClient/clt_businessInfo/controllers/clt_business_info_controller.dart';
import 'package:invoice_generator/app/modules/AddNewClient/controllers/add_new_client_controller.dart';
import 'package:material_dialogs/dialogs.dart';

import '../../../../../main.dart';
import '../../../../../services/Connectivity/networkClient.dart';
import '../../../../global/constants/api_const.dart';
import '../../../../global/constants/app_asset.dart';
import '../../../../global/constants/app_color.dart';
import '../../../../global/constants/app_fonts.dart';
import '../../../../global/widgets/custom_dialog.dart';

import 'package:path/path.dart' as path;

import 'package:dio/dio.dart' as DIO;

import '../../../../global/widgets/myButton.dart';

class CltAddressInfoController extends GetxController {
  //TODO: Implement CltAddressInfoController
  AddNewClientController addNewClientController = Get.put(AddNewClientController());
  final count = 0.obs;

  bool isAddressSame = false;

  @override
  void onReady() {
    super.onReady();
    ApiGetAllCountry(context: Get.context!);

    ApiGetAllShipCountry(context: Get.context!);

    if (addNewClientController.id != null) {
      getData();
    }
  }

  getData() {
    //billing
    nameBillController.value.text = addNewClientController.clientById.value!.clientData!.company!.personName!;
    mobileBillNumController.value.text = addNewClientController.clientById.value!.clientData!.company!.mobileNumber!;
    addressBillController.value.text = addNewClientController.clientById.value!.clientData!.shippingAddress!.addressLine!;
    zipBillController.value.text = addNewClientController.clientById.value!.clientData!.shippingAddress!.postalCode!;
    selectedCity.value = addNewClientController.clientById.value!.clientData!.billingAddress!.city!;

    selectedCountry.value = addNewClientController.clientById.value!.clientData!.billingAddress!.country!;

    setSelectedCountry(selectedCountry.value.toString());

    selectedState.value = addNewClientController.clientById.value!.clientData!.billingAddress!.state!;

    //shipping

    nameShipController.value.text = addNewClientController.clientById.value!.clientData!.company!.personName!;
    mobileNumShipController.value.text = addNewClientController.clientById.value!.clientData!.company!.mobileNumber!;
    addressShipController.value.text = addNewClientController.clientById.value!.clientData!.shippingAddress!.addressLine!;
    zipShipController.value.text = addNewClientController.clientById.value!.clientData!.shippingAddress!.postalCode!;
    ship_selectedCity.value = addNewClientController.clientById.value!.clientData!.shippingAddress!.city!;
    ship_selectedCountry.value = addNewClientController.clientById.value!.clientData!.shippingAddress!.country!;
    ship_selectedState.value = addNewClientController.clientById.value!.clientData!.shippingAddress!.state!;
    // ship_selectedCity.value=addNewClientController.clientById.value.sh
    update();
    refresh();
  }

  Rx<TextEditingController> nameBillController = TextEditingController().obs;
  Rx<TextEditingController> mobileBillNumController = TextEditingController().obs;
  Rx<TextEditingController> addressBillController = TextEditingController().obs;
  Rx<TextEditingController> zipBillController = TextEditingController().obs;

  Rx<TextEditingController> nameShipController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumShipController = TextEditingController().obs;
  Rx<TextEditingController> addressShipController = TextEditingController().obs;
  Rx<TextEditingController> zipShipController = TextEditingController().obs;

  var items = <Map<String, dynamic>>[].obs;

  RxList<Map<String, dynamic>> mycountryDataList = RxList<Map<String, dynamic>>();
  RxList<Map<String, dynamic>> mystateDataList = RxList<Map<String, dynamic>>();
  RxList<Map<String, dynamic>> mycityDataList = RxList<Map<String, dynamic>>();

  Rx<String?> selectedCity = Rx<String?>(null);
  Rx<String?> selectedState = Rx<String?>(null);
  Rx<String?> selectedCountry = Rx<String?>(null);

  Rx<String?> ship_selectedCity = Rx<String?>(null);
  Rx<String?> ship_selectedState = Rx<String?>(null);
  Rx<String?> ship_selectedCountry = Rx<String?>(null);

  Map<String, dynamic> requestData = {};
  CltBusinessInfoController businesscntlr = Get.find();
  AddNewClientController addnewcntlr = Get.find();

  RxList<Map<String, dynamic>> mycountryshipDataList = RxList<Map<String, dynamic>>();

  RxList<Map<String, dynamic>> mystateshipDataList = RxList<Map<String, dynamic>>();
  RxList<Map<String, dynamic>> mycityshipDataList = RxList<Map<String, dynamic>>();

  void submitProfileData(BuildContext context) {
    requestData['company'] = {
      'name': businesscntlr.companyNameController.value.text,
      'personName': businesscntlr.ownerNameController.value.text,
      'mobileNumber': businesscntlr.mobileNumberController.value.text,
      'alternativeMobileNumber': businesscntlr.alterMobileNumberController.value.text,
      'gstNumber': businesscntlr.gstController.value.text,
      'email': businesscntlr.businessEmailController.value.text,
      'website': businesscntlr.businessWebsiteController.value.text,
    };
    requestData['billingAddress'] = {
      'addressLine': addressBillController.value.text,
      'city': selectedCity.value,
      'state': selectedState.value,
      'country': selectedCountry.value,
      'postalCode': zipBillController.value.text,
    };

    if (isAddressSame) {
      requestData['shippingAddress'] = {
        'addressLine': addressBillController.value.text,
        'city': selectedCity.value,
        'state': selectedState.value,
        'country': selectedCountry.value,
        'postalCode': zipBillController.value.text,
      };
    } else {
      requestData['shippingAddress'] = {
        'addressLine': addressShipController.value.text,
        'city': ship_selectedCity.value,
        'state': ship_selectedState.value,
        'country': ship_selectedCountry.value,
        'postalCode': zipShipController.value.text,
      };
    }

    CltBusinessInfoController businessInfoController = Get.put(CltBusinessInfoController());

    var selectedphoto = businessInfoController.selectedPhoto == null ? "" : businessInfoController.selectedPhoto!.path;

    ApiCallAddNewClient(context: context, requestBody: requestData, filepath: selectedphoto);
  }

  ApiCallAddNewClient(
      {required BuildContext context, required Map<String, dynamic> requestBody, String? filepath}) async {
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
      "${ApiConstant.createUpdateClient}/:clientId",
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: form,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        showSuccessDialog(context, businesscntlr.companyNameController.value.text);

        Fluttertoast.showToast(msg: "Client Added Successfully");
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
      },
    );
  }

  showSuccessDialog(BuildContext context, String clientname) {
    Dialogs.materialDialog(
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      color: AppColor.primaryBlue.withOpacity(.20), borderRadius: BorderRadius.circular(3.r)),
                  child: Text(
                    clientname,
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
                  Get.back(closeOverlays: true);
                  Get.back();
                },
                title: "Close",
                textStyle:
                    TextStyle(color: AppColor.primaryBlue, fontSize: 16.sp, fontFamily: fontFamily, fontWeight: w600),
                backgroundColor: Colors.transparent,
                borderColor: AppColor.primaryBlue)
          ],
        )
      ],
    );
  }

  ApiGetAllCountry({required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    mycountryDataList.clear();
    mystateDataList.clear();
    mycityDataList.clear();
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getAllCountry,
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        List<dynamic> countryDataList = response['country_data'];
        for (var countryData in countryDataList) {
          Map<String, dynamic> dropdownItem = {
            'id': countryData['id'].toString(),
            'title': countryData['name'],
          };
          mycountryDataList.add(dropdownItem);
        }
        update();
        refresh();
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }

  ApiGetAllShipCountry({required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getAllCountry,
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        mycountryshipDataList.clear();
        mystateshipDataList.clear();
        mycityshipDataList.clear();
        List<dynamic> countryDataList = response['country_data'];
        for (var countryData in countryDataList) {
          Map<String, dynamic> dropdownItem = {
            'id': countryData['id'].toString(),
            'title': countryData['name'],
          };
          mycountryshipDataList.add(dropdownItem);
        }
        update();
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }

  setSelectedCountry(String value) {
    selectedCountry.value = value;
    update();

    ApiGetAllStates(context: Get.context!, countryId: int.parse(value.toString()));
    if (addNewClientController.id != null) {
      setSelectedState(addNewClientController.clientById.value!.clientData!.billingAddress!.state!);
      update();
    }
  }

  setSelectedState(String value) {
    selectedState.value = value;
    update();

    ApiGetAllCity(context: Get.context!, stateId: int.parse(value.toString()));
    if (addNewClientController.id != null) {
      selectedCity.value = addNewClientController.clientById.value!.clientData!.billingAddress!.city!.toString();
      update();
    }
  }

  ApiGetAllStates({required BuildContext context, int? countryId}) async {
    app.resolve<CustomDialogs>().showCircularDialog(context);
    mystateDataList.clear();
    mycityDataList.clear();
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getAllStates}/$countryId",
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        mystateDataList.clear();
        mycityDataList.clear();
        List<dynamic> statesDataList = response['states_data'];

        log(response.toString());
        for (var stateData in statesDataList) {
          Map<String, dynamic> stItem = {
            'id': stateData['id'].toString(),
            'title': stateData['name'],
          };

          log(stateData.toString());
          mystateDataList.add(stItem);
        }

        update();
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }

  ApiGetAllShipStates({required BuildContext context, int? countryId}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getAllStates}/$countryId",
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        mystateshipDataList.clear();
        mycityshipDataList.clear();
        List<dynamic> statesDataList = response['states_data'];
        for (var stateData in statesDataList) {
          Map<String, dynamic> dropdownItem = {
            'id': stateData['id'].toString(),
            'title': stateData['name'],
          };
          mystateshipDataList.add(dropdownItem);
        }

        update();
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }

  ApiGetAllCity({required BuildContext context, int? stateId}) async {
    app.resolve<CustomDialogs>().showCircularDialog(context);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getAllCities}/$stateId",
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        mycityDataList.clear();

        List<dynamic> statesDataList = response['city_data'];
        for (var stateData in statesDataList) {
          Map<String, dynamic> dropdownItem = {
            'id': stateData['id'].toString(),
            'title': stateData['name'],
          };
          mycityDataList.add(dropdownItem);
        }

        update();
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }

  ApiGetAllShipCity({required BuildContext context, int? stateId}) async {
    app.resolve<CustomDialogs>().showCircularDialog(context);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getAllCities}/$stateId",
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        mycityshipDataList.clear();

        List<dynamic> statesDataList = response['city_data'];
        for (var stateData in statesDataList) {
          Map<String, dynamic> dropdownItem = {
            'id': stateData['id'].toString(),
            'title': stateData['name'],
          };
          mycityshipDataList.add(dropdownItem);
        }

        update();
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }
}
