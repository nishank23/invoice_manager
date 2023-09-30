import 'package:get/get.dart';

import '../controllers/estimated_controller.dart';

class EstimatedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EstimatedController>(
      () => EstimatedController(),
    );
  }
}
