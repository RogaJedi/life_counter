import 'package:flutter/material.dart';
import 'package:life_count_2/settings_page.dart';
import 'items.dart';
import 'player_inerface.dart';

Item player1 = Item(counter: 40, colorHex: "0xff504bff", id: 0);

Item player2 = Item(counter: 40, colorHex: "0xffffce00", id: 1);

Item player3 = Item(counter: 40, colorHex: "0xffff504b", id: 2);

Item player4 = Item(counter: 40, colorHex: "0xff00ce51", id: 3);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> items = [player1, player2, player3, player4];

  void minus(Item player){
    setState(() {
      player.counter -= 1;
    });
  }

  void bigMinus(Item player){
    setState(() {
      player.counter -= 5;
    });
  }

  void plus(Item player){
    setState(() {
      player.counter += 1;
    });
  }

  void bigPlus(Item player){
    setState(() {
      player.counter += 5;
    });
  }

  void changePlayerColor(Item newItem){
    String newColor = newItem.colorHex;
    int playerId = newItem.id;
    setState(() {
      items[playerId].colorHex = newColor;
    });
  }

  void _navigateToSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsPage(
          onColorSelected: this.changePlayerColor,
        ),
      ),
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
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: aspectRatio * 1,
              ),
              itemCount: items.length,
              itemBuilder: (context, index){
                final item = items[index];
                if (index % 2 != 0) {
                  return Transform.rotate(
                      angle: 180 * 3.14159 / 180,
                      child: PlayerInerface(
                        playerId: item.id + 1,
                        colorHex: item.colorHex,
                        counter: item.counter,
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

                      ),
                  );
                }
                return PlayerInerface(
                  playerId: item.id + 1,
                  colorHex: item.colorHex,
                  counter: item.counter,
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
                );
              },
            ),
          ),
        ),
          Center(
            child: GestureDetector(
              onTap: () {
                _navigateToSettingsPage();
              },
              child: CircleAvatar(
                radius: aspectRatio * 70,
                backgroundColor: Colors.white,
                child: const Icon(Icons.settings, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}