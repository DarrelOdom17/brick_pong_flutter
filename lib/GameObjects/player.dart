import 'package:flutter/material.dart';

double playerX = -0.2;
double playerWidth = 0.5;

class Player extends StatelessWidget {
  final double playerX;
  final double playerWidth;

  const Player({Key? key, required this.playerX, required this.playerWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          Alignment((2 * playerX + playerWidth) / (2 - playerWidth), 0.9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 10,
          width: MediaQuery.of(context).size.width * playerWidth / 2,
          color: Colors.pink[400],
        ),
      ),
    );
  }
}
