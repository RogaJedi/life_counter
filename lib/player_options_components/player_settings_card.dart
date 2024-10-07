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
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.black),
                        padding: WidgetStateProperty.all(EdgeInsets.all(constraints.maxWidth * 0.05)),
                      ),
                      onPressed: onSettingsTap,
                      icon: Transform.rotate(
                        angle: 90 * 3.14159 / 180,
                        child: Icon(
                            Icons.settings_sharp,
                            size: constraints.maxWidth * 0.25,
                            color: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.black),
                        padding: WidgetStateProperty.all(EdgeInsets.all(constraints.maxWidth * 0.05)),
                      ),
                      onPressed: () {
                        print("add counters");
                      },
                      icon: Icon(
                          Icons.add,
                          size: constraints.maxWidth * 0.25,
                          color: Colors.white
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