import 'package:get/get.dart';

import '../controllers/est_add_sign_controller.dart';

class EstAddSignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EstAddSignController>(
      () => EstAddSignController(),
    );
  }
}
