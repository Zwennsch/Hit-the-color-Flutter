import 'dart:collection';

import 'package:flutter/material.dart';

enum MyButtonColor { blue, green, red, yellow }

class ColorHandler extends ChangeNotifier {
  static List<String> myColorNames = ["BLUE", "GREEN", "RED", "YELLOW"];
  // the current Color is always the first element in the List
  String _currentColor = myColorNames[0];

  String get currentColor => _currentColor;

  List<MyButtonColor> _myColors = [
    MyButtonColor.blue,
    MyButtonColor.green,
    MyButtonColor.red,
    MyButtonColor.yellow
  ];

  UnmodifiableListView<MyButtonColor> get myColorsList {
    return UnmodifiableListView(_myColors);
  }

  static Map<MyButtonColor, String> colorStringMap = {
    MyButtonColor.blue: "BLUE",
    MyButtonColor.green: "GREEN",
    MyButtonColor.red: "RED",
    MyButtonColor.yellow: "YELLOW"
  };

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

  void shuffleColorAndNamesLists() {
    _myColors.shuffle();
    myColorNames.shuffle();
    notifyListeners();
  }

  bool checkColorForButton(int i) {
    String colorOfPushedButton = colorStringMap[_myColors[i]];
    if (colorOfPushedButton == currentColor){
      shuffleColorAndNamesLists();
      return true;
    }
    else
      return false;
  }
}
