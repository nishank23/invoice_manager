import 'dart:typed_data';

import 'package:get/get.dart';

class InvoicePdfController extends GetxController {
  //TODO: Implement InvoicePdfController

  final count = 0.obs;

  String? bytes;
  String? name;

  @override
  void onInit() {
    final args = Get.arguments;

    bytes=args['pdfSite'];
    name=args['name'];

    update();
    refresh();
    super.onInit();



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
}
