import 'package:flutter/material.dart';
import 'package:raccoon_counter/items.dart';
import '../player_card_components_vertical/player_card_vertical.dart';
import '../custom_button.dart';

class InteractivePlayerCardVertical extends StatefulWidget {
  final Item player;

  const InteractivePlayerCardVertical({
    super.key,
    required this.player,
  });

  @override
  _InteractivePlayerCardVerticalState createState() => _InteractivePlayerCardVerticalState();
}

class _InteractivePlayerCardVerticalState extends State<InteractivePlayerCardVertical> {

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
        PlayerCardVertical(
          player: widget.player,
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              CustomButton(
                borderRad: 8,
                onTap: () {
                  plus(widget.player);
                },
                onLongTap: () {
                  bigPlus(widget.player);
                },
              ),
              CustomButton(
                borderRad: 8,
                onTap: () {
                  minus(widget.player);
                },
                onLongTap: () {
                  bigMinus(widget.player);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}