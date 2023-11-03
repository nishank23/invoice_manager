import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_generator/Models/get_all_country.dart';

import 'country_model_bottomsheet_controller.dart';

class CountryModelBottomSheet extends GetView<CountryModelBottomSheetController> {
  final Function(CountryData?) onItemSelected;

  const CountryModelBottomSheet({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
