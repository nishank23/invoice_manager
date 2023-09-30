import 'package:get/get.dart';

import '../controllers/est_add_client_controller.dart';

class EstAddClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EstAddClientController>(
      () => EstAddClientController(),
    );
  }
}
