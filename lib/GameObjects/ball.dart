import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class Ball extends StatelessWidget {
  final double ballX;
  final double ballY;
  final bool hasGameStarted;
  final bool isGameOver;

  const Ball(
      {Key? key,
      required this.ballX,
      required this.ballY,
      required this.isGameOver,
      required this.hasGameStarted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasGameStarted
        ? Container(
            alignment: Alignment(ballX, ballY),
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: isGameOver ? Colors.blue[900] : Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          )
        : Container(
            alignment: Alignment(ballX, ballY),
            child: AvatarGlow(
              endRadius: 45.0,
              child: Material(
                elevation: 8,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.blue[300],
                  radius: 7,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
