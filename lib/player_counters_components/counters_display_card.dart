import 'package:flutter/material.dart';
import '../items.dart';
import 'interactive_counters_card.dart';

class CountersDisplayCard extends StatelessWidget {
  final Item player;
  final double aspectRatio;

  const CountersDisplayCard({
    super.key,
    required this.player,
    required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          color: Colors.white,
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: ListView.builder(
              itemCount: player.playerCounters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: aspectRatio * 380,
                          height: aspectRatio * 250,
                          child: InteractiveCountersCard(
                            player: player,
                            index: index,
                            aspectRatio: aspectRatio,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
