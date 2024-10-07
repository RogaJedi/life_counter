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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.black), padding: WidgetStateProperty.all(EdgeInsets.all(aspectRatio * 30,))),
                  onPressed: onSettingsTap,
                  icon: Icon(Icons.settings, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.black), padding: WidgetStateProperty.all(EdgeInsets.all(aspectRatio * 30,))),
                  onPressed: onSettingsTap,
                  icon: Icon(Icons.settings, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}