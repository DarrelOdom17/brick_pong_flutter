import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameOverScreen extends StatelessWidget {
  final bool isGameOver;
  final Function() onResetGame;

  const GameOverScreen(
      {Key? key, required this.isGameOver, required this.onResetGame})
      : super(key: key);

  static var gameFont = GoogleFonts.orbitron(
      textStyle:
          TextStyle(color: Colors.blue[800], letterSpacing: 0, fontSize: 24));

  @override
  Widget build(BuildContext context) {
    return isGameOver
        ? Stack(
            children: [
              Container(
                alignment: const Alignment(0, -0.2),
                child: Text(
                  'GAME OVER',
                  style: gameFont,
                ),
              ),
              Container(
                alignment: const Alignment(0, 0.2),
                child: GestureDetector(
                  onTap: onResetGame,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.blueAccent,
                      child: Text(
                        'Restart',
                        style: gameFont.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container();
  }
}
