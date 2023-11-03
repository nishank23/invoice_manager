import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:invoice_generator/app/global/constants/app_color.dart';
import 'package:invoice_generator/app/global/constants/constants.dart';
import 'package:invoice_generator/app/routes/app_pages.dart';

import '../../../global/constants/app_asset.dart';
import '../../../global/constants/app_fonts.dart';
import '../../../global/widgets/mytextfiled.dart';
import '../views/MenuItem.dart';

class BottomsheetController extends GetxController {
  RxInt selected_index = 0.obs;

  Rx<String> companyName = "".obs;
  Rx<String> userProfile = "".obs;
  Rx<String> userNo = "".obs;

  GetStorage box = GetStorage();

  void onTapped(int index) {
    selected_index.value = index;
    Get.back(closeOverlays: true);
    update();
    print(selected_index);
  }

  @override
  void onInit() {
    if (box.read(Constant.companyName) != null) {
      companyName.value = box.read(Constant.companyName);
      userNo.value = box.read(Constant.mobilenumber);
    }

    if (box.read(Constant.userPhoto) != null) {
      userProfile.value = box.read(Constant.userPhoto);
    }

    update();
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

  List<MenuItem> menuItems = [
    MenuItem(
      title: "Dashboard",
      icon: SvgPicture.asset(
        AppAsset.dashboardIcon,
        height: 16.h,
        width: 16.w,
        color: const Color(0xff49454F),
      ),
      selected_icon: SvgPicture.asset(
        AppAsset.dashboardIcon,
        height: 18.h,
        width: 18.w,
        color: AppColor.primaryBlue,
      ),
      onTap: () {
        Get.offNamed(Routes.HOME);
        print("Dashboard tapped");
      },
    ),
    MenuItem(
      title: "Clients",
      icon: SvgPicture.asset(
        AppAsset.clientIcon,
        height: 16.h,
        width: 16.w,
      ),
      selected_icon: SvgPicture.asset(
        AppAsset.clientIcon,
        height: 18.h,
        width: 18.w,
        color: AppColor.primaryBlue,
      ),
      onTap: () {
        Get.offNamed(Routes.CLIENTS);
        print("Clients tapped");
      },
    ),
    MenuItem(
      title: "Estimated",
      icon: SvgPicture.asset(
        AppAsset.estimatedIcon,
        height: 16.h,
        width: 16.w,
      ),
      selected_icon: SvgPicture.asset(
        AppAsset.estimatedIcon,
        height: 18.h,
        width: 18.w,
        color: AppColor.primaryBlue,
      ),
      onTap: () {
        Get.offNamed(Routes.ESTIMATED);

        print("Estimated tapped");
      },
    ),
    MenuItem(
      title: "My Products",
      icon: SvgPicture.asset(
        AppAsset.myProductsIcon,
        height: 16.h,
        width: 16.w,
      ),
      selected_icon: SvgPicture.asset(
        AppAsset.myProductsIcon,
        height: 18.h,
        width: 18.w,
      ),
      onTap: () {
        Get.offNamed(Routes.MY_PRODUCTS);
        print("My Products tapped");
      },
    ),
    MenuItem(
      title: "Invoices",
      icon: SvgPicture.asset(
        AppAsset.InvoicesIcon,
        height: 16.h,
        width: 16.w,
      ),
      selected_icon: SvgPicture.asset(
        AppAsset.InvoicesIcon,
        height: 18.h,
        width: 18.w,
      ),
      onTap: () {
        Get.offNamed(Routes.INVOICES);

        // showCurrencyPicker(
        //   context: Get.context!,
        //   showFlag: true,
        //   showSearchField: true,
        //   showCurrencyName: true,
        //   showCurrencyCode: true,
        //   onSelect: (Currency currency) {
        //     print('Select currency: ${currency.name}');
        //   },
        //   favorite: ['SEK'],
        // );
        print("Invoices tapped");
      },
    ),
    MenuItem(
      title: "Backup & Restore",
      icon: SvgPicture.asset(
        AppAsset.backupIcon,
        height: 16.h,
        width: 16.w,
      ),
      selected_icon: SvgPicture.asset(
        AppAsset.backupIcon,
        height: 18.h,
        width: 18.w,
      ),
      onTap: () {
        // showModalBottomSheet(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(20.0),
        //   ),
        //   backgroundColor: Colors.white,
        //   context: Get.context!,
        //   isScrollControlled: true,
        //   builder: (BuildContext context) {
        //     return DraggableScrollableSheet(
        //       expand: false,
        //       minChildSize: .9,
        //       // 0.1 times of available height, sheet can't go below this on dragging
        //       maxChildSize: .9,
        //       // 0.7 times of available height, sheet can't go above this on dragging
        //       initialChildSize: .9,
        //       // 0.1 t
        //
        //       builder:
        //           (BuildContext context, ScrollController scrollController) {
        //         return Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 20.w),
        //           child: Column(
        //             children: [
        //               Center(
        //                   child: Container(
        //                 margin: EdgeInsets.only(top: 16.h),
        //                 height: 3,
        //                 width: 80,
        //                 decoration: BoxDecoration(
        //                     color: const Color(0xFFD0D0D0),
        //                     borderRadius: BorderRadius.circular(30.r)),
        //               )),
        //               SizedBox(
        //                 height: 16.h,
        //               ),
        //               mySearchFiled(
        //                 texthint: "Search currencies...",
        //                 height: 56.h,
        //                 controller: TextEditingController(),
        //                 onChanged: (value) {},
        //               ),
        //               SizedBox(
        //                 height: 15.h,
        //               ),
        //               Expanded(
        //                 child: ListView.builder(
        //                     shrinkWrap: true,
        //                     padding: EdgeInsets.zero,
        //                     itemBuilder: (context, index) {
        //                       return const SizedBox(
        //                         height: 50,
        //                         child: ListTile(
        //                           minVerticalPadding: 0,
        //                           leading: Column(
        //                             mainAxisSize: MainAxisSize.min,
        //                             crossAxisAlignment: CrossAxisAlignment.center,
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             children: [
        //                               Text(
        //                                 "🇦🇫",
        //                                 textAlign: TextAlign.center,
        //                                 style: TextStyle(fontSize: 25),
        //                               ),
        //                             ],
        //                           ),
        //                           dense: true,
        //                           contentPadding:
        //                               EdgeInsets.only(left: 0.0, right: 0.0),
        //                           horizontalTitleGap: 15,
        //                           minLeadingWidth: 15,
        //                           title: Text(
        //                             "USD",
        //                           ),
        //                           subtitle: Text("United States Dollar"),
        //                           trailing: Column(
        //                             mainAxisSize: MainAxisSize.max,
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             crossAxisAlignment: CrossAxisAlignment.center,
        //                             children: [
        //                               Text(
        //                                 '\$',
        //                                 style: TextStyle(fontSize: 25),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       );
        //                     },
        //                     itemCount: 10),
        //               )
        //             ],
        //           ),
        //         );
        //       },
        //     );
        //   },
        // );
        Get.offNamed(Routes.BACKUP_RESTORE);

        print("Backup & Restore tapped");
      },
    ),
    MenuItem(
      title: "My Profile",
      icon: SvgPicture.asset(
        AppAsset.personIcon,
        height: 16.h,
        width: 16.w,
      ),
      selected_icon: SvgPicture.asset(
        AppAsset.personIcon,
        height: 18.h,
        width: 18.w,
      ),
      onTap: () {
        Get.toNamed(Routes.TABS);
        print("My Profile tapped");
      },
    ),
  ];
}
