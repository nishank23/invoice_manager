// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer' show log;
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_generator/Models/get_product.dart';
import 'package:path/path.dart' as path;

import '../../../../main.dart';
import '../../../../services/Connectivity/network_client.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/countryPicker/country_model_bottomsheet_controller.dart';
import '../../../global/widgets/custom_dialog.dart';

class CreateProductsController extends GetxController {
  String title = "Create New Product";
  Map<String, dynamic> mymap = Get.arguments ?? {};

  bool isEdit = false;

  @override
  void onInit() {
    super.onInit();
    if (mymap['isEdit'] != null && mymap['isEdit']) {
      mymap['isEdit'] ? title = "Edit Product" : "";
      isEdit = true;
      apiGetProduct(context: Get.context!, productId: mymap["id"]);
      refresh();
    }
  }

  Rx<TextEditingController> productTitleController =
      TextEditingController().obs;
  Rx<TextEditingController> productPriceController =
      TextEditingController().obs;
  Rx<TextEditingController> productDescriptionController =
      TextEditingController().obs;

  final ImagePicker imagePicker = ImagePicker();

  RxString selectedCurrency = "Select".obs;
  RxString selectedSymbol = "Rs".obs;

  showCurrencyPicker(BuildContext context) async {
    final countryModelBottomSheetController =
        Get.put(CountryModelBottomSheetController());

    final selectedCountry = await countryModelBottomSheetController
        .getCountryModelSheet(context: context);
    if (selectedCountry != null) {
      // Handle the selected country
      debugPrint(selectedCountry.currency);

      selectedCurrency.value = selectedCountry.currency.toString();
      selectedSymbol.value = selectedCountry.currencySymbol.toString();
      update();
    }
  }

  apiAddProduct(
      {required BuildContext context,
      List<String>? filePaths,
      Map<String, dynamic>? formData}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    final form = dio.FormData();

    if (filePaths != null && filePaths.isNotEmpty) {
      for (final filePath in filePaths) {
        final file = await dio.MultipartFile.fromFile(
          filePath,
          filename: path.basename(filePath),
        );
        form.files.add(MapEntry('images', file));
      }
    } else {
      // Handle case when filePaths is null or empty
    }
    formData!.forEach((key, value) {
      if (value is List<Map<String, dynamic>>) {
        final jsonString = jsonEncode(value);
        form.fields.add(MapEntry(key, jsonString));

        log("myvalues$value");
      } else {
        log("my$value");
        form.fields.add(MapEntry(key, value.toString()));
      }
    });

    return NetworkClient.getInstance.callApiForm(
      context,
      baseURL,
      "${ApiConstant.createUpdateProduct}/",
      MethodType.Post,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: form,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        Get.back();

        Fluttertoast.showToast(msg: "Product Added Successfully");
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
      },
    );
  }

  apiEditProduct(
      {required BuildContext context,
      List<String>? filePaths,
      Map<String, dynamic>? formData}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    final form = dio.FormData();

    if (filePaths != null && filePaths.isNotEmpty) {
      for (final filePath in filePaths) {
        final file = await dio.MultipartFile.fromFile(
          filePath,
          filename: path.basename(filePath),
        );
        form.files.add(MapEntry('images', file));
      }
    } else {
      // Handle case when filePaths is null or empty
    }
    formData!.forEach((key, value) {
      if (value is List<Map<String, dynamic>>) {
        final jsonString = jsonEncode(value);
        form.fields.add(MapEntry(key, jsonString));

        log("myvalues$value");
      } else {
        log("my$value");
        form.fields.add(MapEntry(key, value.toString()));
      }
    });

    return NetworkClient.getInstance.callApiForm(
      context,
      baseURL,
      "${ApiConstant.products}/${formData["_id"]}",
      MethodType.Put,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      params: form,
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);
        Get.back();

        Fluttertoast.showToast(msg: "Product Added Successfully");
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
      },
    );
  }

  GetProduct? editProduct;
  RxList<File>? imageFileList = <File>[].obs;

  apiGetProduct({required BuildContext context, dynamic productId}) async {
    FocusScope.of(context).unfocus();

    return NetworkClient.getInstance.callApiForm(
      context,
      baseURL,
      "${ApiConstant.products}/$productId",
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) async {
        log(response.toString());

        GetProduct myproduct = GetProduct.fromJson(response);
        editProduct = myproduct;

        productTitleController.value.text = editProduct!.name.toString();
        productDescriptionController.value.text =
            editProduct!.description.toString();
        productPriceController.value.text = editProduct!.price.toString();
        selectedCurrency.value = editProduct!.productCurrency.toString();
        selectedSymbol.value = editProduct!.currencySymbol.toString();

        for (String imageUrl in editProduct!.images!) {
          FileInfo? fileInfo =
              await DefaultCacheManager().getFileFromCache(imageUrl);
          if (fileInfo == null || !await fileInfo.file.exists()) {
            // Image not found in cache, download and cache it
            fileInfo =
                await DefaultCacheManager().downloadFile(ibaseURL + imageUrl);
          }
          // Add the cached image file to your list
          imageFileList!.add(fileInfo.file);
        }

        update();
        refresh();
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
      },
    );
  }
}
