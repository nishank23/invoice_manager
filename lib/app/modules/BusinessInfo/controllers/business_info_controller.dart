import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../global/widgets/image_picker_dialog.dart';

class BusinessInfoController extends GetxController {
  //TODO: Implement BusinessInfoController

  final count = 0.obs;

  String? profileImg;

  @override
  void onClose() {
    super.onClose();
    companyNameController.value.dispose();
    ownerNameController.value.dispose();
    mobileNumberController.value.dispose();
    alterMobileNumberController.value.dispose();
    gstController.value.dispose();
    businessEmailController.value.dispose();
    businessWebsiteController.value.dispose();
  }

  Rx<TextEditingController> companyNameController = TextEditingController().obs;
  Rx<TextEditingController> ownerNameController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController =
      TextEditingController().obs;
  Rx<TextEditingController> alterMobileNumberController =
      TextEditingController().obs;
  Rx<TextEditingController> gstController = TextEditingController().obs;
  Rx<TextEditingController> businessEmailController =
      TextEditingController().obs;
  Rx<TextEditingController> businessWebsiteController =
      TextEditingController().obs;

  File? selectedPhoto;

  updateUserProfile() {
    ImagePickerDialog.showSingleImagePickerDialog(
      Get.context!,
      onImageSelected: (File file) {
        selectedPhoto = file;
        update();
        refresh();
        debugPrint(file.path.toString());

        // Handle the selected image file
        // file variable contains the selected image file
      },
    );
  }
}
