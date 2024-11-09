import 'package:flutter/material.dart';
import '../player_interface.dart';
import '../items.dart';

Item player1 = Item(
    counter: 40,
    colorHex: "0xFFFF6666",
    playerCounters: [],
    counterButtonStates: {},
    id: 0);

Item d_player1 = Item(
    counter: 40,
    colorHex: "0xFFFF6666",
    playerCounters: [],
    counterButtonStates: {},
    id: 0);

Item player2 = Item(
    counter: 40,
    colorHex: "0xFF67E55C",
    playerCounters: [],
    counterButtonStates: {},
    id: 1);

Item d_player2 = Item(
    counter: 40,
    colorHex: "0xFF67E55C",
    playerCounters: [],
    counterButtonStates: {},
    id: 1);

Item player3 = Item(
    counter: 40,
    colorHex: "0xFF5CC3E5",
    playerCounters: [],
    counterButtonStates: {},
    id: 2);

Item d_player3 = Item(
    counter: 40,
    colorHex: "0xFF5CC3E5",
    playerCounters: [],
    counterButtonStates: {},
    id: 2);

Item player4 = Item(
    counter: 40,
    colorHex: "0xFFFFC34D",
    playerCounters: [],
    counterButtonStates: {},
    id: 3);

Item d_player4 = Item(
    counter: 40,
    colorHex: "0xFFFFC34D",
    playerCounters: [],
    counterButtonStates: {},
    id: 3);

class FourPlayersA extends StatefulWidget {
  final double aspectRatio;
  final Function navigateToOptionsPage;
  final Function navigateToCountersDialog;

  const FourPlayersA({super.key,
    required this.aspectRatio,
    required this.navigateToOptionsPage,
    required this.navigateToCountersDialog,
  });

  @override
  _FourPlayersAState createState() => _FourPlayersAState();
}

class _FourPlayersAState extends State<FourPlayersA> {
  List<Item> items = [player1, player2, player3, player4];
  List<Item> defaultItems = [d_player1, d_player2, d_player3, d_player4];

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
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Center(
              child: GridView.builder(
                padding: const EdgeInsets.all(2.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 1.0,
                  childAspectRatio: widget.aspectRatio * 1,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  double turn = 0;
                  if (item.id % 2 != 0) turn = 180;

                  return Transform.rotate(
                    angle: turn * 3.14159 / 180,
                    child: PlayerInterface(
                      player: item,
                      playersList: items,
                      aspectRatio: widget.aspectRatio,
                      onCountersTap: () => widget.navigateToCountersDialog(context, item, widget.aspectRatio),
                      onColorSelected: changePlayerColor,
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
                padding: WidgetStateProperty.all(EdgeInsets.all(widget.aspectRatio * 30)),
              ),
              onPressed: () => widget.navigateToOptionsPage(context, items, defaultItems, widget.aspectRatio),
              icon: Transform.rotate(
                angle: 90 * 3.14159 / 180,
                child: Icon(
                    Icons.settings_sharp,
                    size: widget.aspectRatio * 60,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
