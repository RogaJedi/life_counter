import 'package:flutter/material.dart';
import 'package:raccoon_counter/custom_icons.dart';

class DiceAndCoinDialog extends StatelessWidget {

  const DiceAndCoinDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                  print("option 1");
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
                  print("option 2");
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
                  print("option 3");
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
