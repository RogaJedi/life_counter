import 'package:flutter/material.dart';

class PlayerSettingsCard extends StatelessWidget{
  final int playerId;
  final double aspectRatio;
  final VoidCallback onSettingsTap;

  PlayerSettingsCard({
    required this.playerId,
    required this.aspectRatio,
    required this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Card(
        color: Colors.white,
        child: Center(
          child: Text(""),
        ),
      ),
        Center(
          child: GestureDetector(
            onTap: onSettingsTap,
            child: CircleAvatar(
              radius: aspectRatio * 50,
              backgroundColor: Colors.black,
              child: const Icon(Icons.settings, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}