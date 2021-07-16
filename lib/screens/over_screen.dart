import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hit_the_color/backend/game_logic.dart';
import 'package:hit_the_color/backend/timer_model.dart';
import 'package:provider/provider.dart';

class OverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _gameProvider = context.watch<GameLogic>();
    var _timerProviser = context.watch<TimerModel>();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/splash.png"), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(
          //   height: 30,
          // ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "GAME OVER",
              style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () {
                  _gameProvider.resetGame();
                  _timerProviser.stopTimerAndReset();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/start', (route) => false);
                },
                child: Text('Restart')),
            ElevatedButton(onPressed: () => exit(0), child: Text('Quit'))
          ]),
        ],
      ),
    );
  }
}
