import 'package:get/get.dart';

import '../controllers/invoice_add_client_controller.dart';

class InvoiceAddClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceAddClientController>(
      () => InvoiceAddClientController(),
    );
  }
}
