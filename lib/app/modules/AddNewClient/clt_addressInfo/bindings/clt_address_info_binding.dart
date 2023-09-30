import 'package:get/get.dart';

import '../controllers/clt_address_info_controller.dart';

class CltAddressInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CltAddressInfoController>(
      () => CltAddressInfoController(),
    );
  }
}
