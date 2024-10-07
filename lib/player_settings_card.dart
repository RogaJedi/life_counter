import 'package:flutter/material.dart';

class PlayerSettingsCard extends StatelessWidget{
  final int playerId;
  final double aspectRatio;
  final VoidCallback onSettingsTap;

  const PlayerSettingsCard({super.key, 
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
          //for some reason if don't put anything in the card, it doesn't work :P
          child: Text(""),
        ),
      ),
        Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: onSettingsTap,
                child: CircleAvatar(
                  radius: aspectRatio * 50,
                  backgroundColor: Colors.black,
                  child: const Icon(Icons.settings, color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: onSettingsTap,
                child: CircleAvatar(
                  radius: aspectRatio * 50,
                  backgroundColor: Colors.black,
                  child: const Icon(Icons.settings, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}