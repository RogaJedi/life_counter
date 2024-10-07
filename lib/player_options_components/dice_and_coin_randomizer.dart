import 'dart:math';
import 'package:flutter/material.dart';

class DiceAndCoinRandomizer {
  final int max;
  final double screenWidth;
  final double screenHeight;
  final double textSize;

  DiceAndCoinRandomizer({
    required this.max,
    required this.screenWidth,
    required this.screenHeight,
    required this.textSize,
  });

  String _getTextForNumber(int number) {
    switch (max) {
      case 2:
        return number == 1 ? 'You flipped Heads' : 'You flipped Tails';
      case 6:
        return 'You rolled a $number';
      case 20:
        return 'D20 result: $number';
      default:
        return 'Your random number is: $number';
    }
  }


  AlertDialog getDialog(BuildContext context) {
    final random = Random();
    final randomNumber = 1 + random.nextInt(max);
    final displayText = _getTextForNumber(randomNumber);

    return AlertDialog(
      title: Text('Random Result'),
      content: SizedBox(
        width: screenWidth * 0.6,
        height: screenHeight * 0.4,
        child: Center(
          child: Text(
            displayText,
            style: TextStyle(
              fontSize: textSize,
              color: const Color(0xff504bff),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Generate New',
            style: TextStyle(
              color: Color(0xff504bff),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) => getDialog(context),
            );
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Close',
            style: TextStyle(
              color: Color(0xff504bff),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
