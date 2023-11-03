import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_color.dart';
import '../constants/app_fonts.dart';

Widget myTitleWidget({
  required String title,
}) {
  return Row(
    children: [
      Container(
        height: 30.h,
        width: 5.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColor.primaryBlue),
      ),
      SizedBox(
        width: 8.w,
      ),
      Text(
        title,
        style: text700_18,
      ),
    ],
  );
}

Widget myPreviewTitle({
  required String title,
}) {
  return Text(
    title,
    style: text300_14.copyWith(letterSpacing: 0.65,
        fontSize: 13, color: const Color(0xFF758090)),
  );
}

