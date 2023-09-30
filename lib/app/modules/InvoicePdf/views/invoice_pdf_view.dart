import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../controllers/invoice_pdf_controller.dart';

class InvoicePdfView extends GetView<InvoicePdfController> {
  InvoicePdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<InvoicePdfController>(builder: (controller) {
        return SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        borderRadius: BorderRadius.circular(100.r),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(AppAsset.backIcon),
                        ),
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      Text(
                        controller.name.toString(),
                        style: text700_18,
                      ),
                      const Spacer(),
                      SizedBox(
                          height: 46.h,
                          width: 46.h,
                          child: const Icon(Icons.share_outlined)),
                      SizedBox(
                          height: 46.h,
                          width: 46.h,
                          child: const Icon(
                            Icons.file_download_outlined,
                            color: AppColor.primaryBlue,
                          ))
                    ],
                  ).paddingSymmetric(horizontal: 20.w),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: InteractiveViewer(
                    minScale: .5,
                    maxScale: 2,
                    child: SfTheme(
                      data: SfThemeData(
                          pdfViewerThemeData: SfPdfViewerThemeData(
                              progressBarColor: AppColor.primaryBlue)),
                      child: SfPdfViewer.network(
                        canShowPageLoadingIndicator: true,
                        controller.bytes!,
                        onDocumentLoadFailed: (details) {
                          print(details.description);
                          print(details.error);
                          print(details.error);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
