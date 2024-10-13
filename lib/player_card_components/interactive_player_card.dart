import 'package:flutter/material.dart';
import 'package:raccoon_counter/items.dart';
import 'player_card.dart';
import '../custom_button.dart';

class InteractivePlayerCard extends StatelessWidget {
  final Item player;
  final double aspectRatio;
  final VoidCallback topOnTap;
  final VoidCallback topOnLongTap;
  final VoidCallback bottomOnTap;
  final VoidCallback bottomOnLongTap;

  const InteractivePlayerCard({
    super.key,
    required this.player,
    required this.aspectRatio,
    required this.topOnTap,
    required this.topOnLongTap,
    required this.bottomOnTap,
    required this.bottomOnLongTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PlayerCard(
          player: player,
          aspectRatio: aspectRatio,
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              CustomButton(
                  onTap: topOnTap,
                  onLongTap: topOnLongTap,
              ),
              CustomButton(
                  onTap: bottomOnTap,
                  onLongTap: bottomOnLongTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}