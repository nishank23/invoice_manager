import 'package:get/get.dart';

import '../controllers/bank_info_controller.dart';

class BankInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BankInfoController>(
      () => BankInfoController(),
    );
  }
}
