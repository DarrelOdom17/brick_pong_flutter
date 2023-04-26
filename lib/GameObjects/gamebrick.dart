import 'package:flutter/material.dart';

class MyBrick extends StatelessWidget {
  final double brickX;
  final double brickY;
  final double brickWidth;
  final double brickHeight;
  final bool brickBroken;

  const MyBrick({
    Key? key,
    required this.brickY,
    required this.brickX,
    required this.brickWidth,
    required this.brickHeight,
    required this.brickBroken,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return brickBroken
        ? Container()
        : Container(
            alignment:
                Alignment((2 * brickX + brickWidth) / (2 - brickWidth), brickY),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: MediaQuery.of(context).size.height * brickHeight / 2,
                width: MediaQuery.of(context).size.width * brickWidth / 2,
                color: Colors.pink[400],
              ),
            ),
          );
  }
}
