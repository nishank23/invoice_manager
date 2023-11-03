
import 'package:get/get.dart';

class InvoicePdfController extends GetxController {

  final count = 0.obs;

  String? bytes;
  String? name;

  @override
  void onInit() {
    final args = Get.arguments;

    bytes=args['pdfSite'];
    name=args['name'];

    update();
    refresh();
    super.onInit();



  }



  void increment() => count.value++;
}
