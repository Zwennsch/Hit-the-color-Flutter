import 'package:flutter/material.dart';

enum MyButtonColor { blue, green, red, yellow }

class ColorHandler {
  static List<MyButtonColor> myColors = [
    MyButtonColor.blue,
    MyButtonColor.green,
    MyButtonColor.red,
    MyButtonColor.yellow
  ];

//  static List<MyButtonColor> get colorList{
//    return myColors;
//  }

  static Color getButtonColor(MyButtonColor color) {
    if (color == MyButtonColor.blue)
      return Colors.blue;
    else if (color == MyButtonColor.red)
      return Colors.red;
    else if (color == MyButtonColor.green)
      return Colors.green;
    else
      return Colors.yellow;
  }

  static String getButtonColorName(MyButtonColor color) {
    if (color == MyButtonColor.blue)
      return "BLUE";
    else if (color == MyButtonColor.red)
      return "RED";
    else if (color == MyButtonColor.green)
      return "GREEN";
    else
      return "YELLOW";
  }

   static void shuffleList() {
    myColors.shuffle();
  }
}
