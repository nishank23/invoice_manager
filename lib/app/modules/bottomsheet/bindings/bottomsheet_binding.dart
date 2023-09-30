import 'package:get/get.dart';

import '../controllers/bottomsheet_controller.dart';

class BottomsheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomsheetController>(
      () => BottomsheetController(),
    );
  }
}
