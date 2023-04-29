import 'package:android_projects/GameObjects/gamebrick.dart';
import 'package:android_projects/game_cover_screen.dart';
import 'package:android_projects/game_over_screen.dart';
import 'package:android_projects/games_screen.dart';
import 'package:android_projects/GameObjects/player.dart';
import 'package:flutter/material.dart';
import 'package:android_projects/GameObjects/ball.dart';
import 'title_screen.dart';

ValueNotifier<int> scoreValue = ValueNotifier<int>(0);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void updateScore(BuildContext context, int score) {
    scoreValue.value += score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/main_menu',
      routes: {
        '/main_menu': (context) => const TitleScreen(),
        '/main_menu/statistics': (context) =>
            StatisticsScreen(updateScore: (score) {
              scoreValue.value = score;
            }),
        '/main_menu/how_to_play': (context) => const HowToPlayScreen(),
        '/main_menu/play': (context) => GameScreen(updateScore: (score) {
              updateScore(context, score);
            }),
      },
    );
  }
}
