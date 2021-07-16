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
    if (score % 10 == 0) {
      levelUp();
    }
  }

  void resetGame() {
    score = 0;
    level = 1;
    gameOver = false;
  }
}
