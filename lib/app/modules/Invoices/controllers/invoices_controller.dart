import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Models/getAllInvoice.dart';
import '../../../../main.dart';
import '../../../../services/Connectivity/networkClient.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/custom_dialog.dart';

class InvoicesController extends GetxController {
  //TODO: Implement InvoicesController

  final count = 0.obs;

  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    ApiGetAllEstimate(context: Get.context!);
  }

  @override
  void onClose() {
    super.onClose();
  }

  Rx<TextEditingController> searchController = TextEditingController().obs;

  RxList<Data> myEstimatelist = <Data>[].obs;


  RxBool isLoading = false.obs;


  ApiGetAllEstimate({required BuildContext context}) async {
    FocusScope.of(context).unfocus();

/*
    app.resolve<CustomDialogs>().showCircularDialog(context);
*/
    isLoading = true.obs;
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getInvByUser,
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
/*
        app.resolve<CustomDialogs>().hideCircularDialog(context);
*/
        myEstimatelist.clear();
        isLoading = false.obs;

        GetAllInvoice getAllClients = GetAllInvoice.fromJson(response);
        myEstimatelist.value = getAllClients.data!;


        update();
      },
      failureCallback: (status, message) {
        isLoading = false.obs;

/*
        app.resolve<CustomDialogs>().hideCircularDialog(context);
*/

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }

  String convertDateFormat(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat dateFormat = DateFormat('dd MMM, yyyy');
    String formattedDate = dateFormat.format(dateTime);
    return formattedDate;
  }


  apiDeleteClient({required BuildContext context, required String clientId}) {
    FocusScope.of(context).unfocus();
    isLoading = true.obs;
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      '${ApiConstant.editInv}/$clientId',
      MethodType.Delete,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        isLoading = false.obs;
        app.resolve<CustomDialogs>().getDialog(title: 'Success', desc: message);
        log(response.toString());
        ApiGetAllEstimate(context: context);
      },
      failureCallback: (message, statusCode) {
        isLoading = false.obs;
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
      },
    );
  }


}

