import 'dart:async';

import 'package:flutter/material.dart';

class SplasScreen extends StatefulWidget {
  @override
  _SplasScreenState createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/splash.png"), fit: BoxFit.cover),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        ),
      ),
    );
  }

  void startTimer() async {
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushNamed("/start");
    });
  }
}
