import 'package:android_projects/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameWonScreen extends StatelessWidget {
  final bool isGameWon;
  final Function() onResetGame;
  final Function()? onMainMenuReturn;

  const GameWonScreen(
      {Key? key,
      required this.isGameWon,
      required this.onResetGame,
      required this.onMainMenuReturn})
      : super(key: key);

  static var gameFont = GoogleFonts.orbitron(
      textStyle:
          TextStyle(color: Colors.blue[800], letterSpacing: 0, fontSize: 24));

  @override
  Widget build(BuildContext context) {
    return isGameWon
        ? Stack(
            children: [
              Container(
                alignment: const Alignment(0, -0.6),
                child: Text(
                  'YOU WON!',
                  style: gameFont.copyWith(
                      color: Colors.yellow[600], fontSize: 34),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0.2),
                child: GestureDetector(
                  onTap: onResetGame,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blue[300],
                      child: Text(
                        'Restart',
                        style: gameFont.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0.8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TitleScreen()),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blue[300],
                      child: Text(
                        'Main Menu',
                        style: gameFont.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        : Container();
  }
}
