import 'package:flutter/material.dart';
import 'package:xo_gameplay/xo_play/home_screen.dart';
import 'package:xo_gameplay/xo_play/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routeName: (_) => const HomeScreen()},
      home: const StartScreen(),
    );
  }
}
