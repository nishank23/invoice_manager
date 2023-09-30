import 'package:get/get.dart';

import '../controllers/create_estimated_controller.dart';

class CreateEstimatedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateEstimatedController>(
      () => CreateEstimatedController(),
    );
  }
}
