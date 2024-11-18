import 'package:flutter/material.dart';
import '../player_interface_vertical.dart';
import '../player_interface.dart';
import '../items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Item player1 = Item(
    counter: 40,
    colorHex: Color(0xFFC973E5),
    playerCounters: [],
    counterButtonStates: {},
    id: 0);

Item d_player1 = Item(
    counter: 40,
    colorHex: Color(0xFFC973E5),
    playerCounters: [],
    counterButtonStates: {},
    id: 0);

Item player2 = Item(
    counter: 40,
    colorHex: Color(0xFFFFC34D),
    playerCounters: [],
    counterButtonStates: {},
    id: 1);

Item d_player2 = Item(
    counter: 40,
    colorHex: Color(0xFFFFC34D),
    playerCounters: [],
    counterButtonStates: {},
    id: 1);

Item player3 = Item(
    counter: 40,
    colorHex: Color(0xFF5CC3E5),
    playerCounters: [],
    counterButtonStates: {},
    id: 2);

Item d_player3 = Item(
    counter: 40,
    colorHex: Color(0xFF5CC3E5),
    playerCounters: [],
    counterButtonStates: {},
    id: 2);

class ThreePlayersA extends StatefulWidget {

  final double aspectRatio;
  final Function navigateToOptionsPage;
  final Function navigateToCountersDialog;

  const ThreePlayersA({super.key,
    required this.aspectRatio,
    required this.navigateToOptionsPage,
    required this.navigateToCountersDialog,

  });

  @override
  _ThreePlayersAState createState() => _ThreePlayersAState();
}

class _ThreePlayersAState extends State<ThreePlayersA> {
  List<Item> items = [player1, player2, player3];
  List<Item> defaultItems = [d_player1, d_player2, d_player3];

  void changePlayerColor(int playerId, Color newColor) {
    setState(() {
      items[playerId].colorHex = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: PlayerInterface(
                          player: items[0],
                          onCountersTap: () => widget.navigateToCountersDialog(context, items[0], widget.aspectRatio, 2, 0),
                          onColorSelected: changePlayerColor,
                        ),
                      ),
                      Expanded(
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: PlayerInterface(
                            player: items[1],
                            onCountersTap: () => widget.navigateToCountersDialog(context, items[1], widget.aspectRatio, 2, 180),
                            onColorSelected: changePlayerColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: PlayerInterfaceVertical(
                      player: items[2],
                      onCountersTap: () => widget.navigateToCountersDialog(context, items[2], widget.aspectRatio, 1, 0),
                      onColorSelected: changePlayerColor,
                    ),
                  ),
                ),
              ],
            ),
            Center(
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
      ),
    );
  }
}
