import 'dart:async';

import 'package:flutter/foundation.dart';

class TimerModel extends ChangeNotifier {
  static int _counter = 5;
  // int startValue;
  Timer _timer;
  TimerModel();
  bool running = true;

  int get counterValue => _counter;
  // set counterValue(int counter) {
  //   _counter = counter;
  // }

  void startCounter(int start) {
    _counter = start;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_counter <= 0) {
        running = false;
        notifyListeners();
        _timer.cancel();
        // Navigator.of(context).pushNamed("/over");
      } else {
        _counter--;
        notifyListeners();
      }
    });
  }

  void resetCounter(int start) {
    _counter = start;
  }

  void stopTimerAndReset() {
    _counter = 5;
    _timer.cancel();
    running = true;
  }
}
