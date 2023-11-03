import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_color.dart';
import '../constants/app_fonts.dart';

class CustomDropdown extends StatefulWidget {
  final double height;
  final double vertical;
  final double horizontal;
  final List<Map<String, dynamic>> items;
  final String? value;
  final String lableText;
  final double radius;
  final Function(String?) onChanged;
  final Widget? prefixIcon;
 final FormFieldValidator? onValidator;

  const CustomDropdown({
    super.key,
    this.height = 53,
    this.vertical = 0,
    this.horizontal = 0,
    required this.items,
    required this.value,
    required this.lableText,
    required this.onChanged,
    this.radius = 10,
    this.prefixIcon,
    this.onValidator
  });

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

final FocusNode focusNode = FocusNode();

class CustomDropdownState extends State<CustomDropdown> {
  bool textEditHasFocus = false;

  @override
  void initState() {
    super.initState();
  }

  bool onFocus = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 8.h),
            DropdownButtonFormField2<String>(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.onValidator,
              decoration: InputDecoration(
                filled: true,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 40,
                  minHeight: 25,
                ),
               prefixIcon: widget.prefixIcon,

/*
                contentPadding: EdgeInsets.fromLTRB(35.w, 0.h, 0.w, 20.h),
*/
                fillColor: Colors.white,

                contentPadding: EdgeInsets.fromLTRB(
                    35.w, 0.h, 16.w, 20.h),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff97A1B1)),
                  borderRadius: BorderRadius.circular(widget.radius.r),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff97A1B1)),
                  borderRadius: BorderRadius.circular(widget.radius.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff663CEF)),
                  // Set the error border color to blue
                  borderRadius: BorderRadius.circular(widget.radius.r),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff663CEF)),
                  // Set the error border color to blue
                  borderRadius: BorderRadius.circular(widget.radius.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff663CEF)),
                  borderRadius: BorderRadius.circular(widget.radius.r),
                ),






              ),
              style: text400_16grey.copyWith(color: AppColor.black),
              isDense: true,
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              items: widget.items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item['id'].toString(),
                      child: Text(
                        item['title'].toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              value: widget.value == "" ? null : widget.value,
              onChanged: widget.onChanged,

              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: AppColor.textFiledGrey,
                ),
              ),
              buttonStyleData: ButtonStyleData(
                padding: EdgeInsets.only(right: 10.w),
                elevation: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 50.h,
              ),
            ),
          ],
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          left: widget.value != null ? 12.w : 53.w,
          top: widget.value != null ? 0 : 25,
          child: InkWell(
            onTap: () {
              focusNode.requestFocus();
            },
            child: Container(
              padding: EdgeInsets.only(left: 3.w, right: 3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              child: Text(
                widget.lableText,
                // ignore: unrelated_type_equality_checks
                style: widget.value != null
                    ? text400_12blue
                    : text400_12blue.copyWith(color: AppColor.textFiledGrey),
              ),
            ),
          ),
        ),
      /*  Positioned.fill(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(left: 16.w, top:5),
              color: Colors.transparent,
              child: widget.prefixIcon,
            ),
          ),
        ),*/
      ],
    );
  }
}
