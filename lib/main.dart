import 'dart:math';

import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});

  Future<void> playSound(int number) async {
    final player = AudioPlayer();
    await player.setSource(AssetSource('assets/sounds/note$number.mp3'));
  }

  Expanded buildKey({required int num, required Color color}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          minimumSize: Size(88, 36),
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        onPressed: () {
          playSound(num);
        },
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(num: 1, color: Colors.blue),
              buildKey(num: 2, color: Colors.red),
              buildKey(num: 3, color: Colors.orange),
              buildKey(num: 4, color: Colors.yellow),
              buildKey(num: 5, color: Colors.green),
              buildKey(num: 6, color: Colors.purple),
              buildKey(num: 7, color: Colors.pink),
            ],
          ),
        ),
      ),
    );
  }
}
