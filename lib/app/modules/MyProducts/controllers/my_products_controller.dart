import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/Models/get_all_products.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/network_client.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/custom_dialog.dart';

class MyProductsController extends GetxController {
  final count = 0.obs;

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    apiGetAllProducts(context: Get.context!);
    super.onInit();
  }

  RxBool isLoading = false.obs;
  RxList<ProductData> productList = <ProductData>[].obs;
  RxList<ProductData> filteredList = <ProductData>[].obs;

  void searchProducts(String searchQuery) {
    filteredList.clear();
    if (searchQuery.isEmpty) {
      // If search query is empty, show all products
      filteredList.addAll(productList);
    } else {
      // Filter products based on search query
      final lowercaseQuery = searchQuery.toLowerCase();
      filteredList.addAll(productList.where(
          (product) => product.name!.toLowerCase().contains(lowercaseQuery)));
    }

    update();
  }

  apiGetAllProducts({required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    productList.clear();
    isLoading = true.obs;

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getAllProducts,
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        isLoading = false.obs;
        log(response.toString());

        GetAllProducts getAllClients = GetAllProducts.fromJson(response);
        productList.value = getAllClients.productData!;
        update();
        searchController.clear();
        searchProducts("");
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        debugPrint("error");
      },
    );
  }

  apiDeleteProduct(
      {required BuildContext context, required String productId}) async {
    FocusScope.of(context).unfocus();

    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.products}/$productId",
      MethodType.Delete,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        Fluttertoast.showToast(msg: response['message']);

        Get.back();

        apiGetAllProducts(context: context);
      },
      failureCallback: (status, message) {},
    );
  }
}
