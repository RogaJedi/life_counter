import 'package:flutter/material.dart';
import 'player_options_components/options_dialog.dart';
import 'player_counters_components/counters_dialog.dart';
import 'items.dart';
import 'player_inerface.dart';
import 'counters_icons_icons.dart';
import 'player_counters_components/c_items.dart';

Item player1 = Item(
    counter: 40,
    colorHex: "0xff504bff",
    player_counters: [
      C_Item(
          counter_icon: CountersIcons.circle,
          counter_amount: 0),
      C_Item(
          counter_icon: CountersIcons.vial,
          counter_amount: 0
      ),
      C_Item(
          counter_icon: CountersIcons.sun,
          counter_amount: 0
      ),
    ],
    id: 0);

Item player2 = Item(
    counter: 40,
    colorHex: "0xffffce00",
    player_counters: [
      C_Item(
          counter_icon: CountersIcons.clock,
          counter_amount: 0),
      C_Item(
          counter_icon: CountersIcons.skull,
          counter_amount: 0
      ),
      C_Item(
          counter_icon: CountersIcons.tree,
          counter_amount: 0
      ),
    ],
    id: 1);

Item player3 = Item(counter: 40, colorHex: "0xffff504b", player_counters: [], id: 2);

Item player4 = Item(counter: 40, colorHex: "0xff00ce51", player_counters: [], id: 3);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> items = [player1, player2, player3, player4];

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

  void changePlayerColor(Item newItem) {
    String newColor = newItem.colorHex;
    int playerId = newItem.id;
    setState(() {
      items[playerId].colorHex = newColor;
    });
  }

  void _navigateToOptionsDialog(BuildContext context, int playerId, String playerColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OptionsDialog(
          playerId: playerId,
          playerColor: playerColor,
          onColorSelected: changePlayerColor,
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
                      child: PlayerInerface(
                        player: item,
                        aspectRatio: aspectRatio,
                        topOnTap: () {
                          minus(item);
                        },
                        topOnLongTap: () {
                          bigMinus(item);
                        },
                        bottomOnTap: () {
                          plus(item);
                        },
                        bottomOnLongTap: () {
                          bigPlus(item);
                        },
                        onSettingsTap: () {
                          _navigateToOptionsDialog(context, item.id, item.colorHex);
                        },
                        onCountersTap: () {
                          _navigateToCountersDialog(context, item);
                        },
                      ),
                    );
                  }
                  return PlayerInerface(
                    player: item,
                    aspectRatio: aspectRatio,
                    topOnTap: () {
                      minus(item);
                    },
                    topOnLongTap: () {
                      bigMinus(item);
                    },
                    bottomOnTap: () {
                      plus(item);
                    },
                    bottomOnLongTap: () {
                      bigPlus(item);
                    },
                    onSettingsTap: () {
                      _navigateToOptionsDialog(context, item.id, item.colorHex);
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
