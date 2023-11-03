import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/BusinessInfo/controllers/business_info_controller.dart';
import 'package:material_dialogs/dialogs.dart';

import '../../../../../main.dart';
import '../../../../../services/Connectivity/network_client.dart';
import '../../../../global/constants/api_const.dart';
import '../../../../global/constants/app_asset.dart';
import '../../../../global/constants/app_color.dart';
import '../../../../global/constants/app_fonts.dart';
import '../../../../global/widgets/custom_dialog.dart';
import '../../../../global/widgets/my_button.dart';

class ProfileAddressController extends GetxController {
  final count = 0.obs;

  bool isClient = false;

  @override
  void onReady() {
    super.onReady();
    apiGetAllCountry(context: Get.context!);
  }

  Rx<TextEditingController> nameBillController = TextEditingController().obs;
  Rx<TextEditingController> mobileBillNumController =
      TextEditingController().obs;
  Rx<TextEditingController> addressBillController = TextEditingController().obs;
  Rx<TextEditingController> zipBillController = TextEditingController().obs;

  Rx<TextEditingController> nameShipController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumShipController =
      TextEditingController().obs;
  Rx<TextEditingController> addressShipController = TextEditingController().obs;
  Rx<TextEditingController> zipShipController = TextEditingController().obs;

  var items = <Map<String, dynamic>>[].obs;

  RxList<Map<String, dynamic>> dropdownItems = [
    {
      'id': '1',
      'title': 'Item 1',
    },
    {
      'id': '2',
      'title': 'Item 2',
    },
    {
      'id': '3',
      'title': 'Item 3',
    },
  ].obs;

  RxList<Map<String, dynamic>> mycountryDataList =
      RxList<Map<String, dynamic>>();
  RxList<Map<String, dynamic>> mystateDataList = RxList<Map<String, dynamic>>();
  RxList<Map<String, dynamic>> mycityDataList = RxList<Map<String, dynamic>>();

  RxString? selectedCity = "".obs;
  RxString? selectedState = "".obs;
  RxString? selectedCountry = "".obs;

  RxString? shipSelectedCity = "".obs;
  RxString? shipSelectedState = "".obs;
  RxString? shipSelectedCountry = "".obs;

  Map<String, dynamic> requestData = {};
  BusinessInfoController businesscntlr = Get.find();

  RxList<Map<String, dynamic>> mycountryshipDataList =
      RxList<Map<String, dynamic>>();

  RxList<Map<String, dynamic>> mystateshipDataList =
      RxList<Map<String, dynamic>>();
  RxList<Map<String, dynamic>> mycityshipDataList =
      RxList<Map<String, dynamic>>();

  void submitProfileData(BuildContext context) {
    requestData['clientPhoto'] = businesscntlr.selectedPhoto;
    requestData['company'] = {
      'name': businesscntlr.companyNameController.value.text,
      'personName': businesscntlr.ownerNameController.value.text,
      'mobileNumber': businesscntlr.mobileNumberController.value.text,
      'alternativeMobileNumber':
          businesscntlr.alterMobileNumberController.value.text,
      'gstNumber': businesscntlr.gstController.value.text,
      'email': businesscntlr.businessEmailController.value.text,
      'website': businesscntlr.businessWebsiteController.value.text,
    };
    requestData['billingAddress'] = {
      'addressLine': addressBillController.value.text,
      'city': selectedCity!.value,
      'state': selectedState!.value,
      'country': selectedCountry!.value,
      'postalCode': zipBillController.value.text,
    };
    requestData['shippingAddress'] = {
      'addressLine': addressShipController.value.text,
      'city': shipSelectedCity!.value,
      'state': shipSelectedState!.value,
      'country': shipSelectedCountry!.value,
      'postalCode': zipShipController.value.text,
    };

    apiCallAddNewClient(context: context, requestBody: requestData);
  }

  apiCallAddNewClient(
      {required BuildContext context,
      required Map<String, dynamic> requestBody}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.createUpdateClient}/:clientId",
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: requestBody,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        showSuccessDialog(
            context, businesscntlr.companyNameController.value.text);

        Fluttertoast.showToast(msg: "Client Added Successfully");
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
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
                      color: AppColor.primaryBlue.withOpacity(.20),
                      borderRadius: BorderRadius.circular(3.r)),
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
    );
  }

  apiGetAllCountry({required BuildContext context}) async {
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
        debugPrint("error");
      },
    );
  }

  apiGetAllStates({required BuildContext context, int? countryId}) async {
    FocusScope.of(context).unfocus();
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

        List<dynamic> statesDataList = response['states_data'];

        log(response.toString());
        for (var stateData in statesDataList) {
          Map<String, dynamic> stItem = {
            'id': stateData['id'].toString(),
            'title': stateData['name'],
          };
          mystateDataList.add(stItem);
        }

        update();
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
      },
    );
  }

  apiGetAllShipStates(
      {required BuildContext context, String? countryId}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    mystateshipDataList.clear();
    mycityshipDataList.clear();

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getAllStates}/$countryId",
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

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
        debugPrint("error");
      },
    );
  }

  apiGetAllCity({required BuildContext context, int? stateId}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    mycityDataList.clear();

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getAllCities}/$stateId",
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

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
        debugPrint("error");
      },
    );
  }

  apiGetAllShipCity({required BuildContext context, String? stateId}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    mycityshipDataList.clear();

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getAllCities}/$stateId",
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

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
        debugPrint("error");
      },
    );
  }
}
