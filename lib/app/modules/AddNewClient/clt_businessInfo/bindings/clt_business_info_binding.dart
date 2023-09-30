import 'package:get/get.dart';

import '../controllers/clt_business_info_controller.dart';

class CltBusinessInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CltBusinessInfoController>(
      () => CltBusinessInfoController(),
    );
  }
}
