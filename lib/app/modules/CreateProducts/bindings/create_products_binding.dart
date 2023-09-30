import 'package:get/get.dart';

import '../controllers/create_products_controller.dart';

class CreateProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProductsController>(
      () => CreateProductsController(),
    );
  }
}
