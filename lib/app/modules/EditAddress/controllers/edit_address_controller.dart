import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../Models/client_by_id_model.dart';
import '../../../../main.dart';
import '../../../../services/Connectivity/networkClient.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/custom_dialog.dart';

class EditAddressController extends GetxController {
  Map<String, dynamic>? arguments   ;
  String? title;
  ClientData? clientData;

  final count = 0.obs;

  @override
  void onInit() {

    super.onInit();
  }

  @override
  Future<void> onReady() async {

    super.onReady();
    arguments = Get.arguments;
    title = arguments!['title'];
    clientData = arguments!['model'];
    print("mytitle = ${arguments!['title']}");

    debugPrint(jsonEncode(clientData));
    await ApiGetAllCountry(context: Get.context!);

    if (Get.arguments != null) {
      nameBillController.value.text = clientData!.company!.name.toString() ;
      mobileBillNumController.value.text =
          clientData!.company!.mobileNumber.toString();
      getData();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  RxList<Map<String, dynamic>> mycountryDataList =
      RxList<Map<String, dynamic>>();
  RxList<Map<String, dynamic>> mystateDataList = RxList<Map<String, dynamic>>();
  RxList<Map<String, dynamic>> mycityDataList = RxList<Map<String, dynamic>>();

  Rx<TextEditingController> nameBillController = TextEditingController().obs;
  Rx<TextEditingController> mobileBillNumController =
      TextEditingController().obs;
  Rx<TextEditingController> addressBillController = TextEditingController().obs;
  Rx<TextEditingController> zipBillController = TextEditingController().obs;

  Rx<String?> selectedCity = Rx<String?>(null);
  Rx<String?> selectedState = Rx<String?>(null);
  Rx<String?> selectedCountry = Rx<String?>(null);

  getData() {
    if (title == "Billing Address") {
      addressBillController.value.text =
          clientData!.billingAddress!.addressLine.toString();
      zipBillController.value.text = clientData!.billingAddress!.postalCode.toString();
      selectedCity.value = clientData!.billingAddress!.city!;
      selectedState.value = clientData!.billingAddress!.state!;
      selectedCountry.value = clientData!.billingAddress!.country!;
    } else if (title == "Shipping Address") {
      addressBillController.value.text =
          clientData!.shippingAddress!.addressLine.toString();
      zipBillController.value.text =
          clientData!.shippingAddress!.postalCode.toString();
      selectedCity.value = clientData!.shippingAddress!.city!;
      selectedState.value = clientData!.shippingAddress!.state!;
      selectedCountry.value = clientData!.shippingAddress!.country!;

    }
    update();
    Fluttertoast.showToast(msg: selectedCountry.value.toString());

    setSelectedCountry(selectedCountry.value.toString());
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
    ApiGetAllStates(context: Get.context!, countryId: int.parse(value.toString()));
    if (clientData!.id != null) {
      setSelectedState(clientData!.billingAddress!.state!);
      update();
    }
  }

  setSelectedState(String value) {
    selectedState.value = value;

    ApiGetAllCity(context: Get.context!, stateId: int.parse(value.toString()));
    if (clientData!.id != null) {
      selectedCity.value = clientData!.billingAddress!.city!.toString();
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
}
