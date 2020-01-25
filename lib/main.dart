import 'package:flutter/material.dart';
import 'package:visual_quiz/audio/play_audio.dart';
import 'package:visual_quiz/pages/InitPage.dart';

void main() {
  runApp(MyApp());
  playAudio();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "wit",
        primarySwatch: Colors.blueGrey,
        backgroundColor: Colors.orange,
      ),
      home: InitPage(),
    );
  }
}

