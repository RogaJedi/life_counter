import 'package:flutter/material.dart';
import 'package:raccoon_counter/items.dart';
import 'player_card.dart';
import '../custom_button.dart';

class InteractivePlayerCard extends StatefulWidget {
  final Item player;
  final double aspectRatio;

  const InteractivePlayerCard({
    super.key,
    required this.player,
    required this.aspectRatio,
  });

  @override
  _InteractivePlayerCardState createState() => _InteractivePlayerCardState();
}

class _InteractivePlayerCardState extends State<InteractivePlayerCard> {

  void minus(Item player) {
    setState(() {
      player.counter -= 1;
    });
  }

  void bigMinus(Item player) {
    setState(() {
      player.counter -= 5;
    });
  }

  void plus(Item player) {
    setState(() {
      player.counter += 1;
    });
  }

  void bigPlus(Item player) {
    setState(() {
      player.counter += 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PlayerCard(
          player: widget.player,
          aspectRatio: widget.aspectRatio,
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              CustomButton(
                borderRad: 8,
                onTap: () {
                  minus(widget.player);
                },
                onLongTap: () {
                  bigMinus(widget.player);
                },
              ),
              CustomButton(
                borderRad: 8,
                onTap: () {
                  plus(widget.player);
                },
                onLongTap: () {
                  bigPlus(widget.player);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}