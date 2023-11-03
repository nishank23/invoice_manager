import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:invoice_generator/app/global/widgets/title_widget.dart';
import 'package:invoice_generator/app/global/widgets/my_button.dart';

import '../../../global/constants/api_const.dart';
import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/estimate_preview_controller.dart';

class EstimatePreviewView extends GetView<EstimatePreviewController> {
  const EstimatePreviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EstimatePreviewController());
    return Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
/*
          minimum: EdgeInsets.symmetric(horizontal: 20.w),
*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Spacer(),
                  Text(
                    "Estimate Preview",
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
              const Divider(),
              SizedBox(
                height: 8.h,
              ),
              GetBuilder<EstimatePreviewController>(builder: (controller) {
                return !controller.isLoading.value
                    ? Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                              padding: EdgeInsets.all(23.h),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.50, color: Color(0x33758090)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: 'Invoice ',
                                                  style: text700_18.copyWith(
                                                      color: AppColor
                                                          .primaryBlue)),
                                              TextSpan(
                                                  text: 'Manager',
                                                  style: text300_18.copyWith(
                                                      color: AppColor.black))
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Text('INVOICE', style: text700_22blue)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 13.h,
                                    ),
                                    Row(children: [
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              myPreviewTitle(
                                                  title: "INVOICE NUMBER :"),
                                              SizedBox(
                                                height: 6.h,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 3.h,
                                                    horizontal: 8.w),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: AppColor.primaryBlue
                                                        .withOpacity(.05)),
                                                child: Text(
                                                  "#${controller.estimation!.estimationNo.toString()}",
                                                  style: text300_14.copyWith(
                                                      color:
                                                          AppColor.primaryBlue),
                                                ),
                                              )
                                            ]),
                                      ),
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              myPreviewTitle(
                                                title: "DATE",
                                              ),
                                              SizedBox(
                                                height: 6.h,
                                              ),
                                              Text(
                                                  DateFormat("dd/MM/yyyy")
                                                      .format(DateTime.parse(
                                                          controller.estimation!
                                                              .estimationDate
                                                              .toString())),
                                                  style:
                                                      text400_16grey.copyWith(
                                                          color: Colors.black))
                                            ]),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: 14.h,
                                    ),
                                    myPreviewTitle(
                                      title: 'TOTAL AMOUNT:',
                                    ),
                                    SizedBox(
                                      height: 7.h,
                                    ),
                                    Text(
                                        controller
                                            .formatPriceWithThousandSeparator(
                                                controller.estimation!.currency
                                                    .toString(),
                                                controller
                                                    .estimation!.totalAmount!),
                                        style: text400_16purple),
                                    SizedBox(
                                      height: 14.h,
                                    ),
                                    myPreviewTitle(
                                      title: 'INVOICE FROM',
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                        controller.userprofile!.pcompany!.owner
                                            .toString(),
                                        style: text600_16.copyWith(
                                            color: Colors.black)),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                        controller.userprofile!.pcompany!.name
                                            .toString(),
                                        style: text400_16grey.copyWith(
                                            color: Colors.black)),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                        controller.userprofile!.address!.city
                                            .toString(),
                                        style: text400_16grey.copyWith(
                                            color: Colors.black)),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                        "${controller.userprofile!.address!.state},${controller.userprofile!.address!.country}-${controller.userprofile!.address!.postalCode}",
                                        style: text400_16grey.copyWith(
                                            color: Colors.black)),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      children: [
                                        myPreviewTitle(
                                          title: 'GST: ',
                                        ),
                                        Text(
                                            controller.userprofile!.pcompany!
                                                .gstNumber
                                                .toString(),
                                            style: text400_16grey.copyWith(
                                                color: Colors.black)),
                                      ],
                                    ),
                                    Divider(
                                      height: 35.h,
                                    ),
                                    myPreviewTitle(
                                      title: 'ESTIMATE BILLED TO',
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                        controller.estimation!.client!.company!
                                            .personName
                                            .toString(),
                                        style: text600_16.copyWith(
                                            color: Colors.black)),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                        controller
                                            .estimation!.client!.company!.name
                                            .toString(),
                                        style: text600_16.copyWith(
                                            color: Colors.black)),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                        controller.estimation!.client!
                                            .billingAddress!.city
                                            .toString(),
                                        style: text400_16grey.copyWith(
                                            color: Colors.black)),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                        "${controller.estimation!.client!.billingAddress!.state},${controller.estimation!.client!.billingAddress!.country}-${controller.estimation!.client!.billingAddress!.postalCode}",
                                        style: text400_16grey.copyWith(
                                            color: Colors.black)),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      children: [
                                        myPreviewTitle(
                                          title: 'MOBILE NO.: ',
                                        ),
                                        Text(
                                            controller.estimation!.client!
                                                .company!.mobileNumber
                                                .toString(),
                                            style: text400_16grey.copyWith(
                                                color: Colors.black)),
                                      ],
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            myTitleWidget(title: "Product Details"),
                            ListView.separated(
                                shrinkWrap: true,
                                primary: false,
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                itemBuilder: (context, index) {
                                  var data =
                                      controller.estimation!.products![index];

                                  String? productImage;

                                  if (data.product!.images!.isNotEmpty) {
                                    productImage = data.product!.images![0];
                                  }

                                  /*if (data.product.images!.isNotEmpty) {
                                productImage = product.images![0];
                              }*/
                                  return Container(
                                    padding: EdgeInsets.all(16.h),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFF8F9FA),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        productImage != null
                                            ? Container(
                                                width: 44.89.w,
                                                height: 60.h,
                                                decoration: ShapeDecoration(
                                                  color: AppColor.buttonGrey,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        ibaseURL +
                                                            productImage
                                                                .toString()),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                              )
                                            : Container(
                                                width: 44.89.w,
                                                height: 60.h,
                                                decoration: ShapeDecoration(
                                                  color: AppColor.buttonGrey,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                              ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${data.product!.name}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: text400_14.copyWith(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 11.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${data.product!.currencySymbol}${data.quantity! * data.product!.price!}" /*data.prod data.product!.price.toString(),*/
                                                      ,
                                                      style: text500_16black
                                                          .copyWith(
                                                              fontSize: 18),
                                                    ),
                                                    Text(
                                                      "${data.quantity}QTY. X${controller.formatPriceWithThousandSeparator(data.product!.currencySymbol.toString(), data.product!.price!)} RATE",
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xFF758090),
                                                        fontSize: 13,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.65,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 8.h,
                                    ),
                                itemCount:
                                    controller.estimation!.products!.length),
                            myTitleWidget(title: "Total Paid Amount"),
                            SizedBox(
                              height: 24.h,
                            ),
                            ClipPath(
                              clipper: MovieTicketClipper(),
                              child: Material(
                                color: const Color(0xFFF8F9FA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 18.h),
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Sub total',
                                            style: text400_16black),
                                        Text(
                                            controller
                                                .formatPriceWithThousandSeparator(
                                                    controller
                                                        .estimation!.currency
                                                        .toString(),
                                                    controller.estimation!
                                                        .itemTotal!),
                                            style: text400_16black)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 24.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Discount:',
                                            style: text400_16black),
                                        SizedBox(
                                          height: 35.h,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(8.r),
                                                decoration:
                                                    const ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(5),
                                                      bottomLeft:
                                                          Radius.circular(5),
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                    controller.estimation!
                                                                .discountType ==
                                                            0
                                                        ? ((controller
                                                                    .estimation!
                                                                    .itemTotal! /
                                                                num.parse(controller
                                                                            .estimation
                                                                            ?.discount !=
                                                                        null
                                                                    ? controller
                                                                        .estimation!
                                                                        .discount!
                                                                        .toString()
                                                                    : "0")))
                                                            .toStringAsFixed(2)
                                                        : controller.estimation!
                                                            .discount!
                                                            .toStringAsFixed(2),
                                                    style: text400_16black),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8.r),
                                                decoration:
                                                    const ShapeDecoration(
                                                  color: Color(0x7F758090),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(5),
                                                      bottomRight:
                                                          Radius.circular(5),
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  controller
                                                      .estimation!.currency
                                                      .toString(),
                                                  style: text600_16.copyWith(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 24.h,
                                    ),
                                    ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          var data = controller
                                              .estimation!.taxes![index];
                                          return Row(
                                            children: [
                                              Text(data.name.toString(),
                                                  style: text400_16black),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8.r),
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                        data.percentage
                                                            .toString(),
                                                        style: text400_16black),
                                                    SizedBox(
                                                      width: 8.h,
                                                    ),
                                                    Text('%',
                                                        style: text600_16.copyWith(
                                                            color: const Color(
                                                                0xFFB7BDC5))),
                                                  ],
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                  controller
                                                      .formatPriceWithThousandSeparator(
                                                          controller.estimation!
                                                              .currency
                                                              .toString(),
                                                          data.amount!),
                                                  style: text400_16black),
                                            ],
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              height: 24.h,
                                            ),
                                        itemCount: controller
                                            .estimation!.taxes!.length),
                                    Opacity(
                                      opacity: 0.20,
                                      child: const DottedLine(
                                        direction: Axis.horizontal,
                                        alignment: WrapAlignment.center,
                                        lineLength: double.infinity,
                                        lineThickness: 1.0,
                                        dashLength: 4.0,
                                        dashColor: Color(0xFF758090),
                                        dashGapLength: 4.0,
                                        dashGapColor: Colors.transparent,
                                        dashGapRadius: 0.0,
                                      ).marginSymmetric(vertical: 16.h),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Total Amount',
                                            style: text700_18.copyWith(
                                                fontSize: 16.sp)),
                                        Text(
                                            controller
                                                .formatPriceWithThousandSeparator(
                                                    controller
                                                        .estimation!.currency!
                                                        .toString(),
                                                    controller.estimation!
                                                        .totalAmount!),
                                            style: text700_18.copyWith(
                                                fontSize: 16.sp,
                                                color: AppColor.primaryBlue))
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            myTitleWidget(title: "Sign"),
                            SizedBox(
                              height: 20.h,
                            ),
                            controller.estimation!.sign != null
                                ? SizedBox(
                                    width: 150,
                                    height: 100,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 150,
                                        height: 100,
                                        alignment: Alignment.center,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                width: 0.50,
                                                color: Color(0x3397A1B1)),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                              fit: BoxFit.fill,
                                              ibaseURL +
                                                  controller.estimation!.sign!,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            SizedBox(
                              height: 20.h,
                            ),
                            GetBuilder<EstimatePreviewController>(
                                builder: (controller) {
                              return mybutton(
                                  onTap: () {
                                    Get.toNamed(Routes.INVOICE_PDF, arguments: {
                                      'pdfSite':
                                          "$baseURL${ApiConstant.getEstPdf}/${controller.id}",
                                      'name': controller.estimation!.client!
                                          .company!.personName
                                    });

                                    /* controller.ApiEstimatePdfView(
                                        context: context,
                                        estimateId: controller.id);*/

/*
                                    Get.toNamed(Routes.INVOICE_PDF, arguments: {'bytes': bytes, 'name': name});
*/
                                  },
                                  title: "Next");
                            }),
                            SizedBox(
                              height: 50.h,
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 20.w),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                        color: AppColor.primaryBlue,
                      ));
              }),
            ],
          ),
        ));
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Calculate the radius for the semi-circles
    final radius = size.height / 2;

    // Calculate the width of the ticket body
    // final ticketWidth = size.width - (2 * radius);

    // Move to the starting point
    path.moveTo(radius, 0);

    // Draw the left semi-circle
    path.arcToPoint(
      Offset(0, radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    // Draw the left side of the ticket body
    path.lineTo(0, size.height);

    // Draw the right side of the ticket body
    path.lineTo(size.width, size.height);

    // Draw the right semi-circle
    path.arcToPoint(
      Offset(size.width - radius, radius),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
