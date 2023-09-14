import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'Dicee',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(26, 52, 66, 1.0),
          centerTitle: true,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int LeftDiceNumber = 1, RightDiceNmber = 1;

  void changeDiceFace() {
    setState(() {
      LeftDiceNumber = Random().nextInt(6) + 1;
      RightDiceNmber = Random().nextInt(6) + 1;
      final player = AudioPlayer();
      player.play(AssetSource('dicesound.mp3'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Image.asset(
        'images/woodBackground.jpg',
        fit: BoxFit.cover,
      ),
      Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('images/dice$LeftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('images/dice$RightDiceNmber.png'),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
