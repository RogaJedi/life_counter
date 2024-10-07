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
    return LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Card(
                color: Colors.white,
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: const Center(
                    child: Text(""),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.black),
                          padding: WidgetStateProperty.all(EdgeInsets.all(constraints.maxWidth * 0.07)),
                        ),
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
    );
  }
}