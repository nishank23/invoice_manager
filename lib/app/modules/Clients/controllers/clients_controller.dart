import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/Models/getAllClients.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/networkClient.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/custom_dialog.dart';

class ClientsController extends GetxController {
  //TODO: Implement ClientsController

  final count = 0.obs;
  @override
  void onInit() {
    ApiGetAllClients(context: Get.context!);
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

  ApiGetAllClients({required BuildContext context}) async {
    clientList.value.clear();
    isLoading = true.obs;
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getAllClients}",
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
        print("error");
      },
    );
  }

  apiDeleteClient({required BuildContext context, required String clientId}) {
    FocusScope.of(context).unfocus();
    isLoading = true.obs;
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      '${ApiConstant.getAllClients}/$clientId',
      MethodType.Delete,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        isLoading = false.obs;
        app.resolve<CustomDialogs>().getDialog(title: 'Success', desc: message);
        log(response.toString());
        ApiGetAllClients(context: context);
      },
      failureCallback: (message, statusCode) {
        isLoading = false.obs;
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
      },
    );
  }
}
