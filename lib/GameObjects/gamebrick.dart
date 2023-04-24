import 'package:flutter/material.dart';

// I named this file wrong. These are the breakable bricks we are using
// 'NOT' the actual player brick at the bottom of the screen.
double brickX = 0;
double brickY = -0.9;
double brickWidth = 0.35;
double brickHeight = 0.07;
bool brickBroken = false;

class MyBrick extends StatelessWidget {
  const MyBrick({Key? key}) : super(key: key);

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
                color: Colors.blue[400],
              ),
            ),
          );
  }
}
