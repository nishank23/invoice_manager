import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/CreateEstimated/est_add_client/controllers/est_add_client_controller.dart';

import 'package:intl/intl.dart';
import '../../../../../Models/estimatePreviewModel.dart';
import '../../../../../Models/getAllProducts.dart';
import '../../../../global/widgets/productPicker/AddProductBottomSheetController.dart';
import '../../../InvoiceAddClient/controllers/invoice_add_client_controller.dart';
import '../../controllers/create_estimated_controller.dart';

class EstAddItemsController extends GetxController {
  RxList<ProductData> myaddedProductsList = <ProductData>[].obs;

  final count = 0.obs;
  num subtotal = 0;

  TextEditingController searchController = TextEditingController();
  TextEditingController dscCntlr = TextEditingController();
  CreateEstimatedController parentCon = Get.put(CreateEstimatedController());

  num disamt = 0;

  String formatPriceWithThousandSeparator(String pricesymbol, num price) {
    NumberFormat numberFormat = NumberFormat.currency(
      symbol: pricesymbol,
      decimalDigits: 0,
    );
    return numberFormat.format(price);
  }

  String get afterDiscountText {
    // Assuming you have the condition stored in some variable, e.g., isPercentageDiscount
    if (myformattedDiscount == "%") {
      num discamt = subtotal - disamt;
      return discamt.toString();
      // Return the "%" sign when the discount is in percentage
    } else {
      // Calculate the discount amount and format it as a price with a thousand separator
      double discountAmount = subtotal - double.parse(dscCntlr.text.trim().isEmpty ? "0" : dscCntlr.text.trim());
      return discountAmount.toString();
    }
  }

  String get getFinalTotal {
    num afterdiscount = num.parse(afterDiscountText);

    num allTaxes = 0;
    for (var value in myTextList) {
      allTaxes = value['value'] + allTaxes;
    }

    afterdiscount = afterdiscount + allTaxes;

    return afterdiscount.toString();
  }

  getDiscountAmount() {
    disamt = 0;

    String dsctext = dscCntlr.text.trim();

    if (dsctext.isEmpty) {
      print("Discount value is empty.");
      // Handle the error here, e.g., show an error message to the user.
      return;
    }
    try {
      double discountPercentage = double.parse(dsctext);
      disamt = subtotal * (discountPercentage / 100);
      update();
      refresh();
    } catch (e) {
      print("Error while parsing discount value: $e");
      // Handle the error here, e.g., show an error message to the user.
    }
  }

  getSubTotal() {
    subtotal = 0;
    for (var data in myaddedProductsList) {
      subtotal = subtotal + (data.qty * data.price!);
    }
  }

  var selectedEstimateCurrency;

  @override
  void onInit() {
    super.onInit();

    final addcontroller = Get.put(InvoiceAddClientController());
    selectedEstimateCurrency = addcontroller.selectedCurrency.value.toString();
    String flat = "Flat (${addcontroller.selectedCurrency.value})";
    menuItems.add(flat);
    if (parentCon.id != null) {
      onEditItems(parentCon.estimation.value!
      );
    }

    update();
  }

  onEditItems(Estimation est) async {
    final addProducts = Get.put(AddProductBottomSheetController());
    print("myItemsEstimation${est.itemTotal}");

    if (est.discountType == 0) {
      selectedDiscount.value = menuItems[0];

      dscCntlr.text = (est.itemTotal! / est.discount!).toString();
    } else {
      selectedDiscount.value = menuItems[1];
      dscCntlr.text = est.discount.toString();
    }

    for (var editpro in est.products!) {
      myaddedProductsList.add(ProductData(id: editpro.product!.id));
    }

    List<ProductData>? products =
        await addProducts.editProducts(context: Get.context!, myalreadyadded: myaddedProductsList);

    myaddedProductsList.clear();

    for (var data in products!) {
      if (data.isAdded != null && data.isAdded!) {
        myaddedProductsList.add(data);
      }
    }

    for (var data in est.taxes!) {
      Map<String, dynamic> myMap = {};
      myMap["taxValue"] = data.percentage!;
      myMap["taxType"] = data.name!;
      myMap["value"] = data.amount;
      myTextList.add(myMap);
    }

    getSubTotal();
    update();
    refresh();
    print(myaddedProductsList);
  }

  @override
  void onReady() {
    ever(parentCon.estimation, (callback) => onEditItems(callback!));
    super.onReady();
  }

  String extractedValue(String text) {
    final RegExp regExp = RegExp(r'\((.*?)\)'); // Matches the value inside parentheses
    final match = regExp.firstMatch(text);
    if (match != null && match.groupCount >= 1) {
      return match.group(1) ?? '';
    }
    return '';
  }

  List<String> menuItems = ['Percentage (%)'];

  Rx<String?> selectedDiscount = "Percentage (%)".obs;
  Rx<String?> myformattedDiscount = "%".obs;

  Rx<TextEditingController> taxTypeController = TextEditingController().obs;
  Rx<TextEditingController> taxPercentageController = TextEditingController().obs;

  RxList myTextList = <Map<String, dynamic>>[].obs;

}
