import 'package:flutter/material.dart';
import 'package:raccoon_counter/custom_icons.dart';
import 'dice_and_coin_randomizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiceAndCoinPage extends StatelessWidget {

  const DiceAndCoinPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = screenWidth / screenHeight;
    double textSize = aspectRatio * 55;
    double mult = 0.07;
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
                  padding: WidgetStateProperty.all(EdgeInsets.all(screenHeight * 0.03)),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DiceAndCoinRandomizer(
                        max: 6,
                        title: "Roll a D6",
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        textSize: textSize,
                      ).getDialog(context);
                    },
                  );
                },
                icon: SvgPicture.asset(
                  'assets/d6.svg',
                  height: screenHeight * mult,
                  width: screenHeight * mult,
                ),
              ),

              IconButton(
                style: ButtonStyle(
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
                icon: SvgPicture.asset(
                  'assets/d20.svg',
                  height: screenHeight * mult,
                  width: screenHeight * mult,
                ),
              ),
              IconButton(
                style: ButtonStyle(
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
                icon: SvgPicture.asset(
                  'assets/coin.svg',
                  height: screenHeight * mult,
                  width: screenHeight * mult,
                ),
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
