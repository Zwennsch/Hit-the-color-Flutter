import 'dart:async';

import 'package:flutter/foundation.dart';

class TimerModel extends ChangeNotifier {
  int _counter;
  int startValue;
  Timer _timer;
  TimerModel(this._counter);

  int get counterValue => _counter;

  void startCounter(int start) {
    _counter = start;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_counter <= 0) {
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
}
