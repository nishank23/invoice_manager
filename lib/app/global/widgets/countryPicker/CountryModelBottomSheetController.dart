import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/Models/getAllCountry.dart';
import 'package:invoice_generator/app/global/widgets/mytextfiled.dart';

import '../../../../main.dart';
import '../../../../services/Connectivity/networkClient.dart';
import '../../constants/api_const.dart';
import '../custom_dialog.dart';

class CountryModelBottomSheetController extends GetxController {
  final RxList<CountryData> countryData = <CountryData>[].obs;
  final RxList<CountryData> filteredCountryData = <CountryData>[].obs;
  final TextEditingController searchController = TextEditingController();




  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }


  Future<CountryData?> GetCountryModelSheet({required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    app.resolve<CustomDialogs>().showCircularDialog(context);
    countryData.clear();
    Completer<CountryData?> completer = Completer<CountryData?>();

    await NetworkClient.getInstance.callApi(
      context,
      baseURL,
      ApiConstant.getAllCountry,
      MethodType.Get,
      headers: NetworkClient.getInstance.getAuthHeaders(),
      successCallback: (response, message) async {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        GetAllCountry allCountry = GetAllCountry.fromJson(response);
        countryData!.value = allCountry.countryData!;
        print(allCountry.countryData);
        update();
        refresh();


        final selectedCountry = await showCountryModelBottomSheet(context, countryData.value);
        completer.complete(selectedCountry);


      },
      failureCallback: (status, message) {
        app.resolve<CustomDialogs>().hideCircularDialog(context);

        app.resolve<CustomDialogs>().getDialog(title: "Failed", desc: message);
        print("error");
        completer.complete(null);

      },
    );
    return completer.future;

  }






  void filterCountryList(String query) {
    query = query.toLowerCase();
    if (query.isEmpty) {
      filteredCountryData.value = countryData;
    } else {
      final List<CountryData> filteredList = countryData.where((country) {
        final String name = country.name!.toLowerCase();
        final String currency = country.currency!.toLowerCase();
        final String currency_name = country.currencyName!.toLowerCase();
        return name.contains(query) || currency.contains(query) || currency_name.contains(query);
      }).toList();
      filteredCountryData.value = filteredList;

      update();
    }
  }

  Future<CountryData?> showCountryModelBottomSheet(BuildContext context, List<CountryData> countryData) async {
    this.countryData.value = countryData;
    filterCountryList("");

    searchController.clear();

    final selectedCountry = await showModalBottomSheet<CountryData>(
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
          maxChildSize: .9,
          initialChildSize: .9,
          builder: (BuildContext context, ScrollController scrollController) {
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
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  mySearchFiled(
                    texthint: "Search currencies...",
                    height: 56.h,
                    controller: searchController,
                    onChanged: filterCountryList,
                  ),
                  SizedBox(height: 15.h),
                  Expanded(
                    child: Obx(() => ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: filteredCountryData.length,
                      itemBuilder: (context, index) {
                        final country = filteredCountryData[index];
                        return GestureDetector(
                          onTap: () {
                            Get.back(result: country);
                          },
                          child: SizedBox(
                            height: 50,
                            child: ListTile(
                              minVerticalPadding: 0,
                              leading: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    country.emoji.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ),
                              dense: true,
                              contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                              horizontalTitleGap: 15,
                              minLeadingWidth: 15,
                              title: Text(
                                country.currency ?? "",
                              ),
                              subtitle: Text(country.name ?? ""),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    country.currencySymbol ?? "",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    return selectedCountry;
  }

}
