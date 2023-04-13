import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Main Menu",
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
        ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Main Menu")),
        body: Center(
          child: Column(
            children: const [
              Padding(padding: EdgeInsets.all(50)),
              Text(
                "Brick Pong",
                style: TextStyle(fontSize: 50),
              ),
              Padding(padding: EdgeInsets.all(20)),
              MenuButton("Play", 60, 150, ),
              Padding(padding: EdgeInsets.all(5)),
              MenuButton("How to Play", 60, 150),
              Padding(padding: EdgeInsets.all(5)),
              MenuButton("Statistics", 60, 150),
            ],
          ),
        ),
      ),

    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton(
      this.title,
      this.height,
      this.width,
      //this.onPressed,
      {Key? key}
      ) : super(key: key);

  final String title;
  final double height;
  final double width;
  //final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: ElevatedButton(
            onPressed: () {},//onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(title),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}