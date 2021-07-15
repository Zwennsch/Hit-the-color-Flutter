import 'package:flutter/material.dart';
import 'package:hit_the_color/backend/color_handler.dart';
import 'package:hit_the_color/backend/game_logic.dart';
import 'package:hit_the_color/backend/timer_model.dart';
import 'package:hit_the_color/route_generator.dart';
import 'package:hit_the_color/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimerModel(5)),
        ChangeNotifierProvider(create: (context) => ColorHandler()),
        ChangeNotifierProvider(create: (context) => GameLogic())
      ],
      child: MaterialApp(
        title: 'Hit the color',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplasScreen(),
        initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
