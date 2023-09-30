import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/AddNewClient/clt_addressInfo/views/clt_address_info_view.dart';
import 'package:invoice_generator/app/modules/AddNewClient/clt_businessInfo/views/clt_business_info_view.dart';

import '../../AddressInfo/views/address_info_view.dart';
import '../../BusinessInfo/views/business_info_view.dart';

class AddNewClientController extends GetxController
    with SingleGetTickerProviderMixin {
  //TODO: Implement AddNewClientController
  TabController? tabController;

  final count = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: myTabs.value.length, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tabController!.dispose();
  }

  RxList<Tab> myTabs = <Tab>[
    const Tab(
      text: "Business Info",

    ),
    const Tab(
      text: "Address",

    ),

  ].obs;

  final screens = [


     CltBusinessInfoView(),
     CltAddressInfoView(),


    //business info // true
    // address info // true

  ];
}
