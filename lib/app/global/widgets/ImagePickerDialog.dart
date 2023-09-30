import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/app_asset.dart';



// ImagePickerDialog.showSingleImagePickerDialog(context,
// onImageSelected: (File file) {
// // Handle the selected image file
// // file variable contains the selected image file
// },
// );
//
// // Multiple Image Picker
// ImagePickerDialog.showMultiImagePickerDialog(context,
// onImagesSelected: (List<File> files) {
// // Handle the selected image files
// // files list contains the selected image files
// },
// );









class ImagePickerDialog {
  static void showSingleImagePickerDialog(BuildContext context,
      {required Function(File) onImageSelected}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: SizedBox(
          height: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  XFile? file = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 10,
                  );
                  if (file != null) {
                    onImageSelected(File(file.path));
                    Get.back();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No Image Selected!"),
                      ),
                    );
                  }
                },
                child: SizedBox(
                  height: 100,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            AppAsset.gallery,
                            height: 50,
                            width: 50,
                          ),
                          const Text('Gallery'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  XFile? file = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                    imageQuality: 10,
                  );
                  if (file != null) {
                    onImageSelected(File(file.path));
                    Get.back();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No Image Selected!"),
                      ),
                    );
                  }
                },
                child: SizedBox(
                  height: 100,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            AppAsset.camera,
                            height: 50,
                            width: 50,
                          ),
                          const Text('Camera'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showMultiImagePickerDialog(BuildContext context,
      {required Function(List<File>) onImagesSelected}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 140,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () async {
                List<XFile>? files = await ImagePicker().pickMultiImage(
                  imageQuality: 10,
                );
                if (files != null && files.isNotEmpty) {
                  FocusManager.instance.primaryFocus!.unfocus();
                  Get.back(closeOverlays: true);


                  List<File> selectedImages =
                  files.map((file) => File(file.path)).toList();
                  onImagesSelected(selectedImages);

                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No Images Selected!"),
                    ),
                  );
                }
              },
              child: SizedBox(
                height: 100,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAsset.gallery,
                          height: 55,
                          width: 55,
                        ),
                        const Text('Gallery'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                XFile? file = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                  imageQuality: 10,
                );
                if (file != null) {
                  onImagesSelected([File(file.path)]);
                  Get.back();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No Image Selected!"),
                    ),
                  );
                }
              },
              child: SizedBox(
                height: 100,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          AppAsset.camera,
                          height: 55,
                          width: 55,
                        ),
                        const Text('Camera'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
