import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';

class MyPhotoView extends StatefulWidget {
  final File imageUrl;

  const MyPhotoView({super.key, required this.imageUrl});

  @override
  MyPhotoViewState createState() => MyPhotoViewState();
}

class MyPhotoViewState extends State<MyPhotoView> {

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: FileImage(widget.imageUrl),
    );

  }
}