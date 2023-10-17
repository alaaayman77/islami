import 'package:flutter/material.dart';

class SebhaRotation extends StatelessWidget {
  String imagePath;

  double turns;

  SebhaRotation({required this.imagePath, required this.turns});

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
        turns: turns,
        duration: const Duration(seconds: 1),
        child: Center(
            child: Image.asset(
          imagePath,
        )));
  }
}
