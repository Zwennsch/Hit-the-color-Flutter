import 'package:flutter/material.dart';
import 'package:hit_the_color/backend/color_handler.dart';
import 'package:hit_the_color/backend/game_logic.dart';
import 'package:hit_the_color/backend/theming.dart';
import 'package:hit_the_color/backend/timer_model.dart';
// import 'package:hit_the_color/screens/over_screen.dart';
import 'package:provider/provider.dart';

class PlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int currentLevel = context.watch<GameLogic>().level;
    int currentScore = context.watch<GameLogic>().score;
    GameLogic gameLogic = context.watch<GameLogic>();
    ColorHandler _handler = context.watch<ColorHandler>();
    final TimerModel _timerModel = context.watch<TimerModel>();

    void checkForCorrectButton(int buttonNr, int resetCounterValue) {
      if (_handler.checkColorForButton(buttonNr) && _timerModel.running) {
        _timerModel.resetCounter(resetCounterValue);
        gameLogic.scoreUp();
        _handler.shuffleColorAndNamesLists();
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/over', (route) => false);
      }
    }

    return StatefulWrapper(
      onInit: () {
        context.read<TimerModel>().startCounter(5);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Hit The Color"),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    "LEVEL: $currentLevel",
                    style: levelAndScore,
                  ),
                  Text(
                    "SCORE: $currentScore",
                    style: levelAndScore,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      checkForCorrectButton(0, 5);
                    },
                    child: Container(
                        width: 100,
                        height: 75,
                        color:
                            context.watch<ColorHandler>().buttonColorList[0]),
                  ),
                  TextButton(
                    onPressed: () {
                      checkForCorrectButton(1, 5);
                    },
                    child: Container(
                        width: 100,
                        height: 75,
                        color:
                            context.watch<ColorHandler>().buttonColorList[1]),
                  )
                ],
              ),
              Center(
                child: Container(
                  width: 150,
                  height: 75,
                  color: context.watch<ColorHandler>().centerButtonColor,
                  child: Center(
                    child: Text(
                      context.watch<ColorHandler>().centerColorName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      checkForCorrectButton(2, 5);
                    },
                    child: Container(
                        width: 100,
                        height: 75,
                        color:
                            context.watch<ColorHandler>().buttonColorList[2]),
                  ),
                  TextButton(
                    onPressed: () {
                      checkForCorrectButton(3, 5);
                    },
                    child: Container(
                        width: 100,
                        height: 75,
                        color:
                            context.watch<ColorHandler>().buttonColorList[3]),
                  )
                ],
              ),
              Center(
                child: Text(
                  _timerModel.counterValue.toString(),
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Wrapper for stateful functionality to provide onInit calls in stateles widget
class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  const StatefulWrapper({@required this.onInit, @required this.child});
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
