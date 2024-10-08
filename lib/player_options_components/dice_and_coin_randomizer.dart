import 'dart:math';
import 'package:flutter/material.dart';

class DiceAndCoinRandomizer {
  final int max;
  final String title;
  final double screenWidth;
  final double screenHeight;
  final double textSize;

  DiceAndCoinRandomizer({
    required this.max,
    required this.title,
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

  Widget getDialog(BuildContext context) {
    return _RandomizerDialog(
      max: max,
      title: title,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      textSize: textSize,
      getTextForNumber: _getTextForNumber,
    );
  }
}

class _RandomizerDialog extends StatefulWidget {
  final int max;
  final String title;
  final double screenWidth;
  final double screenHeight;
  final double textSize;
  final String Function(int) getTextForNumber;

  const _RandomizerDialog({
    Key? key,
    required this.max,
    required this.title,
    required this.screenWidth,
    required this.screenHeight,
    required this.textSize,
    required this.getTextForNumber,
  }) : super(key: key);

  @override
  _RandomizerDialogState createState() => _RandomizerDialogState();
}

class _RandomizerDialogState extends State<_RandomizerDialog> {
  late String displayText;

  @override
  void initState() {
    super.initState();
    _generateNewResult();
  }

  void _generateNewResult() {
    final random = Random();
    final randomNumber = 1 + random.nextInt(widget.max);
    setState(() {
      displayText = widget.getTextForNumber(randomNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: widget.screenWidth * 0.6,
        height: widget.screenHeight * 0.4,
        child: Center(
          child: Text(
            displayText,
            style: TextStyle(
              fontSize: widget.textSize,
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
          onPressed: _generateNewResult,
          child: const Text(
            'Generate New',
            style: TextStyle(
              color: Color(0xff504bff),
            ),
          ),
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