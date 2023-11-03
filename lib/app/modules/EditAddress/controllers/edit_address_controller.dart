import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/network_client.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/custom_dialog.dart';

class EditAddressController extends GetxController {
  late Map<String, dynamic> arguments;
  late String id;
  late String title;

  final count = 0.obs;

  @override
  void onInit() {
    arguments = Get.arguments;
    id = arguments['id'];
    title = arguments['title'];
    debugPrint(id);
    debugPrint(title);
    super.onInit();
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
        debugPrint("error");
      },
    );
  }

  apiGetAllCity({required BuildContext context, int? stateId}) async {
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
        debugPrint("error");
      },
    );
  }
}
