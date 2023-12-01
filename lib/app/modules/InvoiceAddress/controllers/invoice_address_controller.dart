import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/InvoiceAddClient/controllers/invoice_add_client_controller.dart';

class InvoiceAddressController extends GetxController {
  //TODO: Implement InvoiceAddressController

  final count = 0.obs;
  InvoiceAddClientController addClientController = Get.find<InvoiceAddClientController>();



  @override
  void onInit() {
    // addClientController.s;
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
