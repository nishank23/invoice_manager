import 'package:get/get.dart';

import '../controllers/confirmation_register_controller.dart';

class ConfirmationRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmationRegisterController>(
      () => ConfirmationRegisterController(),
    );
  }
}
