import 'package:android_projects/game_won_screen.dart';
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
  bool hasGameStarted = false;
  bool isGameOver = false;
  bool hasReturnedToMainMenu = false;
  bool isGameWon = false;

  // Ball variables that give value to it's respective class
  double ballX = 0;
  double ballY = 0;
  double ballXSpeed = 0.02;
  double ballYSpeed = 0.01;

  // Sets initial ball direction on game start
  var ballHorizontalDirection = BallDirection.RIGHT;
  var ballVerticalDirection = BallDirection.DOWN;

  // Brick class variables for 'required' variables
  // Sets breakable brick size, screen position and the space between bricks, for use in game
  static double brickWidth = 0.375;
  static double brickHeight = 0.07;
  static double startingBrickX = -1 + wallGap;
  static double startingBrickY = -0.9;
  static double brickGap = 0.02;
  static int numberOfBricksInRow = 5;
  static double wallGap = 0.5 *
      (2 -
          numberOfBricksInRow * brickWidth -
          (numberOfBricksInRow - 1) * brickGap);

  bool brickBroken = false;
  int brokenBrickCount = 0;
  int scorePerBrokenBrick = 0;

  List gameBricks = [
    for (int i = 0; i < 4; i++)
      for (int j = 0; j < 5; j++)
        [
          startingBrickX + j * (brickWidth + brickGap),
          startingBrickY + i * (brickHeight + brickGap),
          false,
        ]
  ];

  // Player brick variables
  // player brick horizontal screen orientation
  double playerX = -0.275;

  // player brick size
  double playerWidth = 0.5;

  void startGame() {
    if (!hasGameStarted) {
      hasGameStarted = true;
      isGameWon = false;
      Timer.periodic(const Duration(milliseconds: 10), (timer) {
        moveBall();
        updateBallDirection();

        if (isPlayerDead()) {
          timer.cancel();
          isGameOver = true;
        }

        if (allBricksBroken()) {
          timer.cancel();
          isGameWon = true;
          //isGameWon = true;
        }

        brokenBrickCheck();
      });
    }
  }

  void moveBall() {
    setState(() {
      // Move the ball vertically, on the Y-axis
      if (ballVerticalDirection == BallDirection.UP) {
        ballY -= ballYSpeed;
      } else if (ballVerticalDirection == BallDirection.DOWN) {
        ballY += ballYSpeed;
      }

      // Move the ball horizontally, on the X-axis
      if (ballHorizontalDirection == BallDirection.RIGHT) {
        ballX += ballXSpeed;
      } else if (ballHorizontalDirection == BallDirection.LEFT) {
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
      isGameWon = false;
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
      for (int i = 0; i < gameBricks.length; i++) {
        final brick = gameBricks[i];

        if (!brick[2] &&
            ballX >= brick[0] &&
            ballX <= brick[0] + brickWidth &&
            ballY <= brick[1] + brickHeight) {
          setState(() {
            brick[2] = true;
            brokenBrickCount++;
            scorePerBrokenBrick = brokenBrickCount * 5;

            final brickCenterX = brick[0] + brickWidth / 2;
            final brickCenterY = brick[1] + brickHeight / 2;

            final dx = ballX - brickCenterX;
            final dy = ballY - brickCenterY;

            if (dx.abs() > dy.abs()) {
              ballVerticalDirection =
                  dy > 0 ? BallDirection.DOWN : BallDirection.UP;
              ballHorizontalDirection =
                  ballHorizontalDirection == BallDirection.RIGHT
                      ? BallDirection.LEFT
                      : BallDirection.RIGHT;
            } else {
              ballHorizontalDirection =
                  dx > 0 ? BallDirection.RIGHT : BallDirection.LEFT;
              ballVerticalDirection =
                  ballVerticalDirection == BallDirection.DOWN
                      ? BallDirection.UP
                      : BallDirection.DOWN;
            }
          });
        }
      }
    });
  }

  void updateBallDirection() {
    setState(() {
      // Checks for ball horizontal location on screen
      // If ball is reaches the bounds of the screen at '1' or '-1',
      // i.e. RIGHT or LEFT, the balls direction is reversed
      if (ballX >= 1) {
        ballHorizontalDirection = BallDirection.LEFT;
      } else if (ballX <= -1) {
        ballHorizontalDirection = BallDirection.RIGHT;
      }

      // Checks for ball vertical location on screen
      // If ball is reaches the bounds of the screen at '1' or '-1',
      // i.e. RIGHT or LEFT, the balls direction is reversed
      if (ballY >= 0.9 && ballX >= playerX && ballX <= playerX + playerWidth) {
        ballVerticalDirection = BallDirection.UP;
      } else if (ballY <= -1) {
        ballVerticalDirection = BallDirection.DOWN;
      }
    });
  }

  void playerMoveRight() {
    setState(() {
      if (playerX + playerWidth <= 1) {
        playerX += 0.025;
      }
    });
  }

  void playerMoveLeft() {
    setState(() {
      if (playerX >= -1) {
        playerX -= 0.025;
      }
    });
  }

  bool isPlayerDead() {
    if (ballY >= 1) {
      return true;
    }

    return false;
  }

  bool allBricksBroken() {
    if (brokenBrickCount == gameBricks.length) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
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
                  hasGameStarted: hasGameStarted,
                  isGameOver: isGameOver,
                  isGameWon: isGameWon,
                ),

                // Game over screen call
                GameOverScreen(
                  isGameOver: isGameOver,
                  onResetGame: restartGame,
                  onMainMenuReturn: returnToMainMenu,
                ),

                GameWonScreen(
                    isGameWon: isGameWon,
                    onResetGame: restartGame,
                    onMainMenuReturn: returnToMainMenu),

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
                // First row of bricks
                MyBrick(
                    brickY: gameBricks[0][1],
                    brickX: gameBricks[0][0],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: gameBricks[0][2]),
                MyBrick(
                    brickY: gameBricks[1][1],
                    brickX: gameBricks[1][0],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: gameBricks[1][2]),
                MyBrick(
                    brickY: gameBricks[2][1],
                    brickX: gameBricks[2][0],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: gameBricks[2][2]),
                MyBrick(
                    brickY: gameBricks[3][1],
                    brickX: gameBricks[3][0],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: gameBricks[3][2]),
                MyBrick(
                    brickY: gameBricks[4][1],
                    brickX: gameBricks[4][0],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: gameBricks[4][2]),

                // Second row of Bricks
                MyBrick(
                    brickY: gameBricks[5][1],
                    brickX: gameBricks[5][0],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: gameBricks[5][2]),
                MyBrick(
                    brickY: gameBricks[6][1],
                    brickX: gameBricks[6][0],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: gameBricks[6][2]),
                MyBrick(
                    brickY: gameBricks[7][1],
                    brickX: gameBricks[7][0],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: gameBricks[7][2]),
                MyBrick(
                    brickY: gameBricks[8][1],
                    brickX: gameBricks[8][0],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: gameBricks[8][2]),
                MyBrick(
                    brickY: gameBricks[9][1],
                    brickX: gameBricks[9][0],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: gameBricks[9][2]),

                // Third row of bricks
                MyBrick(
                  brickY: gameBricks[10][1],
                  brickX: gameBricks[10][0],
                  brickWidth: brickWidth,
                  brickHeight: brickHeight,
                  brickBroken: gameBricks[10][2],
                ),
                MyBrick(
                  brickY: gameBricks[11][1],
                  brickX: gameBricks[11][0],
                  brickWidth: brickWidth,
                  brickHeight: brickHeight,
                  brickBroken: gameBricks[11][2],
                ),
                MyBrick(
                  brickY: gameBricks[12][1],
                  brickX: gameBricks[12][0],
                  brickWidth: brickWidth,
                  brickHeight: brickHeight,
                  brickBroken: gameBricks[12][2],
                ),
                MyBrick(
                  brickY: gameBricks[13][1],
                  brickX: gameBricks[13][0],
                  brickWidth: brickWidth,
                  brickHeight: brickHeight,
                  brickBroken: gameBricks[13][2],
                ),
                MyBrick(
                  brickY: gameBricks[14][1],
                  brickX: gameBricks[14][0],
                  brickWidth: brickWidth,
                  brickHeight: brickHeight,
                  brickBroken: gameBricks[14][2],
                ),
                // Fourth row of bricks
                MyBrick(
                  brickY: gameBricks[15][1],
                  brickX: gameBricks[15][0],
                  brickWidth: brickWidth,
                  brickHeight: brickHeight,
                  brickBroken: gameBricks[15][2],
                ),
                MyBrick(
                  brickY: gameBricks[16][1],
                  brickX: gameBricks[16][0],
                  brickWidth: brickWidth,
                  brickHeight: brickHeight,
                  brickBroken: gameBricks[16][2],
                ),
                MyBrick(
                  brickY: gameBricks[17][1],
                  brickX: gameBricks[17][0],
                  brickWidth: brickWidth,
                  brickHeight: brickHeight,
                  brickBroken: gameBricks[17][2],
                ),
                MyBrick(
                  brickY: gameBricks[18][1],
                  brickX: gameBricks[18][0],
                  brickWidth: brickWidth,
                  brickHeight: brickHeight,
                  brickBroken: gameBricks[18][2],
                ),
                MyBrick(
                  brickY: gameBricks[19][1],
                  brickX: gameBricks[19][0],
                  brickWidth: brickWidth,
                  brickHeight: brickHeight,
                  brickBroken: gameBricks[19][2],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
