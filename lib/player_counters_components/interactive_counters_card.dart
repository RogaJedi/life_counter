import 'package:flutter/material.dart';
import 'package:raccoon_counter/items.dart';
import 'counters_card.dart';
import '../custom_button.dart';

class InteractiveCountersCard extends StatefulWidget {
  final Item player;
  final int index;
  final double aspectRatio;

  const InteractiveCountersCard({
    super.key,
    required this.player,
    required this.index,
    required this.aspectRatio,
  });

  @override
  _InteractiveCountersCardState createState() =>
      _InteractiveCountersCardState();
}

class _InteractiveCountersCardState extends State<InteractiveCountersCard> {

  void c_plus(Item player, int index) {
    setState(() {
      player.playerCounters[index].counter_amount += 1;
    });
  }

  void c_bigPlus(Item player, int index) {
    setState(() {
      player.playerCounters[index].counter_amount += 5;
    });
  }

  void c_minus(Item player, int index) {
    setState(() {
      player.playerCounters[index].counter_amount -= 1;
    });
  }

  void c_bigMinus(Item player, int index) {
    setState(() {
      player.playerCounters[index].counter_amount -= 5;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CountersCard(
          player: widget.player,
          index: widget.index,
          aspectRatio: widget.aspectRatio,
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              CustomButton(
                onTap: () {
                  c_minus(widget.player, widget.index);
                },
                onLongTap: () {
                  c_bigMinus(widget.player, widget.index);
                },
              ),
              CustomButton(
                onTap: () {
                  c_plus(widget.player, widget.index);
                },
                onLongTap: () {
                  c_bigPlus(widget.player, widget.index);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}