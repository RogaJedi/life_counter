import 'package:flutter/material.dart';
import '../items.dart';
import 'option_button.dart';
import 'pick_color_for_player.dart';
import 'dice_and_coin_dialog.dart';
import 'reset_game_dialog.dart';
import '../app_settings_components/settings_page.dart';

class OptionsDialog extends StatefulWidget {
  @override
  _OptionsDialogState createState() => _OptionsDialogState();
  final Item player;
  final List<Item> playersList;
  final List<Item> defaultPlayersList;
  final Function(Item) onColorSelected;
  final Function() onResetComplete;

  const OptionsDialog({
    super.key,
    required this.player,
    required this.playersList,
    required this.defaultPlayersList,
    required this.onColorSelected,
    required this.onResetComplete,
  });
}

class _OptionsDialogState extends State<OptionsDialog> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    String hex = widget.player.colorHex.replaceAll('0x', '');
    int colorInt = int.parse(hex, radix: 16);
    currentColor = Color(colorInt);
  }

  void changeColor(HSVColor color) {
    setState(() => currentColor = color.toColor());
  }

  String colorToHex(Color color) {
    String hexRaw = '#${color.value.toRadixString(16).padLeft(8, '0')}';
    String hexColor = hexRaw.replaceAll('#ff', '0xff');
    return hexColor;
  }

  void resetPlayer (Item player, Item playerDefaultState) {
    setState(() {
      player.colorHex = playerDefaultState.colorHex;
      player.counter = playerDefaultState.counter;
      player.playerCounters.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;// Adjusted for better scaling

          return AlertDialog(
            title: const Text('Options'),
            content: SizedBox(
              width: screenWidth * 0.6,
              height: screenHeight * 0.4,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Change color
                    OptionsButton(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      textSizeScale: 55,
                      text: "Change Color",
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (context, setState) => PickColorForPlayer(
                                currentColor: currentColor,
                                onChanged: (newColor) =>
                                    setState(() => changeColor(newColor)),
                                onPressed: () {
                                  Item newItem = Item(
                                    colorHex: colorToHex(currentColor),
                                    counter: 40,
                                    playerCounters: [],
                                    id: widget.player.id,
                                  );
                                  widget.onColorSelected(newItem);
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    //Dice & coin
                    OptionsButton(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        textSizeScale: 55,
                        text: "Dice & Coin",
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return DiceAndCoinDialog();
                              }
                          );
                        },
                    ),
                    const SizedBox(height: 8),
                    //Reset game
                    OptionsButton(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      textSizeScale: 55,
                      text: "Reset Game",
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ResetGameDialog(
                                playersList: widget.playersList,
                                defaultPlayersList: widget.defaultPlayersList,
                                onResetComplete: widget.onResetComplete,
                              );
                            }
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    //Settings
                    OptionsButton(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      textSizeScale: 55,
                      text: "Settings",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Close",
                  style: TextStyle(
                    color: Color(0xff504bff),
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

}
