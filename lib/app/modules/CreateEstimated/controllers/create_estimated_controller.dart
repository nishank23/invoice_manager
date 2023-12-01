import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/CreateEstimated/est_add_items/views/est_add_items_view.dart';
import 'package:invoice_generator/app/modules/CreateEstimated/est_add_sign/views/est_add_sign_view.dart';

import '../../../../Models/estimatePreviewModel.dart';
import '../../../../main.dart';
import '../../../../services/Connectivity/networkClient.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/custom_dialog.dart';
import '../est_add_client/views/est_add_client_view.dart';

class CreateEstimatedController extends GetxController {
  //TODO: Implement CreateEstimatedController

  final activeStep = 0.obs;

  final PageController pageController = PageController(initialPage: 0);

  String? id = Get.arguments;

  void updateActive(int index) {
    activeStep.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      // Optional: Animation duration
      curve: Curves.ease, // Optional: Animation curve
    );

    update();
  }

  final RxList<Widget> pages = [
    Builder(
      builder: (context) => EstAddClientView(),
    ),
    Builder(
      builder: (context) => EstAddItemsView(),
    ),
    Builder(
      builder: (context) => const EstAddSignView(),
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
    if(id!=null){
      ApiEstimatePreview(context: Get.context!,estimateId: id);

    }else{
      ApiGetCurrEstimate(context: Get.context!);

    }
  }

  EstimatePreviewModel? estimatePreviewModel;
  Rx<Estimation?> estimation =  Rx<Estimation?>(null);
  Userprofile? userprofile;

  ApiEstimatePreview(
      {required BuildContext context,String? estimateId}) async {
    FocusScope.of(context).unfocus();
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      "${ApiConstant.getEstPreview}/$estimateId",
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {

        estimatePreviewModel = EstimatePreviewModel.fromJson(response);
        log(response.toString());

        estimation.value = estimatePreviewModel!.estimation!;
        estimateNo.value = estimation!.value!.estimationNo!;
        userprofile = estimatePreviewModel!.userprofile!;/**/
        update();
        refresh();
      },
      failureCallback: (status, message) {

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
      },
    );
  }


  @override
  void onClose() {
    super.onClose();
  }

  RxString estimateNo = "".obs;


  ApiGetCurrEstimate({required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    return NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getCurrEst,
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        print(response["data"]);

        estimateNo.value = response["data"]["estimationNo"];

        update();
      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(
            title: "Failed", desc: message);
        print("error");
      },
    );
  }
}
