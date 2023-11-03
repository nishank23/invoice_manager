import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/InvoiceAddClient/views/invoice_add_client_view.dart';
import 'package:invoice_generator/app/modules/InvoiceAddItems/views/invoice_add_items_view.dart';
import 'package:invoice_generator/app/modules/InvoiceAddSign/views/invoice_add_sign_view.dart';
import 'package:invoice_generator/app/modules/InvoiceAddress/views/invoice_address_view.dart';

class CreateInvoiceController extends GetxController {

  final activeStep = 0.obs;

  final PageController pageController = PageController(initialPage: 0);

  void updateActive(int index) {
    activeStep.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      // Optional: Animation duration
      curve: Curves.ease, // Optional: Animation curve
    );

    update();
  }

  final RxList<Widget> pages = [
    Builder(
      builder: (context) => InvoiceAddClientView(),
    ),
    Builder(
      builder: (context) => const InvoiceAddressView(),
    ),
    Builder(
      builder: (context) => const InvoiceAddItemsView(),
    ),
    Builder(
      builder: (context) => const InvoiceAddSignView(),
    ),
  ].obs;
}
