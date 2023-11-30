import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../global/widgets/countryPicker/CountryModelBottomSheetController.dart';
import '../../CreateEstimated/est_add_items/controllers/est_add_items_controller.dart';

class InvoiceAddClientController extends GetxController {
  //TODO: Implement InvoiceAddClientController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> pickCountry(BuildContext context) async {
    final countryModelBottomSheetController =
        Get.put(CountryModelBottomSheetController());

    final selectedCountry =
        await countryModelBottomSheetController.GetCountryModelSheet(
            context: context);
    if (selectedCountry != null) {
      // Handle the selected country
      print(selectedCountry.currency);

      selectedCountry.currency.toString();
      selectedCountry.currencySymbol.toString();
      selectedCurrency.value = selectedCountry.currencySymbol.toString();

      final addcontroller = Get.put(EstAddItemsController());

      String myselectedSymbol =
          "Flat" + " (" + selectedCurrency.toString() + ")";

      if (addcontroller.menuItems.length == 1) {
        addcontroller.menuItems.add(myselectedSymbol);
      } else {
        addcontroller.menuItems[1] = myselectedSymbol;
      }

      selectedCountryIcon = selectedCountry.emoji.toString();
/*
      selectedCountryIcon = selectedCountry.currencySymbol.toString();
*/
      currencyController.value.text =
          selectedCountry.currencySymbol.toString() +
              "  " +
              selectedCountry.currency.toString();
      update();
    }
  }

  Rx<String?> selectedCurrency = Rx<String?>(null);
  Rx<String?> selectedAddClient = Rx<String?>(null);
  String? selectedCountryIcon = "🌐";
  DateTime? selectedInvoiceDate;
  DateTime? selectedDueDate;

  Rx<TextEditingController> invoiceDateController = TextEditingController().obs;
  Rx<TextEditingController> dueDateController = TextEditingController().obs;
  Rx<TextEditingController> currencyController = TextEditingController().obs;
  RxList<Map<String, dynamic>> myClientList = RxList<Map<String, dynamic>>();
}
