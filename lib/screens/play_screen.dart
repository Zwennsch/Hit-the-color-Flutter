import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int score = 0;
  int level = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Hit The Color"),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("level: $level"),
            Text("score: $score"),
          ],
        ),
      ),
      body: Container(
        child: Column(
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
                    height: 50,
                    color: Colors.blue,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print("pressed");
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.red,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
