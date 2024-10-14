import 'package:flutter/material.dart';
import 'option_button.dart';
import '../items.dart';

class ResetGameDialog extends StatefulWidget {
  final List<Item> playersList;
  final List<Item> defaultPlayersList;
  final Function() onResetComplete;

  const ResetGameDialog({
    super.key,
    required this.playersList,
    required this.defaultPlayersList,
    required this.onResetComplete,
  });

  @override
  _ResetGameDialogState createState() => _ResetGameDialogState();
}

class _ResetGameDialogState extends State<ResetGameDialog> {

  void resetPlayer (int index) {
    setState(() {
      widget.playersList[index].colorHex = widget.defaultPlayersList[index].colorHex;
      widget.playersList[index].counter = widget.defaultPlayersList[index].counter;
      widget.playersList[index].playerCounters.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: const Text("Reset game"),
      content: SizedBox(
        width: screenWidth * 0.6,
        height: screenHeight * 0.4,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Are you sure?",
                style: TextStyle(
                  fontSize: (screenWidth / screenHeight) * 55,
                  color: Color(0xff504bff),
                ),
              ),
              const SizedBox(height: 8),
              OptionsButton(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  textSizeScale: 55,
                  text: "Yes",
                  onPressed: () {
                    for (var i = 0; i < widget.playersList.length; i++) {
                      resetPlayer(i);
                    }
                    widget.onResetComplete();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }
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
            "Cancel",
            style: TextStyle(
              color: Color(0xff504bff),
            ),
          ),
        ),
      ],
    );
  }
}
