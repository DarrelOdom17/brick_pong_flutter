import 'package:flutter/material.dart';
import 'package:android_projects/games_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:android_projects/GameObjects/gamebrick.dart';
import 'package:android_projects/main.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Main Menu"), automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(50)),
            const Text(
              "Brick Pong",
              style: TextStyle(fontSize: 50),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            MenuButton("Play", 60, 150, () {
              Navigator.pushNamed(context, "/main_menu/play");
            }),
            const Padding(padding: EdgeInsets.all(5)),
            MenuButton("How to Play", 60, 150, () {
              Navigator.pushNamed(context, '/main_menu/how_to_play');
            }),
            const Padding(padding: EdgeInsets.all(5)),
            MenuButton("Statistics", 60, 150, () {
              Navigator.pushNamed(context, "/main_menu/statistics");
            }),
          ],
        ),
      ),
    );
  }
}

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("How to Play")),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.network(
            "https://cdn.discordapp.com/attachments/671118620356640780/1102825749808951366/ponghowto.png"),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton(this.title, this.height, this.width, this.onPressed,
      {Key? key})
      : super(key: key);

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

class StatisticsScreen extends StatefulWidget {
  final int Function() getScore;

  const StatisticsScreen({Key? key, required this.getScore})
      : super(key: key);

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistics Screen"),
        automaticallyImplyLeading: false,
      ),
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
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.getScore().toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
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
        backgroundColor: Colors.blue[300],
        label: const Text("Back"),
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}

