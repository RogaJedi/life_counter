import 'package:flutter/material.dart';
import '../items.dart';

class PlayerCard extends StatelessWidget {
  final Item player;
  final double aspectRatio;

  const PlayerCard({
    super.key,
    required this.player,
    required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {

    String hex = player.colorHex.replaceAll('0x', '');
    int colorInt = int.parse(hex, radix: 16);
    double textSize = aspectRatio * 200;

    return Card(
      color: Color(colorInt),
      child: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: 90 * 3.14159 / 180,
                child: Text(
                  "-",
                  style: TextStyle(
                    fontSize: textSize * 0.4,
                    color: Colors.white,
                  ),
                ),
              ),
              Transform.rotate(
                angle: 90 * 3.14159 / 180,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text(
                      player.counter.toString(),
                      style: TextStyle(
                        fontSize: textSize,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Transform.rotate(
                angle: 90 * 3.14159 / 180,
                child: Text(
                  "+",
                  style: TextStyle(
                    fontSize: textSize * 0.4,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}