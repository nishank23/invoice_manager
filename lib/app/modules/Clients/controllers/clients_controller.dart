import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/Models/get_all_clients.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/network_client.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/custom_dialog.dart';

class ClientsController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    apiGetAllClients(context: Get.context!);
    super.onInit();
  }

  Rx<TextEditingController> searchController = TextEditingController().obs;

  RxBool isLoading = false.obs;
  RxList<ClientData> clientList = <ClientData>[].obs;
  RxList<ClientData> filteredList = <ClientData>[].obs;

  void searchClients(String searchQuery) {
    filteredList.clear();
    if (searchQuery.isEmpty) {
      // If search query is empty, show all products
      filteredList.addAll(clientList);
    } else {
      // Filter products based on search query
      final lowercaseQuery = searchQuery.toLowerCase();
      filteredList.addAll(clientList.where((client) =>
          client.company!.personName!.toLowerCase().contains(lowercaseQuery)));
    }

    update();
  }

  apiGetAllClients({required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    clientList.clear();
    isLoading = true.obs;
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getAllClients,
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        isLoading = false.obs;
        log(response.toString());

        GetAllClients getAllClients = GetAllClients.fromJson(response);
        clientList.value = getAllClients.clientData!;
        update();

        searchController.value.clear();
        searchClients("");
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
      },
    );
  }
}
