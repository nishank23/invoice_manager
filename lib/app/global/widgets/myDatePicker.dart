import 'package:flutter/material.dart';
import 'package:invoice_generator/app/global/constants/app_color.dart';

class DatePicker {
  static Future<DateTime?> showDatePickerDialog(BuildContext context,
      {required DateTime initialDate, required DateTime firstDate, required DateTime lastDate}) async {
    final ThemeData theme = Theme.of(context);

    final ThemeData customizedTheme = theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: AppColor.primaryBlue, // Replace with your desired color
      ),
    );

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2010),
      lastDate: lastDate ?? DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: customizedTheme,
          child: child!,
        );
      },
    );

    return picked;
  }
}
