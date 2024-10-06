import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'player_card_components/items.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
  final int playerId;
  final Function(Item) onColorSelected;
  SettingsPage({
    required this.playerId,
    required this.onColorSelected,
  });
}

class _SettingsPageState extends State<SettingsPage> {
  Color currentColor = Colors.blue;

  void changeColor(Color color) {
    setState(() => currentColor = color);
  }

  String colorToHex(Color color) {
    String hexRaw =  '#${color.value.toRadixString(16).padLeft(8, '0')}';
    String hexColor = hexRaw.replaceAll('#ff', '0xff');
    return hexColor;
  }

  AlertDialog pickColorForPlayer(BuildContext context, int playerId){
    return AlertDialog(
      title: const Text('Pick a color'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: currentColor,
          onColorChanged: changeColor,
          pickerAreaHeightPercent: 0.8,
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
            child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Select'),
          onPressed: () {
            Item newItem = Item(
              colorHex: colorToHex(currentColor),
              counter: 40,
              id: playerId,
            );
            widget.onColorSelected(newItem);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
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
                  return pickColorForPlayer(context, widget.playerId);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
