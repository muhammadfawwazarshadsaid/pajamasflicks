import 'package:flutter/material.dart';

class IconImage {
  static customSize(fileName, double? width, double? height) {
    return SizedBox(
        width: width,
        height: height,
        child: FittedBox(fit: BoxFit.cover, child: Image.asset(fileName)));
  }
}
