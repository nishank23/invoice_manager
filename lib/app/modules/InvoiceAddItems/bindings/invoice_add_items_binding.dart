import 'package:get/get.dart';

import '../controllers/invoice_add_items_controller.dart';

class InvoiceAddItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceAddItemsController>(
      () => InvoiceAddItemsController(),
    );
  }
}
