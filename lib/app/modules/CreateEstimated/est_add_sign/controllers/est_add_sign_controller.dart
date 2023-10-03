// ignore_for_file: use_build_context_synchronously, unnecessary_string_interpolations, avoid_print, unnecessary_overrides, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/CreateEstimated/controllers/create_estimated_controller.dart';
import 'package:invoice_generator/app/modules/Estimated/controllers/estimated_controller.dart';
import 'package:invoice_generator/app/routes/app_pages.dart';
import 'package:path/path.dart' as path;

import 'package:dio/dio.dart' as DIO;
import '../../../../../main.dart';
import '../../../../../services/Connectivity/networkClient.dart';
import '../../../../global/constants/api_const.dart';
import '../../../../global/widgets/ImagePickerDialog.dart';
import '../../../../global/widgets/custom_dialog.dart';

class EstAddSignController extends GetxController {
  CreateEstimatedController createEstimatedController = Get.put(CreateEstimatedController());
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // createEstimatedController.ApiEstimatePreview(context: Get.context!);
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

  ApiCreateEstimate({required BuildContext context, String? filePaths, Map<String, dynamic>? formData}) async {
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

    return NetworkClient.getInstance.callApiForm(
      context,
      baseURL,
      "${ApiConstant.createEst}",
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: form,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        print(response["data"]["_id"]);
        Get.offNamed(Routes.ESTIMATE_PREVIEW, arguments: response["data"]["_id"]);

        Fluttertoast.showToast(msg: "Estimate Created Successfully");
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }
}
