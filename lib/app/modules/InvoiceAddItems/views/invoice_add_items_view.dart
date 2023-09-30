import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_fonts.dart';
import '../../../global/widgets/TitleWidget.dart';
import '../../../global/widgets/myButton.dart';
import '../../../global/widgets/mytextfiled.dart';
import '../../../global/widgets/productPicker/AddProductBottomSheetController.dart';
import '../../CreateEstimated/est_add_items/controllers/est_add_items_controller.dart';
import '../../CreateInvoice/controllers/create_invoice_controller.dart';
import '../../InvoiceAddClient/controllers/invoice_add_client_controller.dart';
import '../controllers/invoice_add_items_controller.dart';

class InvoiceAddItemsView extends GetView<InvoiceAddItemsController> {
  const InvoiceAddItemsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CreateInvoiceController myController =
    Get.put(CreateInvoiceController());
    EstAddItemsController controller =
    Get.put(EstAddItemsController());
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
                child: myTitleWidget(title: "Add Products")),
            mybutton(
                onTap: () {
                  /* showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.white,
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return DraggableScrollableSheet(
                        expand: false,
                        minChildSize: .9,
                        // 0.1 times of available height, sheet can't go below this on dragging
                        maxChildSize: .9,
                        // 0.7 times of available height, sheet can't go above this on dragging
                        initialChildSize: .9,
                        // 0.1 t

                        builder: (BuildContext context,
                            ScrollController scrollController) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                Center(
                                    child: Container(
                                  margin: EdgeInsets.only(top: 16.h),
                                  height: 3,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFD0D0D0),
                                      borderRadius:
                                          BorderRadius.circular(30.r)),
                                )),
                                SizedBox(
                                  height: 16.h,
                                ),
                                mySearchFiled(
                                  height: 56.h,
                                  texthint: "Search products...",
                                  controller: controller.searchController!,
                                  onChanged: (value) {},
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Expanded(
                                  child: ListView.separated(
                                      shrinkWrap: true,

                                      itemBuilder: (context, index) {
                                        return Material(
                                          color: AppColor.searchgrey,
                                          borderRadius:
                                          BorderRadius.circular(20.r),

                                          child: Container(
                                            height: 95.h,
                                            padding: const EdgeInsets.all(16),
                                            color: Colors.transparent,

                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 45.w,
                                                  height: 60.h,
                                                  decoration: ShapeDecoration(
                                                    image: const DecorationImage(
                                                      image: NetworkImage(
                                                          "https://via.placeholder.com/45x60"),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5)),
                                                  ),
                                                ),
                                                SizedBox(width: 8.w),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            top: 6.h,
                                                            bottom: 6.h),
                                                        child: Text(
                                                          'Women Peach-Coloured Ethnic Motifs Printed Kurta with Palazzos & With Dupatta',
                                                          style: text400_14.copyWith(
                                                              color: AppColor
                                                                  .productBlack),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                       Expanded(
                                                        child: Row(
                                                          children: [
                                                            const Text(
                                                              '₹1,469',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF1D1B20),
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            const Spacer(),
                                                          index>5?  SizedBox(
                                                              width: 55.w,
                                                              height: 30.h,
                                                              child: OutlinedButton(
                                                                style: OutlinedButton.styleFrom(
                                                                    foregroundColor: AppColor.primaryBlue,

                                                                    padding: EdgeInsets.zero,
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(5.r)
                                                                  ),

                                                                  side: const BorderSide(width: 0.50, color: Color(0x4C663CEF),
                                                                  )
                                                                ),
                                                                onPressed: () {
                                                                  // Add your desired functionality here
                                                                },
                                                                child:  Text('Add',style: text400_14.copyWith(color: AppColor.primaryBlue)),



                                                              ),
                                                            ):SizedBox(
                                                              width: 80.w,
                                                              height: 30.h,
                                                              child: OutlinedButton(

                                                                style: OutlinedButton.styleFrom(
                                                                  foregroundColor: AppColor.productRemove,
                                                                  shadowColor: AppColor.productRemove,
                                                                  padding: EdgeInsets.zero,
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(5.r)
                                                                  ),

                                                                  side: const BorderSide(width: 0.50, color: AppColor.productRemove,
                                                                  )
                                                                ),
                                                                onPressed: () {
                                                                  // Add your desired functionality here
                                                                },
                                                                child:  Text('Remove',style: text400_14.copyWith(color: AppColor.productRemove)),



                                                              ),
                                                            )

                                                        */
                  /* OutlinedButton(
                                                           style: OutlinedButton.styleFrom(
                                                             primary: Colors.teal,
                                                           ),
                                                           onPressed: () {
                                                             debugPrint('Received click');
                                                           },
                                                           child: const Text('Click Me'),
                                                         )*/
                  /*
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 15.h,
                                        );
                                      },
                                      itemCount: 10),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );*/

                  final addProducts =
                  Get.put(AddProductBottomSheetController());

                  // addProducts.GetProductBottomSheett(context: context);
                },
                backgroundColor: const Color(0x0C663CEF),
                widget: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColor.primaryBlue,
                    ),
                    Text(
                      "Add Product",
                      style: text600_16.copyWith(color: AppColor.primaryBlue),
                    ),
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                itemBuilder: (context, index) {
                  RxInt qty = 0.obs;

                  return Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF8F9FA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 44.89.w,
                              height: 60.h,
                              decoration: ShapeDecoration(
                                color: AppColor.buttonGrey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: Column(children: [
                                Text(
                                  "Women Navy Blue Ethnic Motifs Embroidered Kurta with Trousers & With Dupatta",
                                  overflow: TextOverflow.ellipsis,
                                  style: text400_14.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 11.w,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '₹3,438',
                                      style: text500_16black.copyWith(
                                          fontSize: 18),
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Obx(
                                  () => Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (qty > 0) {
                                        qty--;
                                        controller.update();
                                      }
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 32,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(8.r),
                                      decoration: const ShapeDecoration(
                                        color: Color(0x33758090),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        '-',
                                        style: text600_16.copyWith(
                                            color: AppColor.black),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 32,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(8.r),
                                    decoration: const ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 0.50,
                                            color: Color(0x33758090)),
                                      ),
                                    ),
                                    child: Text(
                                      '$qty',
                                      style: text400_16black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      qty++;

                                      controller.update();
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 32,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(8.r),
                                      decoration: ShapeDecoration(
                                        color: const Color(0x33758090),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5.r),
                                            bottomRight: Radius.circular(5.r),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        '+',
                                        style: text600_16.copyWith(
                                            color: AppColor.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            const Text(
                              '2 QTY. X ₹1,791 RATE ',
                              style: TextStyle(
                                color: Color(0xFF758090),
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'SF Pro Display',
                                fontWeight: w400,
                                letterSpacing: 0.65,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 10.h),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.50, color: Color(0xFFFF8080)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text(
                                'Remove',
                                style: text400_14.copyWith(
                                    color: const Color(0xFFFF8080)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.h,
                ),
                itemCount: 5),
            myTitleWidget(title: "Total Paid Amount"),
            SizedBox(
              height: 20.h,
            ),
            ClipPath(
              clipper: MovieTicketClipper(),
              child: Material(
                color: const Color(0xFFF8F9FA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sub total', style: text400_16black),
                        Text('₹6,488.00', style: text400_16black)
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discount:', style: text400_16black),
                        SizedBox(
                          height: 35.h,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 35.h,
                                padding: EdgeInsets.all(8.r),
                                decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                    ),
                                  ),
                                ),
                                child: Text('12', style: text400_16black),
                              ),
                              Obx(() =>  PopupMenuButton<String>(
                                  tooltip: "Show Discount",
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  position: PopupMenuPosition.under,
                                  child: Container(
                                    height: 35.h,
                                    padding: EdgeInsets.all(8.r),
                                    decoration: const ShapeDecoration(
                                      color: Color(0x7F758090),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                      ),
                                    ),
                                    child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.myformattedDiscount.value.toString(),
                                          style: text600_16.copyWith(
                                              color: Colors.black),
                                        ),
                                        // const Center(child: Icon(Icons.keyboard_arrow_down_outlined))
                                      ],
                                    ),
                                  ),
                                  itemBuilder: (context) {
                                    return controller.menuItems
                                        .map((String item) {
                                      return PopupMenuItem<String>(

                                        value: item,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 6,
                                            right: 6,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(item,style: TextStyle(
                                                  color:  controller.selectedDiscount == item ? AppColor.primaryBlue : Colors.black
                                              )),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              const Spacer(),
                                              Icon(
                                                size: 18,
                                                controller.selectedDiscount == item
                                                    ? Icons.check
                                                    : null,
                                                color: AppColor.primaryBlue,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList();
                                  },
                                  onSelected: (String selectedItem) {
                                    controller.selectedDiscount.value = selectedItem;
                                    controller.myformattedDiscount.value = controller.extractedValue(selectedItem);

                                    controller.update();
                                  }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Obx(
                          () => ListView.separated(
                        itemCount: controller.myTextList.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    controller.myTextList.removeAt(index);
                                  },
                                  child: SvgPicture.asset(
                                    AppAsset.closeIcon,
                                    height: 12.h,
                                    width: 12.h,
                                  )),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                  controller.myTextList.value[index]['taxType']
                                      .toString(),
                                  style: text400_16black),
                              SizedBox(
                                width: 8.w,
                              ),
                              Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                        controller
                                            .myTextList.value[index]['taxValue']
                                            .toString(),
                                        style: text400_16black),
                                    SizedBox(
                                      width: 8.h,
                                    ),
                                    Text('%',
                                        style: text600_16.copyWith(
                                            color: const Color(0xFFB7BDC5))),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Text('₹1,027.70', style: text400_16black),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 24.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              insetPadding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                height: 280,
                                width: double.infinity,
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Center(
                                        child: Text(
                                          "Add TAX",
                                          style: text700_18,
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: const Icon(Icons.close))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  MyTextFiled(
                                    lableText: "TAX type",
                                    controller:
                                    controller.taxTypeController.value,
                                    prefixIcon: Transform.scale(
                                      scale: 30.h / 40.h,
                                      child: SvgPicture.asset(
                                        AppAsset.paymentsIcon,
                                        color: AppColor.filedIcon,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  MyTextFiled(
                                    lableText: "Add in %",
                                    keyboardType: TextInputType.number,
                                    controller: controller
                                        .taxPercentageController.value,
                                    suffixIcon: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF97A1B1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.percent,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ),
                                    prefixIcon: const SizedBox(
                                        width: 37,
                                        height: 37,
                                        child: Center(
                                            child: Text(
                                              "%",
                                              style: TextStyle(fontSize: 20),
                                            ))),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: mybutton(
                                            onTap: () {
                                              Get.back();
                                              controller.taxTypeController.value
                                                  .clear();
                                              controller
                                                  .taxPercentageController.value
                                                  .clear();
                                            },
                                            title: "Clear",
                                            textStyle: text400_16black,
                                            backgroundColor: Colors.white,
                                            borderColor:
                                            const Color(0x4C97A1B1)),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                          child: mybutton(
                                              onTap: () {
                                                if (controller.taxTypeController
                                                    .value.text.isEmpty) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                      "Please enter the TAX type");
                                                } else if (controller
                                                    .taxPercentageController
                                                    .value
                                                    .text
                                                    .isEmpty) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                      "Please enter the TAX of percentage");
                                                } else {
                                                  controller.myTextList.add({
                                                    "taxType": controller
                                                        .taxTypeController
                                                        .value
                                                        .text,
                                                    "taxValue": controller
                                                        .taxPercentageController
                                                        .value
                                                        .text
                                                  });
                                                  print(
                                                      "=============================================");
                                                  Get.back();
                                                  controller
                                                      .taxTypeController.value
                                                      .clear();
                                                  controller
                                                      .taxPercentageController
                                                      .value
                                                      .clear();
                                                  print(controller.myTextList);
                                                }
                                              },
                                              title: "Add"))
                                    ],
                                  )
                                ]).paddingAll(20.r),
                              ),
                            );
                          },
                        );
                      },
                      child: SizedBox(
                        height: 36,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              color: AppColor.primaryBlue,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Add TAX",
                              style: text600_16blue,
                            )
                          ],
                        ),
                      ),
                    ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount',
                            style: text700_18.copyWith(fontSize: 16.sp)),
                        Text('₹7,250.99',
                            style: text700_18.copyWith(
                                fontSize: 16.sp, color: AppColor.primaryBlue))
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            // GetBuilder<EstAddItemsController>(
            //     builder: (controller) {
            //       return CustomDropdown(
            //         items: controller.dropdownItems,
            //         value: controller.selectedDiscount.value,
            //         lableText: '',
            //         onChanged: (value) {
            //           controller.selectedDiscount!.value = value!;
            //           controller.update();
            //
            //         },
            //       );
            //     }),

            GetBuilder(
              builder: (InvoiceAddClientController controller) {
                return mybutton(
                  onTap: () {
                    myController.updateActive(3);
                    print("taped");
                  },
                  title: "Next",
                );
              },
            ),

          ]),
        ));
  }
}
