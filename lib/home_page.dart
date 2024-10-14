import 'package:flutter/material.dart';
import 'player_interface.dart';
import 'player_options_components/options_dialog.dart';
import 'player_counters_components/counters_dialog.dart';
import 'items.dart';

Item player1 = Item(
    counter: 40,
    colorHex: "0xff504bff",
    playerCounters: [],
    id: 0);

Item d_player1 = Item(
    counter: 40,
    colorHex: "0xff504bff",
    playerCounters: [],
    id: 0);

Item player2 = Item(
    counter: 40,
    colorHex: "0xffffce00",
    playerCounters: [],
    id: 1);

Item d_player2 = Item(
    counter: 40,
    colorHex: "0xffffce00",
    playerCounters: [],
    id: 1);

Item player3 = Item(
    counter: 40,
    colorHex: "0xffff504b",
    playerCounters: [],
    id: 2);

Item d_player3 = Item(
    counter: 40,
    colorHex: "0xffff504b",
    playerCounters: [],
    id: 2);

Item player4 = Item(
    counter: 40,
    colorHex: "0xff00ce51",
    playerCounters: [],
    id: 3);

Item d_player4 = Item(
    counter: 40,
    colorHex: "0xff00ce51",
    playerCounters: [],
    id: 3);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> items = [player1, player2, player3, player4];
  List<Item> defaultItems = [d_player1, d_player2, d_player3, d_player4];

  void changePlayerColor(Item newItem) {
    String newColor = newItem.colorHex;
    int playerId = newItem.id;
    setState(() {
      items[playerId].colorHex = newColor;
    });
  }

  void _navigateToOptionsDialog(BuildContext context, Item player) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OptionsDialog(
          player: player,
          playersList: items,
          defaultPlayersList: defaultItems,
          onColorSelected: changePlayerColor,
          onResetComplete: () {
            setState(() {});
          },
        ); // Your modified widget
      },
    );
  }

  void _navigateToCountersDialog(BuildContext context, Item player) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CountersDialog(player: player); // Your modified widget
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = (screenWidth / 2) / (screenHeight / 2);
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
                  childAspectRatio: aspectRatio * 1,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  if (index % 2 != 0) {
                    return Transform.rotate(
                      angle: 180 * 3.14159 / 180,
                      child: PlayerInterface(
                        player: item,
                        aspectRatio: aspectRatio,
                        onSettingsTap: () {
                          _navigateToOptionsDialog(context, item);
                        },
                        onCountersTap: () {
                          _navigateToCountersDialog(context, item);
                        },
                      ),
                    );
                  }
                  return PlayerInterface(
                    player: item,
                    aspectRatio: aspectRatio,
                    onSettingsTap: () {
                      _navigateToOptionsDialog(context, item);
                    },
                    onCountersTap: () {
                      _navigateToCountersDialog(context, item);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
