import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CoverScreen extends StatelessWidget {
  final bool hasGameStarted;
  final bool isGameOver;

  const CoverScreen({Key? key, required this.hasGameStarted, required this.isGameOver}) : super(key: key);

  static var gameFont = GoogleFonts.orbitron(
      textStyle: TextStyle(
          color: Colors.blue[800], letterSpacing: 0, fontSize: 28));

  @override
  Widget build(BuildContext context) {
    return hasGameStarted
        ? Container(
      alignment: const Alignment(0, -0.5),
      child: Text(
        isGameOver ? '' : 'BRICK PONG',
        style: gameFont.copyWith(color: Colors.blue[600]),
      ),
    )
        : Stack(
      children: [
        Container(
          alignment: const Alignment(0, -0.7),
          child: Text(
            'BRICK PONG',
            style: gameFont,
          ),
        ),
        Container(
          alignment: const Alignment(0, 0.3),
          child: Text(
            'Tap to Play',
            style: gameFont.copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}