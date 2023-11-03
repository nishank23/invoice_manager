import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/routes/app_pages.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../../../global/widgets/title_widget.dart';
import '../../../global/widgets/my_button.dart';
import '../../InvoiceAddClient/controllers/invoice_add_client_controller.dart';
import '../controllers/invoice_add_sign_controller.dart';

class InvoiceAddSignView extends GetView<InvoiceAddSignController> {
  const InvoiceAddSignView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                      SizedBox(
                          width: 100.w,
                          child: mybutton(onTap: () {}, title: "Browse"))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              height: 170.h,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.buttonBorderGrey),
                  borderRadius: BorderRadius.circular(18.r)),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(AppAsset.closeSign)),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 40),
                        child: Container(
                          color: Colors.pinkAccent,
                          width: double.infinity,
                          height: double.infinity,
                        )),
                  ),

                  /* SizedBox(
                      width: 100.w,
                      child: mybutton(onTap: (){},title: "Browse"))*/
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            GetBuilder(
              builder: (InvoiceAddClientController controller) {
                return mybutton(
                  onTap: () {
                    debugPrint("taped");
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
