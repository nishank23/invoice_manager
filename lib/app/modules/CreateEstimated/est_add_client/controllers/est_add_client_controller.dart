import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/CreateEstimated/est_add_items/controllers/est_add_items_controller.dart';

import '../../../../../Models/estimate_preview_model.dart';
import '../../../../../Models/get_all_clients.dart';
import '../../../../../Models/get_all_country.dart';
import '../../../../../main.dart';
import '../../../../../services/Connectivity/network_client.dart';
import '../../../../global/constants/api_const.dart';
import '../../../../global/widgets/countryPicker/country_model_bottomsheet_controller.dart';
import '../../../../global/widgets/custom_dialog.dart';
import '../../controllers/create_estimated_controller.dart';

class EstAddClientController extends GetxController {
  final count = 0.obs;

  DateTime? selectedDate;
  CreateEstimatedController parentCon = Get.find();

  @override
  void onReady() {
    apiGetAllClients(context: Get.context!);

    ever(parentCon.estimation, (callback) => onEdit(callback!));
/*
    onEdit();
*/
    super.onReady();
  }

  String? selectedCountryIcon = "🌐";

  RxList<Map<String, dynamic>> myClientList = RxList<Map<String, dynamic>>();

  Rx<TextEditingController> companyNameController = TextEditingController().obs;

  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> currencyController = TextEditingController().obs;

  Rx<String?> selectedCity = Rx<String?>(null);
  Rx<String?> selectedState = Rx<String?>(null);
  Rx<String?> selectedAddClient = Rx<String?>(null);
  Rx<String?> selectedCurrency = Rx<String?>(null);
  final RxList<CountryData> countryData = <CountryData>[].obs;

  Future getCountryData({required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    countryData.clear();

    await NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getAllCountry,
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) async {
        GetAllCountry allCountry = GetAllCountry.fromJson(response);
        countryData.value = allCountry.countryData!;

        update();
        refresh();
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
      },
    );
  }

  void editCountry(CountryData? selectedCountry) {
    if (selectedCountry != null) {
      selectedCurrency.value = selectedCountry.currencySymbol.toString();

      final addcontroller = Get.put(EstAddItemsController());

      String myselectedSymbol = "Flat ($selectedCurrency)";

      if (addcontroller.menuItems.length == 1) {
        addcontroller.menuItems.add(myselectedSymbol);
      } else {
        addcontroller.menuItems[1] = myselectedSymbol;
      }

      selectedCountryIcon = selectedCountry.emoji.toString();
      currencyController.value.text =
          "${selectedCountry.currencySymbol}  ${selectedCountry.currency}";
      update();
    }
  }

  CountryData? selectedCountry;
  Future<void> pickCountry(BuildContext context) async {
    final countryModelBottomSheetController =
        Get.put(CountryModelBottomSheetController());

    selectedCountry = await countryModelBottomSheetController
        .getCountryModelSheet(context: context);
    if (selectedCountry != null) {
      selectedCurrency.value = selectedCountry!.currencySymbol.toString();

      final addcontroller = Get.put(EstAddItemsController());

      String myselectedSymbol = "Flat ($selectedCurrency)";

      if (addcontroller.menuItems.length == 1) {
        addcontroller.menuItems.add(myselectedSymbol);
      } else {
        addcontroller.menuItems[1] = myselectedSymbol;
      }

      selectedCountryIcon = selectedCountry!.emoji.toString();
      currencyController.value.text =
          "${selectedCountry!.currencySymbol}  ${selectedCountry!.currency}";
      update();
    }
  }

  RxList<ClientData> clientList = <ClientData>[].obs;

  apiGetAllClients({required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getAllClients,
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        myClientList.clear();
        clientList.clear();

        GetAllClients getAllClients = GetAllClients.fromJson(response);
        clientList.value = getAllClients.clientData!;
        List<dynamic> countryDataList = response['clientData'];
        for (var countryData in countryDataList) {
          Map<String, dynamic> dropdownItem = {
            'id': countryData['_id'].toString(),
            'title': countryData['company']['personName'],
          };
          myClientList.add(dropdownItem);
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

  onEdit(Estimation est) {
    selectedAddClient.value = est.client!.id.toString();
    currencyController.value;

    dateController.value.text =
        est.estimationDate.toString().toString().substring(0, 10);
    getCountryData(context: Get.context!).then((value) {
      for (var data in countryData) {
        if (data.id.toString() == est.currencyId) {
          editCountry(data);
          selectedCountry = data;
        }
      }
    });
    update();
  }
}
