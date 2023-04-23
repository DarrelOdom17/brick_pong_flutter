import 'package:flutter/material.dart';
import 'dart:async';
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
  // Checks for game state and sets it to false on app startup
  // Will be updated in their respective classes when called.
  bool hasGameStarted = false;
  bool isGameOver = false;

  // Ball variables that give value to it's respective class
  // Will also set initial ball speed and direction on game start
  double ballX = 0;
  double ballY = 0;
  double ballXSpeed = 0.02;
  double ballYSpeed = 0.01;

  // Brick class variables for 'required' variables
  // Sets breakable brick size for use in game
  double brickWidth = 0.35;
  double brickHeight = 0.07;

  void startGame() {
    if (!hasGameStarted) {
      hasGameStarted = true;
      Timer.periodic(const Duration(milliseconds: 10), (timer) {
        moveBall();
        updateBallDirection();

        if (isPlayerDead()) {
          timer.cancel();
          isGameOver = true;
        }
      });
    }
  }

  void moveBall() {
    setState(() {

    });
  }

  void restartGame() {
    setState(() {
      isGameOver = false;
      hasGameStarted = false;
    });
  }

  void brokenBrickCheck() {
    setState(() {

    });
  }

  void updateBallDirection() {
    setState(() {

    });
  }

  void playerMoveRight() {
    setState(() {

    });
  }

  void playerMoveLeft() {
    setState(() {

    });
  }

  bool isPlayerDead() {
    if (ballY >= 1) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          playerMoveRight();
        }
        if (details.delta.dx < 0) {
          playerMoveLeft();
        }
      },
      onTap: startGame,
      child: Scaffold(
        backgroundColor: Colors.blue[300],
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Stack(
              children: [
                // tap to play
                CoverScreen(hasGameStarted: hasGameStarted, isGameOver: isGameOver),

                // Game-over screen call
                GameOverScreen(isGameOver: isGameOver, onResetGame: restartGame),

                // Ball object class call
                // Ball(),

                // Player class call
                //Player(),

                // Calls the bricks class that can then be usd to create a level
              ],
            ),
          ),
        ),
      ),
    );
  }
}
