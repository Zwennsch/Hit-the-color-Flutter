import 'package:flutter/foundation.dart';

class GameLogic extends ChangeNotifier {
  int score = 0;
  int level = 1;
  bool gameOver = false;

  void levelUp() {
    level++;
    notifyListeners();
  }

  void scoreUp() {
    score++;
    notifyListeners();
  }
}
