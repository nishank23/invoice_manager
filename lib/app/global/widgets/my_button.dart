import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_generator/app/global/constants/app_color.dart';
import 'package:invoice_generator/app/global/constants/app_fonts.dart';
import 'package:invoice_generator/app/global/theme/text.dart';

/*
final TextStyle text600_16 = TextStyle(
    color: AppColor.white,
    fontSize: 16.sp,
    fontFamily: fontFamily,
    fontWeight: w600
);

InkWell mybutton({
  required VoidCallback onTap,
  double height = 48,
  double? width ,
  String? title,
  Color? backgroundColor = AppColor.primaryBlue,
  double vertical = 0,
  double horizontal = 0,
  Color? textstyleColor,
  Color borderColor = Colors.transparent,
  Widget? widget,
  double? fontsize = 14,
  double? radius = 10,
  TextStyle? textStyle

}) {
  return InkWell(onTap: onTap,borderRadius: BorderRadius.circular(radius!.r),
    child: Container(
        margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        height: height.h,
        width: width,
        decoration: BoxDecoration(border: Border.all(color: borderColor,),
          borderRadius: BorderRadius.circular(radius!.r),
          color: backgroundColor,
        ),
        alignment: Alignment.center,
        child: (widget != null)
            ? Center(child: widget)
            : TextWidget(
                text: title!,
                textStyle: textStyle ?? text600_16,
              )),
  );
}
*/
final TextStyle text600_16 = TextStyle(
  color: AppColor.white,
  fontSize: 16.sp,
  fontFamily: fontFamily,
  fontWeight: w600,
);

ElevatedButton mybutton({
  required VoidCallback onTap,
  double height = 48,
  double? width,
  String? title,
  Color? backgroundColor = AppColor.primaryBlue,
  double vertical = 0,
  double horizontal = 0,
  Color? textStyleColor,
  Color borderColor = Colors.transparent,
  Widget? widget,
  double? fontSize = 14,
  double? radius = 10,
  TextStyle? textStyle,
}) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!.r),
        side: BorderSide(color: borderColor),
      ),
      minimumSize: Size(width ?? double.infinity, height.h),
    ),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: (widget != null)
          ? Center(child: widget)
          : TextWidget(
        text: title!,
        textStyle: textStyle ?? text600_16,
      ),
    ),
  );
}