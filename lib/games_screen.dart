import 'package:flutter/material.dart';
import 'dart:async';
import 'package:android_projects/GameObjects/ball.dart';
import 'package:android_projects/GameObjects/player.dart';
import 'package:android_projects/GameObjects/gamebrick.dart';
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
  bool hasGameStarted = true;
  bool isGameOver = true;
  bool hasReturnedToMainMenu = false;

  // Ball variables that give value to it's respective class
  double ballX = 0;
  double ballY = 0;
  double ballXSpeed = 0.01;
  double ballYSpeed = 0.01;

  // Sets initial ball direction on game start
  var ballHorizontalDirection = BallDirection.RIGHT;
  var ballVerticalDirection = BallDirection.DOWN;

  // Brick class variables for 'required' variables
  // Sets breakable brick size for use in game
  double brickWidth = 0.35;
  double brickHeight = 0.07;

  // Player brick variables
  // player brick horizontal screen orientation
  double playerX = -0.275;
  // player brick size
  double playerWidth = 1.5;

  void startGame() {
    if (!hasGameStarted)
    {
      hasGameStarted = true;
      Timer.periodic(const Duration(milliseconds: 10), (timer)
      {
        moveBall();
        updateBallDirection();

        if (isPlayerDead())
        {
          timer.cancel();
          isGameOver = true;
        }
      });
    }
  }

  void moveBall() {
    setState(() {
      // Move the ball vertically, on the Y-axis
      if (ballVerticalDirection == BallDirection.UP)
      {
        ballY -= ballYSpeed;
      }
      else if (ballVerticalDirection == BallDirection.DOWN)
      {
        ballY += ballYSpeed;
      }

      // Move the ball horizontally, on the X-axis
      if (ballHorizontalDirection == BallDirection.RIGHT)
      {
        ballX += ballXSpeed;
      }
      else if (ballHorizontalDirection == BallDirection.LEFT)
      {
        ballX -= ballXSpeed;
      }
    });
  }

  void restartGame() {
    setState(() {
      ballX = 0;
      ballY = 0;
      playerX = -0.275;
      isGameOver = false;
      hasGameStarted = false;
    });
  }

  void returnToMainMenu() {
    setState(() {
      isGameOver = false;
      hasGameStarted = false;
      hasReturnedToMainMenu = true;
    });
  }

  void brokenBrickCheck() {
    setState(() {

    });
  }

  void updateBallDirection()
  {
    setState(() {
      // Checks for ball horizontal location on screen
      // If ball is reaches the bounds of the screen at '1' or '-1',
      // i.e. RIGHT or LEFT, the balls direction is reversed
      if (ballX >= 1)
        {
          ballHorizontalDirection = BallDirection.LEFT;
        }
      else if (ballX <= -1)
        {
          ballHorizontalDirection = BallDirection.RIGHT;
        }

      // Checks for ball vertical location on screen
      // If ball is reaches the bounds of the screen at '1' or '-1',
      // i.e. RIGHT or LEFT, the balls direction is reversed
      if (ballY >= 0.9 && ballX >= playerX && ballX <= playerX + playerWidth)
        {
          ballVerticalDirection = BallDirection.UP;
        }
      else if (ballY <= -1)
        {
          ballVerticalDirection = BallDirection.DOWN;
        }
    });
  }

  void playerMoveRight() {
    setState(() {});
  }

  void playerMoveLeft() {
    setState(() {});
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
                CoverScreen(
                    hasGameStarted: hasGameStarted, isGameOver: isGameOver),

                // Game over screen call
                GameOverScreen(
                  isGameOver: isGameOver,
                  onResetGame: restartGame,
                  onMainMenuReturn: returnToMainMenu,
                ),

                // Ball object class call
                Ball(
                  ballX: ballX,
                  ballY: ballY,
                  isGameOver: isGameOver,
                  hasGameStarted: hasGameStarted,
                ),

                // Player class call
                Player(playerX: playerX, playerWidth: playerWidth),

                // Calls the bricks class that can then be usd to create a level
              ],
            ),
          ),
        ),
      ),
    );
  }
}
