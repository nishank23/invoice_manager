import 'package:get/get.dart';

import '../controllers/add_new_client_controller.dart';

class AddNewClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewClientController>(
      () => AddNewClientController(),
    );
  }
}
