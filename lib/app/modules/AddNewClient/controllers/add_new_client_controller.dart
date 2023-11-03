// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/Models/client_by_id_model.dart';
import 'package:invoice_generator/app/global/constants/api_const.dart';
import 'package:invoice_generator/app/modules/AddNewClient/clt_addressInfo/views/clt_address_info_view.dart';
import 'package:invoice_generator/app/modules/AddNewClient/clt_businessInfo/views/clt_business_info_view.dart';
import 'package:invoice_generator/services/Connectivity/network_client.dart';

class AddNewClientController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? tabController;
  Rx<ClientDataById?> clientById = Rxn<ClientDataById>(null);
  final count = 0.obs;
  String? id = Get.arguments;
  RxBool hasData = false.obs;
  @override
  void onInit() {
    tabController = TabController(length: myTabs.length, vsync: this);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    if (id != null) {
      await callApiForGetClientById(context: Get.context!, id: id.toString());
      //get client by id
    }
  }

  callApiForGetClientById({required BuildContext context, required String id}) {
    FocusScope.of(context).unfocus();

    return NetworkClient.getInstance.callApi(
        context, baseURL, "${ApiConstant.getAllClients}/$id", MethodType.Get,
        headers: NetworkClient.getInstance.getAuthHeaders(),
        successCallback: (response, message) async {
      ClientDataByIdModel eventData = ClientDataByIdModel.fromJson(response);
      clientById.value = eventData.clientDataById;

      hasData.value = true;
      debugPrint("::::::::::::::::::::$response");
    }, failureCallback: (status, message) {
      hasData.value = true;
    });
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
  ].obs;

  final screens = [
    CltBusinessInfoView(),
    CltAddressInfoView(),
  ];
}
