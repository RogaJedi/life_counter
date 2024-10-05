import 'package:flutter/material.dart';
import 'item_card.dart';
import 'custom_button.dart';

class PlayerCard extends StatelessWidget {
  final String colorHex;
  final int counter;
  final double aspectRatio;
  final VoidCallback topOnTap;
  final VoidCallback topOnLongTap;
  final VoidCallback bottomOnTap;
  final VoidCallback bottomOnLongTap;

  PlayerCard({
    required this.colorHex,
    required this.counter,
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
        ItemCard(
          colorHex: colorHex,
          counter: counter,
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