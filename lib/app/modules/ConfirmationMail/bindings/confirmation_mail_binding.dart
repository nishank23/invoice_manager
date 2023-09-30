import 'package:get/get.dart';

import '../controllers/confirmation_mail_controller.dart';

class ConfirmationMailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmationMailController>(
      () => ConfirmationMailController(),
    );
  }
}
