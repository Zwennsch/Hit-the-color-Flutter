import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/splash.png"), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "GAME OVER",
            style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () => print('Button pressed'),
                child: Text('Restart')),
            ElevatedButton(onPressed: () => exit(0), child: Text('Quit'))
          ]),
        ],
      ),
    );
  }
}
