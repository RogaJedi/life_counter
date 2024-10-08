import 'package:flutter/material.dart';
import 'package:raccoon_counter/custom_icons.dart';
import 'dice_and_coin_randomizer.dart';

class DiceAndCoinDialog extends StatelessWidget {

  const DiceAndCoinDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = screenWidth / screenHeight;
    double textSize = aspectRatio * 55;
    return AlertDialog(
      title: const Text("Dice & Coin"),
      content: SizedBox(
        width: screenWidth * 0.6,
        height: screenHeight * 0.4,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xff504bff)),
                  padding: WidgetStateProperty.all(EdgeInsets.all(screenHeight * 0.03)),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DiceAndCoinRandomizer(max: 6, title: "Roll a D6", screenWidth: screenWidth, screenHeight: screenHeight, textSize: textSize).getDialog(context);
                      }
                  );
                },
                icon: Icon(CustomIcons.dice_d6, size: screenHeight * 0.06, color: Colors.white),
              ),
              const SizedBox(height: 8),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xff504bff)),
                  padding: WidgetStateProperty.all(EdgeInsets.all(screenHeight * 0.03)),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DiceAndCoinRandomizer(max: 20, title: "Roll a D20", screenWidth: screenWidth, screenHeight: screenHeight, textSize: textSize).getDialog(context);
                      }
                  );
                },
                icon: Icon(CustomIcons.dice_d20, size: screenHeight * 0.06, color: Colors.white),
              ),
              const SizedBox(height: 8),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xff504bff)),
                  padding: WidgetStateProperty.all(EdgeInsets.all(screenHeight * 0.03)),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DiceAndCoinRandomizer(max: 2, title: "Flip a coin", screenWidth: screenWidth, screenHeight: screenHeight, textSize: textSize).getDialog(context);
                      }
                  );
                },
                icon: Icon(CustomIcons.coins, size: screenHeight * 0.06, color: Colors.white),
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
