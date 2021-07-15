import 'package:flutter/material.dart';
import 'package:hit_the_color/backend/color_handler.dart';
import 'package:hit_the_color/backend/game_logic.dart';
import 'package:hit_the_color/backend/timer_model.dart';
// import 'package:hit_the_color/screens/over_screen.dart';
import 'package:provider/provider.dart';

class PlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int currentLevel = context.watch<GameLogic>().level;
    int currentScore = context.watch<GameLogic>().score;
    List<MyButtonColor> currentColors =
        context.watch<ColorHandler>().myColorsList;
    ColorHandler handler = ColorHandler();
    return StatefulWrapper(
      onInit: () => context.read<TimerModel>().startCounter(5),
      child: Scaffold(
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
                  Text("level: $currentLevel"),
                  Text("score: $currentScore"),
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
                      print(handler.checkColorForButton(0));
                    },
                    child: Container(
                        width: 100,
                        height: 75,
                        color: ColorHandler.getButtonColor(currentColors[0])),
                  ),
                  TextButton(
                    onPressed: () {
                      // startCounter();
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
                      context.watch<ColorHandler>().currentColor,
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
                      // startCounter();
                    },
                    child: Container(
                      width: 100,
                      height: 75,
                      color: ColorHandler.getButtonColor(currentColors[2]),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // startCounter();
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
                  context.watch<TimerModel>().counterValue.toString(),
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
