import 'package:flutter/material.dart';
import '../player_card_components/items.dart';
import 'pick_color_for_player.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = (screenWidth / 2) / (screenHeight / 2);
    double textSize = aspectRatio * 70;

    return AlertDialog(
      title: const Text('Options'),
      content: SizedBox(
        width: screenWidth,
        height: screenHeight * 0.4,
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 0.2,
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
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Close"),
        ),
      ],
    );
  }
}
