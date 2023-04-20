import 'package:flutter/material.dart';
import 'package:android_projects/GameObjects/ball.dart';
import 'package:android_projects/GameObjects/player.dart';
import 'package:android_projects/GameObjects/player_brick.dart';
import 'package:android_projects/game_cover_screen.dart';
import 'package:android_projects/game_over_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

enum BallDirection { UP, DOWN, LEFT, RIGHT }

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Stack(
            children: [
              // tap to play
              //const CoverScreen(),

              // Gameover screen call
              GameOverScreen(),

              // Ball object class call
              // Ball(),

              // Player class call
              //Player(),

              // Calls the bricks class that can then be usd to create a level
            ],
          ),
        ),
      ),
    );
  }
}
