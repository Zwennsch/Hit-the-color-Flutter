import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:hit_the_color/backend/color_handler.dart';
// import 'package:hit_the_color/backend/game_logic.dart';
// import 'package:hit_the_color/backend/timer_model.dart';
// import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/splash.png"), fit: BoxFit.cover),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/play", arguments: "noArguments");
          },
          child: Text(
            "START",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
