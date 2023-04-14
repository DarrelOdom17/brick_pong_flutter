import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

  class _GameScreenState extends State<GameScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.blueAccent[100],
        body: Center(
          child: Stack(
            children: [
              // ball
              Container(
                alignment: Alignment(0, 0),
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.pink[400],
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}