import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/Models/getAllCountry.dart';
import 'package:invoice_generator/Models/getAllProducts.dart';
import 'package:invoice_generator/app/global/constants/app_asset.dart';
import 'package:invoice_generator/app/global/widgets/mytextfiled.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/networkClient.dart';
import '../../constants/api_const.dart';
import '../../constants/app_color.dart';
import '../../constants/app_fonts.dart';
import '../custom_dialog.dart';

class AddProductBottomSheetController extends GetxController {
  final RxList<ProductData> productData = <ProductData>[].obs;
  final RxList<ProductData> filteredProductData = <ProductData>[].obs;
  final TextEditingController searchController = TextEditingController();
  final RxList<ProductData> addedProductsList = <ProductData>[].obs;

  @override
  void onInit() {
    super.onInit();
/*
    GetProductBottomSheett(context: Get.context!,myalreadyadded: null);
*/
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<List<ProductData>?> GetProductBottomSheett(
      {required BuildContext context,required List <ProductData>? myalreadyadded}) async {
    FocusScope.of(context).unfocus();
    productData.clear();
    Completer<List<ProductData>?> completer = Completer<List<ProductData>?>();

    await NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getAllProducts,
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) async {
       GetAllProducts allProducts = GetAllProducts.fromJson(response);
        productData.value = allProducts.productData!;

        for(int i =0 ;i<productData.value.length;i++){
          for(int j =0;j<myalreadyadded!.length;j++){
            if(productData[i].id==myalreadyadded[j].id){
              productData[i].sisAdded=true;

            }
          }
        }



        final addedProducts =
            await showCountryModelBottomSheet(context, productData.value);

        completer.complete(addedProducts);
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
        completer.complete(null);
      },
    );
    return completer.future;
  }





  Future<List<ProductData>?> editProducts(
      {required BuildContext context,required List <ProductData>? myalreadyadded}) async {
    FocusScope.of(context).unfocus();
    productData.clear();
    Completer<List<ProductData>?> completer = Completer<List<ProductData>?>();

    await NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getAllProducts,
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) async {
       GetAllProducts allProducts = GetAllProducts.fromJson(response);
        productData.value = allProducts.productData!;

        for(int i =0 ;i<productData.value.length;i++){
          for(int j =0;j<myalreadyadded!.length;j++){
            if(productData[i].id==myalreadyadded[j].id){
              productData[i].sisAdded=true;
            }
          }
        }

       completer.complete(productData);

      },
      failureCallback: (status, message) {

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        completer.complete(null);

      },
    );
    return completer.future;

  }

  void filterProduct(String query) {
    query = query.toLowerCase();
    if (query.isEmpty) {
      filteredProductData.value = productData;
    } else {
      final List<ProductData> filteredList = productData.where((product) {
        final String name = product.name!.toLowerCase();
        final String desc = product.description!.toLowerCase();
        return name.contains(query) || desc.contains(query);
      }).toList();
      filteredProductData.value = filteredList;

      update();
    }
  }

  Future<List<ProductData>?> showCountryModelBottomSheet(
      BuildContext context, List<ProductData> productData) async {
    this.productData.value = productData;
    filterProduct("");

    searchController.clear();
    Completer<List<ProductData>?> completer = Completer<List<ProductData>?>();

    showModalBottomSheet<List<ProductData>>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          minChildSize: .9,
          maxChildSize: .9,
          initialChildSize: .9,
          builder: (BuildContext context, ScrollController scrollController) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GetBuilder<AddProductBottomSheetController>(
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 16.h),
                          height: 3,
                          width: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD0D0D0),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      mySearchFiled(
                        texthint: "Search product...",
                        height: 56.h,
                        controller: searchController,
                        onChanged: filterProduct,
                      ),
                      SizedBox(height: 15.h),
                      Expanded(
                        child: Obx(
                          () => ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final product = filteredProductData[index];



                                  String? productImage;

                                if (product.images!.isNotEmpty) {
                                  productImage = product.images![0];
                                }

                                return Material(
                                  color: AppColor.searchgrey,
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Container(
                                    height: 95.h,
                                    padding: const EdgeInsets.all(16),
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        productImage != null
                                            ? Container(
                                                width: 45.w,
                                                height: 60.h,
                                                decoration: ShapeDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(ibaseURL +
                                                        productImage.toString()),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(5)),
                                                ),
                                              )
                                            : Container(
                                                width: 45.w,
                                                height: 60.h,
                                                decoration: ShapeDecoration(
                                                  image: const DecorationImage(
                                                    image: AssetImage(
                                                        AppAsset.InvoicesIcon),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(5)),
                                                ),
                                              ),
                                        SizedBox(width: 8.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 6.h, bottom: 6.h),
                                                child: Text(
                                                  product.description.toString(),
                                                  style: text400_14.copyWith(
                                                      color: AppColor.productBlack),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Expanded(
                                                child: // Inside the ListView.separated builder
                                                Row(
                                                  children: [
                                                    Text(
                                                      product.productCurrency.toString() + product.price.toString(),
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(
                                                        color: Color(0xFF1D1B20),
                                                        fontSize: 18,
                                                        fontFamily: 'SF Pro Display',
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    product.isAdded == null || product.isAdded == false
                                                        ? SizedBox(
                                                      width: 55.w,
                                                      height: 30.h,
                                                      child: OutlinedButton(
                                                        style: OutlinedButton.styleFrom(
                                                          foregroundColor: AppColor.primaryBlue,
                                                          padding: EdgeInsets.zero,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(5.r),
                                                          ),
                                                          side: const BorderSide(
                                                            width: 0.50,
                                                            color: Color(0x4C663CEF),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          if (product.isAdded==null || product.isAdded ==false) {
                                                            // Add the product
                                                            product.sisAdded = true;
                                                            addedProductsList.add(product);


                                                            print("data"+product.isAdded.toString());
                                                            controller.update();
                                                            controller.refresh();
                                                          }
                                                        },
                                                        child: Text(
                                                          'Add',
                                                          style: text400_14.copyWith(color: AppColor.primaryBlue),
                                                        ),
                                                      ),
                                                    )
                                                        : SizedBox(
                                                      width: 80.w,
                                                      height: 30.h,
                                                      child: OutlinedButton(
                                                        style: OutlinedButton.styleFrom(
                                                          foregroundColor: AppColor.productRemove,
                                                          shadowColor: AppColor.productRemove,
                                                          padding: EdgeInsets.zero,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(5.r),
                                                          ),
                                                          side: const BorderSide(
                                                            width: 0.50,
                                                            color: AppColor.productRemove,
                                                          ),
                                                        ),
                                                        onPressed: () {

                                                            // Remove the product
                                                            product.sisAdded = null;


/*
                                                            addedProductsList.value.remove(product);
*/
                                                            controller.update();
                                                            controller.refresh();


                                                            print(product.isAdded);

/*
                                                            print(addedProductsList.length);
*/


                                                        },
                                                        child: Text(
                                                          'Remove',
                                                          style: text400_14.copyWith(color: AppColor.productRemove),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 15.h,
                                );
                              },
                              itemCount: filteredProductData.length),
                        ),
                      )
                    ],
                  );
                }
              ),
            );
          },
        );
      },
    ).then((addedProducts) {

      print(addedProductsList.value.length);
      completer.complete(filteredProductData.value);


    });

      return completer.future;
  }
}
