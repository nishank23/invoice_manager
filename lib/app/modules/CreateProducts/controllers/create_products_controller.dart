import 'dart:convert';
import 'dart:developer' show log;
import 'dart:io';

import 'package:dio/dio.dart' as DIO;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_generator/Models/getProduct.dart';
import 'package:path/path.dart' as path;

import '../../../../main.dart';
import '../../../../services/Connectivity/networkClient.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/countryPicker/CountryModelBottomSheetController.dart';
import '../../../global/widgets/custom_dialog.dart';

class CreateProductsController extends GetxController {
  String title = "Create New Product";
  Map<String, dynamic> mymap = Get.arguments ?? Map();

  bool isEdit = false;

  @override
  void onInit() {
    super.onInit();
    if (mymap['isEdit'] != null && mymap['isEdit']) {
      mymap['isEdit'] ? title = "Edit Product" : "";
      isEdit = true;
      ApiGetProduct(context: Get.context!, productId: mymap["id"]);
      refresh();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Rx<TextEditingController> productTitleController =
      TextEditingController().obs;
  Rx<TextEditingController> productPriceController =
      TextEditingController().obs;
  Rx<TextEditingController> productDescriptionController =
      TextEditingController().obs;

  final ImagePicker imagePicker = ImagePicker();

  RxString selected_Currency = "Select".obs;
  RxString selected_Symbol = "Rs".obs;

  showCurrencyPicker(BuildContext context) async {
    final countryModelBottomSheetController =
        Get.put(CountryModelBottomSheetController());

    final selectedCountry =
        await countryModelBottomSheetController.GetCountryModelSheet(
            context: context);
    if (selectedCountry != null) {
      // Handle the selected country
      print(selectedCountry.currency);

      selected_Currency.value = selectedCountry.currency.toString();
      selected_Symbol.value = selectedCountry.currencySymbol.toString();
      update();
    }
  }

  ApiAddProduct(
      {required BuildContext context,
      List<String>? filePaths,
      Map<String, dynamic>? formData}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    final form = DIO.FormData();

    if (filePaths != null && filePaths.isNotEmpty) {
      for (final filePath in filePaths) {
        final file = await DIO.MultipartFile.fromFile(
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

        log("myvalues" + value.toString());
      } else {
        log("my" + value.toString());
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
        print("error");
      },
    );
  }

  ApiEditProduct(
      {required BuildContext context,
      List<String>? filePaths,
      Map<String, dynamic>? formData}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    final form = DIO.FormData();

    if (filePaths != null && filePaths.isNotEmpty) {
      for (final filePath in filePaths) {
        final file = await DIO.MultipartFile.fromFile(
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

        log("myvalues" + value.toString());
      } else {
        log("my" + value.toString());
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
        print("error");
      },
    );
  }

  GetProduct? editProduct;
  RxList<File>? imageFileList = <File>[].obs;

  ApiGetProduct({required BuildContext context, dynamic productId}) async {
    FocusScope.of(context).unfocus();

    return NetworkClient.getInstance.callApiForm(
      context,
      baseURL,
      "${ApiConstant.products}/${productId}",
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
        selected_Currency.value = editProduct!.productCurrency.toString();
        selected_Symbol.value = editProduct!.currencySymbol.toString();

        for (String imageUrl in editProduct!.images!) {
          FileInfo? fileInfo =
              await DefaultCacheManager().getFileFromCache(imageUrl);
          if (fileInfo == null || !await fileInfo.file.exists()) {
            // Image not found in cache, download and cache it
            fileInfo =
                await DefaultCacheManager().downloadFile(ibaseURL + imageUrl);
          }
          if (fileInfo != null) {
            // Add the cached image file to your list
            imageFileList!.add(fileInfo.file);
          }
        }

        update();
        refresh();
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }
}
