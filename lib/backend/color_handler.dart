import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';

enum MyButtonColor { blue, green, red, yellow }

class ColorHandler extends ChangeNotifier {
  static List<String> myColorNames = ["BLUE", "GREEN", "RED", "YELLOW"];
  final Random _random = Random();
  List<Color> _buttonColorsList = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow
  ];

  UnmodifiableListView<Color> get buttonColorList {
    return UnmodifiableListView(_buttonColorsList);
  }

  // the current Color is always the first element in the List
  Color _centerButtonColor = Colors.green;
  Color get centerButtonColor => _centerButtonColor;

  String _currentColorName = myColorNames[0];
  String get centerColorName => _currentColorName;


  static Map<Color, String> colorStringMap = {
    Colors.blue: "BLUE",
    Colors.green: "GREEN",
    Colors.red: "RED",
    Colors.yellow: "YELLOW"
  };


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

  Color getRandomColor() {
    Color randomColor =
        _buttonColorsList[_random.nextInt(_buttonColorsList.length)];
    return randomColor;
  }

  void shuffleColorAndNamesLists() {
    myColorNames.shuffle();
    _buttonColorsList.shuffle();
    _centerButtonColor = _buttonColorsList[0];
    _currentColorName = myColorNames[0];
    notifyListeners();
  }

  bool checkColorForButton(int buttonNr) {
    String colorOfPushedButton = colorStringMap[_buttonColorsList[buttonNr]];
    if (colorOfPushedButton == centerColorName) {
      shuffleColorAndNamesLists();
      return true;
    } else
      return false;
  }
}
