import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class MenuItem {
  final String title;
  final SvgPicture icon;
  final SvgPicture selected_icon;
  final VoidCallback onTap;
  // New property to indicate if the item is selected

  MenuItem({
    required this.title,
    required this.icon,
    required this.selected_icon,
    required this.onTap,

  });
}
