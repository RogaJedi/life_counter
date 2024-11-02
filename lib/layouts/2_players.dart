import 'package:flutter/material.dart';
import '../player_interface.dart';
import '../player_components/counters/counters_dialog.dart';
import '../items.dart';

Item player1 = Item(
    counter: 40,
    colorHex: "0xff504bff",
    playerCounters: [],
    counterButtonStates: {},
    id: 0);

Item d_player1 = Item(
    counter: 40,
    colorHex: "0xff504bff",
    playerCounters: [],
    counterButtonStates: {},
    id: 0);

Item player2 = Item(
    counter: 40,
    colorHex: "0xffff504b",
    playerCounters: [],
    counterButtonStates: {},
    id: 1);

Item d_player2 = Item(
    counter: 40,
    colorHex: "0xffff504b",
    playerCounters: [],
    counterButtonStates: {},
    id: 1);

class TwoPlayers extends StatefulWidget {

  final double aspectRatio;
  final Function navigateToOptionsDialog;

  final Function(Item, List<Item>) onColorSelected;


  const TwoPlayers({super.key,
    required this.aspectRatio,
    required this.navigateToOptionsDialog,
    required this.onColorSelected,

  });

  @override
  _TwoPlayersState createState() => _TwoPlayersState();
}

class _TwoPlayersState extends State<TwoPlayers> {
  List<Item> items = [player1, player2];
  List<Item> defaultItems = [d_player1, d_player2];

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
                  crossAxisCount: 1,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 160.0,
                  childAspectRatio: widget.aspectRatio * 2,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  double turn = 90;
                  if (index == 1) turn = 270;

                  Transform.rotate(
                    angle: turn * 3.14159 / 180,
                    child: PlayerInterface(
                      player: item,
                      playersList: items,
                      aspectRatio: widget.aspectRatio,
                      onCountersTap: () {},
                      onColorSelected: widget.onColorSelected,
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
              onPressed: () => widget.navigateToOptionsDialog(context, items, defaultItems),
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
