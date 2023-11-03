// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/app/global/widgets/mytextfiled.dart';

import '../../../Models/get_all_country.dart';

class CurrencyBottomSheet extends StatefulWidget {
  final List<CountryData> countryData;
  final Function(CountryData?) onItemSelected;

  const CurrencyBottomSheet({
    super.key,
    required this.countryData,
    required this.onItemSelected,
  });

  @override
  _CurrencyBottomSheetState createState() => _CurrencyBottomSheetState();
}

class _CurrencyBottomSheetState extends State<CurrencyBottomSheet> {
  late List<CountryData> filteredCountryData;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    filteredCountryData = widget.countryData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      /*showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Colors.white,
              context: Get.context!,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                  expand: false,
                  minChildSize: .9,
                  maxChildSize: .9,
                  initialChildSize: .9,
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
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          mySearchFiled(
                            texthint: "Search currencies...",
                            height: 56.h,
                            controller: TextEditingController(),
                            onChanged: (value) {},
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: filteredCountryData.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    widget.onItemSelected(filteredCountryData[index]);
                                  },
                                  child: SizedBox(
                                    height: 50,
                                    child: ListTile(
                                      minVerticalPadding: 0,
                                      leading: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text(
                                            filteredCountryData[index].emoji
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ],
                                      ),
                                      dense: true,
                                      contentPadding: EdgeInsets.only(
                                          left: 0.0, right: 0.0),
                                      horizontalTitleGap: 15,
                                      minLeadingWidth: 15,
                                      title: Text(
                                        filteredCountryData[index].currency ?? "",
                                      ),
                                      subtitle: Text(
                                          filteredCountryData[index].name ?? ""),
                                      trailing: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Text(
                                            filteredCountryData[index]
                                                .currencySymbol ?? "",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
          );*/

      showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.white,
        context: Get.context!,
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
                          borderRadius: BorderRadius.circular(30.r)),
                    )),
                    SizedBox(
                      height: 16.h,
                    ),
                    MySearchFiled(
                      texthint: "Search currencies...",
                      height: 56.h,
                      controller: TextEditingController(),
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return const SizedBox(
                              height: 50,
                              child: ListTile(
                                minVerticalPadding: 0,
                                leading: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "🇦🇫",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ],
                                ),
                                dense: true,
                                contentPadding:
                                    EdgeInsets.only(left: 0.0, right: 0.0),
                                horizontalTitleGap: 15,
                                minLeadingWidth: 15,
                                title: Text(
                                  "USD",
                                ),
                                subtitle: Text("United States Dollar"),
                                trailing: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\$',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
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
      );
    });
  }

  void onSearchTextChanged(String value) {
    setState(() {
      filteredCountryData = widget.countryData
          .where((country) =>
              country.name?.toLowerCase().contains(value.toLowerCase()) ??
              false)
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
