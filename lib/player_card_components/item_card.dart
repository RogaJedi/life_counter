import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int playerId;
  final String colorHex;
  final int counter;
  final double aspectRatio;

  const ItemCard({
    Key? key,
    required this.playerId,
    required this.colorHex,
    required this.counter,
    required this.aspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String hex = colorHex.replaceAll('0x', '');
    int colorInt = int.parse(hex, radix: 16);
    double textSize = aspectRatio * 200;
    return Card(
      color: Color(colorInt),
      child: Center(
        child: Transform.rotate(
          angle: 90 * 3.14159 / 180,
          child: Text(
            counter.toString(),
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}