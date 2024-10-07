import 'package:flutter/material.dart';
import 'player_card_components/items.dart';
import 'pick_color_for_player.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
  final int playerId;
  final String playerColor;
  final Function(Item) onColorSelected;

  const SettingsPage({
    super.key,
    required this.playerId,
    required this.playerColor,
    required this.onColorSelected,
  });
}

class _SettingsPageState extends State<SettingsPage> {
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = (screenWidth / 2) / (screenHeight / 2);
    double textSize = aspectRatio * 70;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 0.1,
          child: ElevatedButton(
            child: Text(
              'Change color',
              style: TextStyle(
                fontSize: textSize,
                color: const Color(0xff504bff),
              ),
            ),
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
        ),
      ),
    );
  }
}
