import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hit_the_color/backend/color_handler.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int score = 0;
  int level = 1;
  List<MyButtonColor> currentColors;
  Timer _timer;
  bool _gameOver = false;
  int counter = 5;

  void startCounter() {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (counter <= 0) {
          _gameOver = true;
          _timer.cancel();
          Navigator.of(context).pushNamed("/over");
        } else {
          counter--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    currentColors = ColorHandler.myColors;
    startCounter();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Hit The Color"),
        leading: Row(
          children: [
            SizedBox(
              width: 3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("level: $level"),
                Text("score: $score"),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    print("pressed");
                  },
                  child: Container(
                    width: 100,
                    height: 75,
                    color: ColorHandler.getButtonColor(currentColors[0]),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print("pressed");
                  },
                  child: Container(
                      width: 100,
                      height: 75,
                      color: ColorHandler.getButtonColor(currentColors[1])),
                )
              ],
            ),
            Center(
              child: Container(
                width: 150,
                height: 75,
                color: Colors.amber,
                child: Center(
                  child: Text(
                    "theColor",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    print("pressed");
                  },
                  child: Container(
                    width: 100,
                    height: 75,
                    color: ColorHandler.getButtonColor(currentColors[2]),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print("pressed");
                  },
                  child: Container(
                      width: 100,
                      height: 75,
                      color: ColorHandler.getButtonColor(currentColors[3])),
                )
              ],
            ),
            Center(
              child: Text(
                counter.toString(),
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
