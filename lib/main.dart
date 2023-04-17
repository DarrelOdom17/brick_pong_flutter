
import 'package:android_projects/game_cover_screen.dart';
import 'package:android_projects/games_screen.dart';
import 'package:flutter/material.dart';
import 'title_screen.dart';

void main() {
  runApp(
      MaterialApp(
        initialRoute: '/main_menu',
        routes: {
          '/main_menu': (context) => const TitleScreen(),
          '/main_menu/statistics': (context) => const StatisticsScreen(),
          // make sure to change this const ^ when you want to check how your new class
          // looks in the live preview in the emulator or web
        },
      )
  );
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