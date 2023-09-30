import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_generator/Models/getAllCountry.dart';

import 'CountryModelBottomSheetController.dart';

class CountryModelBottomSheet extends GetView<CountryModelBottomSheetController> {
  final Function(CountryData?) onItemSelected;

  const CountryModelBottomSheet({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
