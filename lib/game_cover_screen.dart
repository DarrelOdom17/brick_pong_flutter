/* This screen is what covers the game scene when the player has either not
   started the game or needs to restart due to a game-over. Think of it as
   a small menu for navigating back to the title screen or restarting the
   game loop.
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameCoverScreen extends StatelessWidget {
  final bool hasGameStarted;
  final bool isGameOver;

  const GameCoverScreen({Key? key,
    required this.hasGameStarted,
    required this.isGameOver}) : super(key: key);

  static var gameFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(
        color: Colors.pinkAccent[300], letterSpacing: 0, fontSize: 30));

  @override
  Widget build(BuildContext context) {
  return hasGameStarted
      ? Container(
          alignment: const Alignment(0, 0),
          child: Text(
            isGameOver ? '' : 'BRICK PONG',
            style: gameFont.copyWith(color: Colors.black),
          ),
        )
      : Stack(
          children: [
            Container(
              alignment: const Alignment(0, 0),
              child: Text(
                'BRICK PONG',
                style: gameFont,
              ),
            ),
            Container(
              alignment: const Alignment(0, -0.1),
              child: Text(
                'Tap to Play',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              alignment: const Alignment(0, -0.1),
              child: Text(
                'Main Menu',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        );
  }
}