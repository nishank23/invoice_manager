import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/InvoiceAddClient/controllers/invoice_add_client_controller.dart';

import '../../../../Models/client_by_id_model.dart';
import '../../../../services/Connectivity/networkClient.dart';
import '../../../global/constants/api_const.dart';

class InvoiceAddressController extends GetxController {
  //TODO: Implement InvoiceAddressController

  final count = 0.obs;
  InvoiceAddClientController addClientController =
      Get.find<InvoiceAddClientController>();

  Rx<ClientByIdModel?> clientById = Rxn<ClientByIdModel>(null);

RxBool isLoading =true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    if (addClientController.selectedAddClient.value != null) {
      await callApiForGetClientById(
          context: Get.context!,
          id: addClientController.selectedAddClient.value.toString());

      //get client by id
    }
    update();
    refresh();
  }

  @override
  void onClose() {
    super.onClose();
  }

  callApiForGetClientById({required BuildContext context, required String id}) {
    FocusScope.of(context).unfocus();

    return NetworkClient.getInstance.callApi(
        context, baseURL, "${ApiConstant.getAllClients}/$id", MethodType.Get,
        headers: NetworkClient.getInstance.getAuthHeaders(),
        successCallback: (response, message) async {
          isLoading.value = false;
          ClientByIdModel eventData = ClientByIdModel.fromJson(response);
          clientById.value = eventData ;

      print("::::::::::::::::::::$response");
    }, failureCallback: (status, message) {});
  }
}
