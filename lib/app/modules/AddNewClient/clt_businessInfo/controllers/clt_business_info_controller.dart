import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../global/widgets/ImagePickerDialog.dart';

class CltBusinessInfoController extends GetxController {
  //TODO: Implement CltBusinessInfoController

  final count = 0.obs;
  Rx<TextEditingController> companyNameController = TextEditingController().obs;
  Rx<TextEditingController> ownerNameController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> alterMobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> gstController = TextEditingController().obs;
  Rx<TextEditingController> businessEmailController = TextEditingController().obs;
  Rx<TextEditingController> businessWebsiteController = TextEditingController().obs;

  File? selectedPhoto;

  updateClientPhoto(){
    ImagePickerDialog.showSingleImagePickerDialog(Get.context!,
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

  void increment() => count.value++;
}
