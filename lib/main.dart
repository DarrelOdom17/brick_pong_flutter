
import 'package:flutter/material.dart';
import 'title_screen.dart';

void main() {
  runApp(
      MaterialApp(
        initialRoute: 'main_menu',
        routes: {
          'main_menu': (context) => const TitleScreen(),
        },
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TitleScreen(),
    );
  }
}