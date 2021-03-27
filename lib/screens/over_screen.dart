import 'package:flutter/material.dart';

class OverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/splash.png"), fit: BoxFit.cover),
      ),
      child: Center(
        child: Text("GAME OVER"),
      ),
    );
  }
}