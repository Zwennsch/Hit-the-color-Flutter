import 'package:flutter/material.dart';
import 'package:hit_the_color/screens/play_screen.dart';
import 'package:hit_the_color/screens/start_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/start":
        return MaterialPageRoute(builder: (_) => StartScreen());

      case "/play":
        return MaterialPageRoute(builder: (_) => PlayScreen());

      default:
        return _errRoute();
    }
  }

  static Route<dynamic> _errRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("No valid page"),
        ),
      );
    });
  }
}
