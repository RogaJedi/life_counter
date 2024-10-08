import 'package:flutter/material.dart';
import '../player_card_components/items.dart';
import 'option_button.dart';
import 'pick_color_for_player.dart';
import 'dice_and_coin_dialog.dart';
import 'reset_game_dialog.dart';
import '../app_settings_components/settings_page.dart';

class OptionsDialog extends StatefulWidget {
  @override
  _OptionsDialogState createState() => _OptionsDialogState();
  final int playerId;
  final String playerColor;
  final Function(Item) onColorSelected;

  const OptionsDialog({
    super.key,
    required this.playerId,
    required this.playerColor,
    required this.onColorSelected,
  });
}

class _OptionsDialogState extends State<OptionsDialog> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    String hex = widget.playerColor.replaceAll('0x', '');
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
          double aspectRatio = screenWidth / screenHeight;
          double textSize = aspectRatio * 55; // Adjusted for better scaling

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
                      text: "Change Color",
                      textSize: textSize,
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
                                    id: widget.playerId,
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
                        text: "Dice & Coin",
                        textSize: textSize,
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
                      text: "Reset Game",
                      textSize: textSize,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ResetGameDialog();
                            }
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    //Settings
                    OptionsButton(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      text: "Settings",
                      textSize: textSize,
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
