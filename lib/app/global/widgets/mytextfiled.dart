import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_generator/app/global/constants/app_color.dart';
import 'package:invoice_generator/app/global/constants/app_fonts.dart';

import '../constants/app_asset.dart';

// ignore: must_be_immutable
class MyTextFiled extends StatefulWidget {
  final double height;
  final double vertical;
  final double horizontal;
  final Color? textstyleColor;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String lableText;
  final double? fontsize;
  final double radius;
  final int maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool obscureText;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  FormFieldValidator? onValidator;

  MyTextFiled(
      {Key? key,
      this.height = 53,
      this.vertical = 0,
      this.horizontal = 0,
      this.textstyleColor,
      required this.controller,
      this.prefixIcon,
      required this.lableText,
      this.fontsize,
      this.radius = 10,
      this.readOnly = false,
      this.obscureText = false,
      this.keyboardType,
      this.onTap,
      this.onChanged,
      this.onValidator,
      this.suffixIcon,
      this.maxLines = 1,
      this.maxLength})
      : super(key: key);

  @override
  MyTextFiledState createState() => MyTextFiledState();
}

class MyTextFiledState extends State<MyTextFiled> {
  final FocusNode _focusNode = FocusNode();
  bool textEditHasFocus = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      textEditHasFocus = _focusNode.hasFocus;

      setState(() {});

      widget.onChanged?.call(widget.controller!.value.text);
      setState(() {
        if (widget.onValidator != null) {
          _errorMessage = widget.onValidator!(
              widget.controller!.value.text); // Update error message here
        }
      });
    });
  }

  void validate() {
    if (widget.onValidator != null) {
      _errorMessage = widget.onValidator!(widget.controller!.text);
    }
    setState(() {});
  }

  bool onFocus = false;
  // ignore: unused_field
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    double bottomInsets = MediaQuery.of(context).viewInsets.bottom.h;

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              // height: widget.height,
              child: TextFormField(
                style: text400_16grey.copyWith(color: AppColor.black),
                onChanged: (value) {
                  widget.onChanged?.call(value);
                  setState(() {
                    /*  if (widget.onValidator != null) {
                      _errorMessage = widget
                          .onValidator!(value); // Update error message here
                    }*/
                  });
                },
                onTap: widget.onTap,
                obscureText: widget.obscureText,
                keyboardType: widget.keyboardType,
                focusNode: _focusNode,
                readOnly: widget.readOnly,
                scrollPadding: EdgeInsets.only(bottom: bottomInsets + 100.h),
                controller: widget.controller,
                maxLength: widget.maxLength,
                maxLines: widget.maxLines,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: widget.onValidator,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: widget.prefixIcon,
                  counterText: "",
                  suffixIcon: widget.suffixIcon,
                  // labelText: widget.lableText,
                  // labelStyle: onFocus? text400_12blue : text400_12blue.copyWith(color:AppColor.textFiledGrey ),
                  // contentPadding: EdgeInsets.only(left: 53.w, right: 16.w,),
                  contentPadding: EdgeInsets.fromLTRB(
                      widget.prefixIcon == null ? 12.w : 0.w, 20.h, 16.w, 0.h),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff97A1B1)),
                    borderRadius: BorderRadius.circular(widget.radius.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff97A1B1)),
                    borderRadius: BorderRadius.circular(widget.radius.r),
                  ),
                  errorMaxLines: 1,
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff663CEF)),
                    // Set the error border color to blue
                    borderRadius: BorderRadius.circular(widget.radius.r),
                  ),

                  focusedErrorBorder: OutlineInputBorder(
                    gapPadding: 50,
                    borderSide: const BorderSide(color: Color(0xff663CEF)),
                    // Set the error border color to blue
                    borderRadius: BorderRadius.circular(widget.radius.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff663CEF)),
                    borderRadius: BorderRadius.circular(widget.radius.r),
                  ),
                ),
              ),
            ),
            /* if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "$_errorMessage",
                  style: text400_12blue.copyWith(color: AppColor.textFiledGrey),
                ),
              )*/
/*
              Container(height: 20,color: Colors.blue,)
*/
          ],
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          left: widget.controller!.text.isNotEmpty || textEditHasFocus
              ? 12.w
              : widget.prefixIcon == null
                  ? 12.w
                  : 53.w,
          top: widget.controller!.text.isNotEmpty || textEditHasFocus
              ? 0.h
              : widget.maxLines != 1
                  ? 15
                  : 24,
          child: InkWell(
            onTap: () {
              _focusNode.requestFocus();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 3, right: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              child: Text(
                widget.lableText,
                style: textEditHasFocus
                    ? text400_12blue
                    : text400_12blue.copyWith(color: AppColor.textFiledGrey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ToDO=============================================    search filed   =============================================================================================================================================================

// ignore: must_be_immutable
class MySearchFiled extends StatefulWidget {
  final double height;
  final double vertical;
  final double horizontal;
  final Color? textstyleColor;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? fontsize;
  final String? texthint;
  final double radius;
  final bool readOnly;
  final bool obscureText;
  final bool autocorrect;
  final bool autofocus;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  FormFieldValidator? onValidator;

  MySearchFiled({
    super.key,
    required this.height,
    this.vertical = 0,
    this.horizontal = 0,
    required this.texthint,
    this.textstyleColor,
    required this.controller,
    this.prefixIcon,
    this.fontsize,
    this.radius = 50,
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.onChanged,
    this.onValidator,
    this.suffixIcon,
    this.autocorrect = false,
    this.autofocus = false,
  });

  @override
  State<MySearchFiled> createState() => _MySearchFiledState();
}

class _MySearchFiledState extends State<MySearchFiled> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onTap: widget.onTap,
        autocorrect: widget.autocorrect,
        autofocus: widget.autofocus,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: Transform.scale(
            scale: 30.h / 56.h,
            child: SvgPicture.asset(
              AppAsset.searchIcon,
            ),
          ),
          counterText: "",
          suffixIcon: widget.suffixIcon,
          fillColor: const Color(0xFFF8F9FA),
          filled: true,
          hintText: widget.texthint,
          hintStyle: text300_16grey.copyWith(letterSpacing: 0.80),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFF8F9FA)),
            borderRadius: BorderRadius.circular(widget.radius.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFF8F9FA)),
            borderRadius: BorderRadius.circular(widget.radius.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFF8F9FA)),
            borderRadius: BorderRadius.circular(widget.radius.r),
          ),
        ),
      ),
    );
  }
}

final searchDecoration = InputDecoration(
    filled: true,
    fillColor: AppColor.searchgrey,
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
    prefixIcon: const Icon(Icons.search, color: AppColor.darkGrey),
    hintText: "Search client...",
    hintStyle: text300_16black.copyWith(color: const Color(0xff758090)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.searchgrey, width: 1.w),
        borderRadius: BorderRadius.circular(50.r)),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.searchgrey, width: 1.w),
        borderRadius: BorderRadius.circular(50.r)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.searchgrey, width: 1.w),
        borderRadius: BorderRadius.circular(50.r)));
