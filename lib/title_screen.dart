import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

int Highscore = 5;

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
            children:  [
              const Padding(padding: EdgeInsets.all(50)),
              const Text(
                "Brick Pong",
                style: TextStyle(fontSize: 50),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              MenuButton("Play", 60, 150, () {}),
              const Padding(padding: EdgeInsets.all(5)),
              MenuButton("How to Play", 60, 150, () {}),
              const Padding(padding: EdgeInsets.all(5)),
              MenuButton("Statistics", 60, 150, () {Navigator.pushNamed(context, "/main_menu/statistics");}),
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
      this.onPressed,
      {Key? key}
      ) : super(key: key);

  final String title;
  final double height;
  final double width;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: ElevatedButton(
            onPressed: onPressed,
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

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Statistics",
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Statistics Screen")),
        body: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(50)),
              const Text(
                "Statistics",
                style: TextStyle(fontSize: 50),
              ),
              const Text(
                "High Score",
                style: TextStyle(fontSize: 20),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              SizedBox(
                height: 40,
                width: 100,

                child: ElevatedButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(Highscore.toString()),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },

          backgroundColor: Colors.grey,
          label: const Text("Back"),
          icon: const Icon(Icons.arrow_back),

        ),
      ),
    );
  }
}

