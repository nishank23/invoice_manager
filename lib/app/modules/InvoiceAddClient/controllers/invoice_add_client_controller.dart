import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/services/Connectivity/networkClient.dart';

import '../../../../Models/estimatePreviewModel.dart';
import '../../../../Models/getAllClients.dart';
import '../../../../Models/getAllCountry.dart';
import '../../../../main.dart';
import '../../../global/constants/api_const.dart';
import '../../../global/widgets/countryPicker/CountryModelBottomSheetController.dart';
import '../../../global/widgets/custom_dialog.dart';
import '../../CreateEstimated/controllers/create_estimated_controller.dart';
import '../../CreateEstimated/est_add_items/controllers/est_add_items_controller.dart';
import '../../CreateInvoice/controllers/create_invoice_controller.dart';

class InvoiceAddClientController extends GetxController {
  //TODO: Implement InvoiceAddClientController

  DateTime? selectedDate;
  final CreateInvoiceController parentCon = Get.find();


   @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    ApiGetAllClients(context: Get.context!);
    ever(parentCon.estimation, (callback) => onEdit(callback!));
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Rx<String?> selectedCurrency = Rx<String?>(null);
  Rx<String?> selectedAddClient = Rx<String?>(null);
  String? selectedCountryIcon ="🌐";
  DateTime? selectedInvoiceDate;
  DateTime? selectedDueDate;
   CountryData? selectedCountry;

  Rx<TextEditingController> invoiceDateController = TextEditingController().obs;
  Rx<TextEditingController> dueDateController = TextEditingController().obs;
  Rx<TextEditingController> currencyController = TextEditingController().obs;
  RxList<Map<String, dynamic>> myClientList = RxList<Map<String, dynamic>>();
   final RxList<CountryData> countryData = <CountryData>[].obs;


   Future getCountryData({required BuildContext context}) async {
     FocusScope.of(context).unfocus();
     countryData.clear();

     await NetworkClient.getInstance.callApi(
       context,
       baseURL,
       ApiConstant.getAllCountry,
       MethodType.Get,
       headers: NetworkClient.getInstance.getAuthHeaders(),
       successCallback: (response, message) async {
         GetAllCountry allCountry = GetAllCountry.fromJson(response);
         countryData.value = allCountry.countryData!;

         update();
         refresh();
       },
       failureCallback: (status, message) {
         app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
       },
     );
   }

   void editCountry(CountryData? selectedCountry) {
     if (selectedCountry != null) {
       selectedCurrency.value = selectedCountry.currencySymbol.toString();

       final addcontroller = Get.put(EstAddItemsController());

       String myselectedSymbol =
           "Flat ($selectedCurrency)";

       if (addcontroller.menuItems.length == 1) {
         addcontroller.menuItems.add(myselectedSymbol);
       } else {
         addcontroller.menuItems[1] = myselectedSymbol;
       }

       selectedCountryIcon = selectedCountry.emoji.toString();
       currencyController.value.text =
       "${selectedCountry.currencySymbol}  ${selectedCountry.currency}";
       update();
     }
   }

   Future<void> pickCountry(BuildContext context) async {
     final countryModelBottomSheetController = Get.put(
         CountryModelBottomSheetController());


       selectedCountry = await countryModelBottomSheetController
         .GetCountryModelSheet(context: context);
     if (selectedCountry != null) {
       // Handle the selected country
       print(selectedCountry!.currency);

       selectedCountry!.currency.toString();
       selectedCountry!.currencySymbol.toString();
       selectedCurrency.value = selectedCountry!.currencySymbol.toString();

       final addcontroller = Get.put(EstAddItemsController());

       String myselectedSymbol = "Flat ($selectedCurrency)";

       if(addcontroller.menuItems.length==1){
         addcontroller.menuItems.add(myselectedSymbol);

       }else{
         addcontroller.menuItems[1]=myselectedSymbol;
       }

       selectedCountryIcon = selectedCountry!.emoji.toString();
/*
      selectedCountryIcon = selectedCountry.currencySymbol.toString();
*/
       currencyController.value.text ="${selectedCountry!.currencySymbol}  ${selectedCountry!.currency}";
       update();
     }
   }

   RxList<ClientData> clientList = <ClientData>[].obs;

   ApiGetAllClients({required BuildContext context}) async {
     FocusScope.of(context).unfocus();
     app.resolve<CustomDialogs>().showCircularDialog(context);
     return NetworkClient.getInstance.callApi(
       context,
       baseURL,
       ApiConstant.getAllClients,
       MethodType.Get,
       headers: NetworkClient.getInstance.getAuthHeaders(),
       successCallback: (response, message) {
         app.resolve<CustomDialogs>().hideCircularDialog(context);
         myClientList.clear();
         clientList.clear();

         GetAllClients getAllClients = GetAllClients.fromJson(response);
         clientList.value = getAllClients.clientData!;
         List<dynamic> countryDataList = response['clientData'];
         for (var countryData in countryDataList) {
           Map<String, dynamic> dropdownItem = {
             'id': countryData['_id'].toString(),
             'title': countryData['company']['personName'],
           };
           myClientList.add(dropdownItem);
         }

         update();
       },
       failureCallback: (status, message) {
         app.resolve<CustomDialogs>().hideCircularDialog(context);

         app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
         print("error");
       },
     );
   }

   onEdit(Estimation est) {
     selectedAddClient.value = est.client!.id.toString();
     currencyController.value;

     invoiceDateController.value.text =
         est.estimationDate.toString().toString().substring(0, 10);

     getCountryData(context: Get.context!).then((value) {
       for (var data in countryData) {
         if (data.id.toString() == est.currencyId) {
           editCountry(data);
           selectedCountry = data;
         }
       }
     });
     update();
   }


}
