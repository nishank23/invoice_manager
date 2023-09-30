import 'package:get/get.dart';

import '../controllers/address_info_controller.dart';

class AddressInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressInfoController>(
      () => AddressInfoController(),
    );
  }
}
