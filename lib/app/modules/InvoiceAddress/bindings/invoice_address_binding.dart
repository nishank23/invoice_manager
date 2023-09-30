import 'package:get/get.dart';

import '../controllers/invoice_address_controller.dart';

class InvoiceAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceAddressController>(
      () => InvoiceAddressController(),
    );
  }
}
