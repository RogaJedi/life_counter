import 'package:flutter/material.dart';

class PlayerSettingsCard extends StatelessWidget{
  final int playerId;
  final double aspectRatio;

  PlayerSettingsCard({
    required this.playerId,
    required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: Transform.rotate(
          angle: 90 * 3.14159 / 180,
          child: Text(
            "player $playerId",
            style: TextStyle(
              fontSize: aspectRatio * 100,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}