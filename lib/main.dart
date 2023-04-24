
import 'package:android_projects/GameObjects/player_brick.dart';
import 'package:android_projects/game_cover_screen.dart';
import 'package:android_projects/game_over_screen.dart';
import 'package:android_projects/games_screen.dart';
import 'package:android_projects/GameObjects/player.dart';
import 'package:flutter/material.dart';
import 'package:android_projects/GameObjects/ball.dart';
import 'title_screen.dart';

void main() {
  runApp(MaterialApp
    (
    theme: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/main_menu',
    routes: {
      '/main_menu': (context) => const TitleScreen(),
      '/main_menu/statistics': (context) => const StatisticsScreen(),
      '/main_menu/how_to_play': (context) => const HowToPlayScreen(),
      //'/main_menu/play': (context) => const MyBrick(),
      //'/main_menu/play': (context) => const Player(),
      '/main_menu/play': (context) => const GameScreen(),
      //'/main_menu/play' : (context) => GameOverScreen(),
      //'/main_menu/play' : (context) => CoverScreen(hasGameStarted: hasGameStarted, isGameOver: isGameOver),
      //'/main_menu/play' : (context) => Ball(ballX: 0, ballY: 0, isGameOver: false, hasGameStarted: true)
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TitleScreen(),
    );
  }
}
