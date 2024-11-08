import 'package:flutter/material.dart';
import 'option_button.dart';
import '../items.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_corner/smooth_corner.dart';

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
      widget.playersList[index].counterButtonStates = {};
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Color(0xff1e1e1e),
      title: const Text(
          "Restart game",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
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
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.065,
                    width: screenHeight * 0.100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff73cf48),
                        shape: SmoothRectangleBorder(
                          smoothness: 0.6,
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        for (var i = 0; i < widget.playersList.length; i++) {
                          resetPlayer(i);
                        }
                        widget.onResetComplete();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset('assets/check.svg'),
                    ),
                  ),
                  SizedBox(width: 65),
                  SizedBox(
                    height: screenHeight * 0.065,
                    width: screenHeight * 0.100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffff014a),
                        shape: SmoothRectangleBorder(
                          smoothness: 0.6,
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset('assets/cross.svg'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
