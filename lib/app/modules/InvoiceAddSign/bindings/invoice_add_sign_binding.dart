import 'package:get/get.dart';

import '../controllers/invoice_add_sign_controller.dart';

class InvoiceAddSignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceAddSignController>(
      () => InvoiceAddSignController(),
    );
  }
}
