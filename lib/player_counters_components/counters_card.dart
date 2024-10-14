import 'package:flutter/material.dart';
import '../items.dart';

class CountersCard extends StatelessWidget {
  final Item player;
  final int index;

  const CountersCard({
    super.key,
    required this.player,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: SizedBox(
                width: 90,
                height: 90,
                child: Center(
                  child: Text(
                    player.playerCounters[index].counter_amount.toString(),
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
            Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: Icon(
                player.playerCounters[index].counter_icon,
                size: 30,
                color: const Color(0xff504bff),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
