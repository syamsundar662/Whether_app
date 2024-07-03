import 'package:flutter/material.dart';

class CustomColors {
  static const dividerLine = Color(0xffE4E4EE);
  static const cardColor =    Color.fromARGB(255, 29, 32, 45);
  static const textColorBlack = Color.fromARGB(255, 255, 255, 255);
  static const firstGradientColor = Color(0xff408ADE);
  static const secondGradientColor = Color(0xff5286CD);
  static const containerColor = Color.fromARGB(255, 29, 32, 45);
}

late double screenFullWidth;
late double screenFullHeight;
void size(BuildContext context) {
  screenFullWidth = MediaQuery.of(context).size.width;
  screenFullHeight = MediaQuery.of(context).size.height;
}
