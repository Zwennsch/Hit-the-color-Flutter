import 'dart:ui';

import 'package:flutter/material.dart';

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
            Navigator.of(context)
                .pushNamed("/play", arguments: "noArguments");
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
