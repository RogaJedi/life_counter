import 'package:flutter/material.dart';
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

class ThreePlayersB extends StatefulWidget {
  final double aspectRatio;
  final Function navigateToOptionsPage;
  final Function navigateToCountersDialog;

  const ThreePlayersB({super.key,
    required this.aspectRatio,
    required this.navigateToOptionsPage,
    required this.navigateToCountersDialog,
  });

  @override
  _ThreePlayersBState createState() => _ThreePlayersBState();
}

class _ThreePlayersBState extends State<ThreePlayersB> {
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Center(
              child: GridView.builder(
                padding: const EdgeInsets.all(2.0),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 1.0,
                  childAspectRatio: widget.aspectRatio * 1,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  int turn = 0;
                  if (index == 1) turn = 2;
                  return RotatedBox(
                    quarterTurns: turn,
                    child: PlayerInterface(
                      player: item,
                      onCountersTap: () => widget.navigateToCountersDialog(context, item, widget.aspectRatio, 2, turn.toInt()),
                      onColorSelected: changePlayerColor,
                    ),
                  );
                },
              ),
            ),
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
          )
        ],
      ),
    );
  }
}
