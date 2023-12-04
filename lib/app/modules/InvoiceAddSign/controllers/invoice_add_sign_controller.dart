// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:path/path.dart' as path;

import '../../../../main.dart';
import '../../../../services/Connectivity/networkClient.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/custom_dialog.dart';
import '../../../routes/app_pages.dart';
import '../../CreateInvoice/controllers/create_invoice_controller.dart';

class InvoiceAddSignController extends GetxController {
  //TODO: Implement InvoiceAddSignController


  CreateInvoiceController createInvoicedController =
  Get.put(CreateInvoiceController());
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // createInvoicedController.ApiInvoicePreview(context: Get.context!);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  File? selectedSign;

  ApiCreateInvoice(
      {required BuildContext context,
        String? filePaths,
        Map<String, dynamic>? formData}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    final form = DIO.FormData();

    if (filePaths != null && filePaths.isNotEmpty) {
      final file = await DIO.MultipartFile.fromFile(
        filePaths,
        filename: path.basename(filePaths),
      );
      form.files.add(MapEntry('file', file));
    }

    formData!.forEach((key, value) {
      if (value is List<Map<String, dynamic>>) {
        print(jsonEncode("jsonString = $value"));
        final jsonString = jsonEncode(value);
        form.fields.add(MapEntry(key, jsonString));
      } else if(value is Map<String, dynamic>){
        final jsonString = jsonEncode(value);
        form.fields.add(MapEntry<String, String>(key, jsonString));
        /*form.fields.add(MapEntry(key, value));*/
      }else{
        form.fields.add(MapEntry(key, value));
      }
    });

    return NetworkClient.getInstance.callApiForm(
      context,
      baseURL,
      ApiConstant.createInv,
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: form,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        print(response["data"]["_id"]);
        Get.offNamed(Routes.INVOICE_PREVIEW,
            arguments: response["data"]["_id"]);

        Fluttertoast.showToast(msg: "Invoice Created Successfully");
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }

  ApiEditInvoice(
      {required BuildContext context,
        required String id,
        String? filePaths,
        Map<String, dynamic>? formData}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    final form = DIO.FormData();

    if (filePaths != null && filePaths.isNotEmpty) {
      final file = await DIO.MultipartFile.fromFile(
        filePaths,
        filename: path.basename(filePaths),
      );
      form.files.add(MapEntry('file', file));
    }

    formData!.forEach((key, value) {
      if (value is List<Map<String, dynamic>>) {
        final jsonString = jsonEncode(value);
        form.fields.add(MapEntry(key, jsonString));
      } else {
        form.fields.add(MapEntry(key, value));
      }
    });
    debugPrint("Edit Invoice API Url ==> $baseURL${ApiConstant.editInv}/$id");
    return NetworkClient.getInstance.callApiForm(
      context,
      baseURL,
      "${ApiConstant.editInv}/$id",
      MethodType.Put,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: form,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        print(response["data"]["_id"]);
        Get.offNamed(Routes.INVOICE_PREVIEW,
            arguments: response["data"]["_id"]);

        Fluttertoast.showToast(msg: "Invoice Edited Successfully");
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }
}
