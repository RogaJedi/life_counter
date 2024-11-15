import 'package:flutter/material.dart';
import '../player_interface.dart';
import '../items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Item player1 = Item(
    counter: 40,
    colorHex: "0xFF67E55C",
    playerCounters: [],
    counterButtonStates: {},
    id: 0);

Item d_player1 = Item(
    counter: 40,
    colorHex: "0xFF67E55C",
    playerCounters: [],
    counterButtonStates: {},
    id: 0);

Item player2 = Item(
    counter: 40,
    colorHex: "0xFFFFC34D",
    playerCounters: [],
    counterButtonStates: {},
    id: 1);

Item d_player2 = Item(
    counter: 40,
    colorHex: "0xFFFFC34D",
    playerCounters: [],
    counterButtonStates: {},
    id: 1);

class TwoPlayersB extends StatefulWidget {

  final double aspectRatio;
  final Function navigateToOptionsPage;
  final Function navigateToCountersDialog;

  const TwoPlayersB({super.key,
    required this.aspectRatio,
    required this.navigateToOptionsPage,
    required this.navigateToCountersDialog,

  });

  @override
  _TwoPlayersBState createState() => _TwoPlayersBState();
}

class _TwoPlayersBState extends State<TwoPlayersB> {
  List<Item> items = [player1, player2];
  List<Item> defaultItems = [d_player1, d_player2];

  void changePlayerColor(Item newItem, List<Item> items) {
    String newColor = newItem.colorHex;
    int playerId = newItem.id;
    setState(() {
      items[playerId].colorHex = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PlayerInterface(
                    player: items[0],
                    playersList: items,
                    onCountersTap: () => widget.navigateToCountersDialog(context, items[0], widget.aspectRatio, 2, 0),
                    onColorSelected: changePlayerColor
                ),
              ),
              Expanded(
                child: PlayerInterface(
                    player: items[1],
                    playersList: items,
                    onCountersTap: () => widget.navigateToCountersDialog(context, items[1], widget.aspectRatio, 2, 0),
                    onColorSelected: changePlayerColor
                ),
              ),
            ],
          ),
          Positioned(
            top: 362.25.h,
            right: 20.w,
            child: SizedBox(
              width: 56.h,
              height: 56.h,
              child: IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.black),
                ),
                onPressed: () => widget.navigateToOptionsPage(context, items, defaultItems, widget.aspectRatio),
                icon: Transform.rotate(
                  angle: 90 * 3.14159 / 180,
                  child: Icon(
                    Icons.settings_sharp,
                    size: 40.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
