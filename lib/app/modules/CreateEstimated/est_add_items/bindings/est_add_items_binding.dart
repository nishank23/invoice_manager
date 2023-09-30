import 'package:get/get.dart';

import '../controllers/est_add_items_controller.dart';

class EstAddItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EstAddItemsController>(
      () => EstAddItemsController(),
    );
  }
}
