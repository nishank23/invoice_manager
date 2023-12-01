import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:invoice_generator/app/global/constants/app_color.dart';
import 'package:invoice_generator/app/global/constants/app_fonts.dart';
import 'package:invoice_generator/app/global/widgets/myButton.dart';
import 'package:invoice_generator/app/routes/app_pages.dart';

import '../../../global/widgets/TitleWidget.dart';
import '../../CreateInvoice/controllers/create_invoice_controller.dart';
import '../controllers/invoice_address_controller.dart';

class InvoiceAddressView extends GetView<InvoiceAddressController> {
  const InvoiceAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(InvoiceAddressController());
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.h),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0x4C758090)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myTitleWidget(title: "Billing Address"),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text('Edith N. Lea',
                      style: text600_16.copyWith(color: Colors.black)),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text('1260 Peck Street Nashua, US 03060',
                      style: text400_16black),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text('Los Angeles', style: text400_16black),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text('California, United States-09060',
                      style: text400_16black),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      myPreviewTitle(
                        title: 'Mobile No.: ',
                      ),
                      Text('+1 202-483-1736', style: text400_16black),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  GestureDetector(
                    onTap: () {

                      String title = "Billing Address";
                      var id = "#INV3347";
                      Get.toNamed(Routes.EDIT_ADDRESS,arguments:{
                        'id': id,
                        'title': title,
                      } );
                    },
                    child: Text('Edit Address',
                        style:
                            text600_16.copyWith(color: AppColor.primaryBlue)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: EdgeInsets.all(16.h),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0x4C758090)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myTitleWidget(title: "Shipping Address"),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text('Edith N. Lea',
                      style: text600_16.copyWith(color: Colors.black)),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text('1260 Peck Street Nashua, US 03060',
                      style: text400_16black),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text('Los Angeles', style: text400_16black),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text('California, United States-09060',
                      style: text400_16black),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      myPreviewTitle(
                        title: 'Mobile No.: ',
                      ),
                      Text('+1 202-483-1736', style: text400_16black),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  GestureDetector(
                    onTap: () {

                      String title = "Shipping Address";
                      var id = "#INV000";
                      Get.toNamed(Routes.EDIT_ADDRESS,arguments:{
                        'id': id,
                        'title': title,
                      } );

                    },
                    child: Text('Edit Address',
                        style:
                            text600_16.copyWith(color: AppColor.primaryBlue)),
                  )
                ],
              ),
            ),
            Spacer(),
            GetBuilder(
              builder: (CreateInvoiceController controller) {
                return mybutton(
                  onTap: () {
                    controller.updateActive(2);

                    print("taped");
                  },
                  title: "Next",
                );
              },
            ),
          ],
        ).paddingSymmetric(horizontal: 20.h).paddingOnly(bottom: 16.h)
    );
  }
}
