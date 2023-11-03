

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:invoice_generator/Models/estimate_preview_model.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/network_client.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/custom_dialog.dart';

class EstimatePreviewController extends GetxController {

  final count = 0.obs;
  String? id;
  @override
  void onInit() {
    super.onInit();

    id = Get.arguments;
    apiEstimatePreview(context: Get.context!, estimateId: id);
  }

  void increment() => count.value++;

  RxBool isLoading = false.obs;

  EstimatePreviewModel? estimatePreviewModel;
  Estimation? estimation;
  Userprofile? userprofile;

  apiEstimatePreview(
      {required BuildContext context, String? estimateId}) async {
    FocusScope.of(context).unfocus();

    isLoading = true.obs;
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getEstPreview}/$estimateId",
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        isLoading = false.obs;

        estimatePreviewModel = EstimatePreviewModel.fromJson(response);

        estimation = estimatePreviewModel!.estimation!;
        userprofile = estimatePreviewModel!.userprofile!;
        update();
      },
      failureCallback: (status, message) {
        isLoading = false.obs;

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
      },
    );
  }

  apiEstimatePdfView(
      {required BuildContext context, String? estimateId}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getEstPdf}/$estimateId",
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        isLoading = false.obs;
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        // Uint8List pdfData = Uint8List.fromList(utf8.encode(response));
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
      },
    );
  }

  String formatPriceWithThousandSeparator(String pricesymbol, num price) {
    NumberFormat numberFormat = NumberFormat.currency(
      symbol: pricesymbol,
      decimalDigits: 0,
    );
    return numberFormat.format(price);
  }
}
