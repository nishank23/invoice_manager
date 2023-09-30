import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';

class MyPhotoView extends StatefulWidget {
  final File imageUrl;

  MyPhotoView({required this.imageUrl});

  @override
  _MyPhotoViewState createState() => _MyPhotoViewState();
}

class _MyPhotoViewState extends State<MyPhotoView> {

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: FileImage(widget.imageUrl),
    );

  }
}