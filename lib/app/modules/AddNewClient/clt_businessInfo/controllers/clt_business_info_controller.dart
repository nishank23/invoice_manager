import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/modules/AddNewClient/controllers/add_new_client_controller.dart';

import '../../../../global/widgets/ImagePickerDialog.dart';

class CltBusinessInfoController extends GetxController {
  AddNewClientController addNewClientController = Get.put(AddNewClientController());
  final count = 0.obs;
  Rx<TextEditingController> companyNameController = TextEditingController().obs;
  Rx<TextEditingController> ownerNameController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> alterMobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> gstController = TextEditingController().obs;
  Rx<TextEditingController> businessEmailController = TextEditingController().obs;
  Rx<TextEditingController> businessWebsiteController = TextEditingController().obs;

  File? selectedPhoto;
  updateClientPhoto() {
    ImagePickerDialog.showSingleImagePickerDialog(
      Get.context!,
      onImageSelected: (File file) {
        selectedPhoto = file;
        update();
        refresh();
        print(file.path.toString());

        // Handle the selected image file
        // file variable contains the selected image file
      },
    );
  }

  getData() {
    companyNameController.value.text = addNewClientController.clientById.value!.company!.name!;
    ownerNameController.value.text = addNewClientController.clientById.value!.company!.personName!;
    mobileNumberController.value.text = addNewClientController.clientById.value!.company!.mobileNumber!;
    alterMobileNumberController.value.text = addNewClientController.clientById.value!.company!.alternativeMobileNumber!;
    gstController.value.text = addNewClientController.clientById.value!.company!.gstNumber!;
    businessEmailController.value.text = addNewClientController.clientById.value!.company!.email!;
    businessWebsiteController.value.text = addNewClientController.clientById.value!.company!.website!;
    update();
    refresh();
  }

  @override
  void onInit() {
    super.onInit();
    ever(addNewClientController.clientById, (callback) => getData());
    // getData();
  }

  void increment() => count.value++;
}
