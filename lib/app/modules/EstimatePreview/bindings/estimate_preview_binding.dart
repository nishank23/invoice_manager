import 'package:get/get.dart';

import '../controllers/estimate_preview_controller.dart';

class EstimatePreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EstimatePreviewController>(
      () => EstimatePreviewController(),
    );
  }
}
