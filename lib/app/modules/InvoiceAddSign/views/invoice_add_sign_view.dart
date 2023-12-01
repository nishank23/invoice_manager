import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/routes/app_pages.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../../../global/widgets/ImagePickerDialog.dart';
import '../../../global/widgets/TitleWidget.dart';
import '../../../global/widgets/myButton.dart';
import '../../InvoiceAddClient/controllers/invoice_add_client_controller.dart';
import '../controllers/invoice_add_sign_controller.dart';

class InvoiceAddSignView extends GetView<InvoiceAddSignController> {
  const InvoiceAddSignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(InvoiceAddSignController());
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(right: 20.h, left: 20.h),
          reverse: false,
          child: Column(children: [
            Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                child: myTitleWidget(title: "Upload Sign")),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              child: DottedBorder(
                strokeWidth: 1.5,
                dashPattern: const [8, 8, 8, 8],
                color: const Color(0xff758090),
                borderPadding: EdgeInsets.zero,
                radius: const Radius.circular(20),
                borderType: BorderType.RRect,
                child: Container(
                  width: double.infinity,
                  height: 110.h,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(18.r)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Upload your e-signature here".toUpperCase(),
                        style: text500_13black,
                      ),
                      GetBuilder<InvoiceAddSignController>(
                          builder: (controller) {
                        return SizedBox(
                            width: 100.w,
                            child: mybutton(
                                onTap: () {
                                  ImagePickerDialog.showSingleImagePickerDialog(
                                    context,
                                    onImageSelected: (p0) {
                                      controller.selectedSign = p0;

                                      controller.update();

                                     },
                                  );
                                },
                                title: "Browse"));
                      })
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h
            ),
            GetBuilder<InvoiceAddSignController>(builder: (controller) {
              return controller.selectedSign != null
                  ? Container(
                      width: double.infinity,
                      height: 170.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.buttonBorderGrey),
                          borderRadius: BorderRadius.circular(18.r)),
                      child: controller.selectedSign != null
                          ? Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      controller.selectedSign = null;
                                      controller.update();
                                      controller.refresh();
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: SvgPicture.asset(
                                            AppAsset.closeSign)),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 24, horizontal: 40),
                                      child: Container(
                                          color: Colors.white,
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: controller.selectedSign != null
                                              ? Image.file(
                                                  controller.selectedSign!,
                                                  fit: BoxFit.fill,
                                                )
                                              : const SizedBox())),
                                ),

                                /* SizedBox(
                              width: 100.w,
                              child: mybutton(onTap: (){},title: "Browse"))*/
                              ],
                            )
                          : const SizedBox())
                  : Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "${controller.createEstimatedController.estimation.value?.sign}",
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    );
            }),
            const SizedBox(
              height: 12,
            ),
            GetBuilder(
              builder: (InvoiceAddClientController controller) {
                return mybutton(
                  onTap: () {
                    print("taped");
                    Get.toNamed(Routes.INVOICE_PREVIEW);
                  },
                  title: "Submit",
                );
              },
            ),
          ]),
        ));
  }
}
