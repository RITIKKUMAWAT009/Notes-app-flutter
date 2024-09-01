import 'dart:math';

import 'package:flutter/material.dart';

class RandomDataGenerator{


  Map<String,Color> noteColors={};
  final Random _random = Random();

  Color getCardColor(String title) {
    if (!noteColors.containsKey(title)) {
      // If the color is not already assigned, assign a new one
      noteColors[title] = generateRandomColor();
    }
    return noteColors[title]!;
  }

  // Function to generate a random color
  Color generateRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  Matrix4 randomTransform() {
    double randomAngle = (_random.nextDouble() * 20 - 10) * pi / 180; // Random angle between -10 and 10 degrees
    double randomXOffset = _random.nextDouble() * 20 - 10; // Random horizontal offset
    double randomYOffset = _random.nextDouble() * 20 - 10; // Random vertical offset

    return Matrix4.identity()
      ..translate(randomXOffset, randomYOffset)
      ..rotateZ(randomAngle);
  }
}