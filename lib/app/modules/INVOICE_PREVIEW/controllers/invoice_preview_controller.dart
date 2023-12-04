import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:invoice_generator/Models/estimatePreviewModel.dart';
import 'package:invoice_generator/app/modules/InvoicePdf/views/invoice_pdf_view.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/networkClient.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/custom_dialog.dart';

class InvoicePreviewController extends GetxController {
  //TODO: Implement InvoicePreviewController
  final count = 0.obs;
  String? id;

  @override
  void onInit() {
    super.onInit();

    id = Get.arguments;
    ApiEstimatePreview(context: Get.context!, invoiceId: id);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  RxBool isLoading = false.obs;

  EstimatePreviewModel? estimatePreviewModel;
  Estimation? estimation;
  Userprofile? userprofile;

  ApiEstimatePreview(
      {required BuildContext context, String? invoiceId}) async {
    FocusScope.of(context).unfocus();

    isLoading = true.obs;
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getEstPreview}/$invoiceId",
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
        print("error");
      },
    );
  }

  ApiEstimatePdfView(
      {required BuildContext context, String? invoiceId}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getEstPdf}/$invoiceId",
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        isLoading = false.obs;
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        Uint8List pdfData = Uint8List.fromList(utf8.encode(response));
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
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
