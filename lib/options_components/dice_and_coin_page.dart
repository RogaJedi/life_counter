import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'dart:math';

class DiceAndCoinPage extends StatefulWidget {
  const DiceAndCoinPage({Key? key}) : super(key: key);

  @override
  _DiceAndCoinPageState createState() => _DiceAndCoinPageState();
}

class _DiceAndCoinPageState extends State<DiceAndCoinPage> {


  String label = "D20";
  String result = "20";

  void _generateNewResult(int max) {
    final random = Random();
    final randomNumber = 1 + random.nextInt(max);
    setState(() {
      if (max == 2) {
        if (randomNumber == 1) {
          result = "Heads";
        } else if (randomNumber == 2) {
          result = "Tails";
        }
      } else {
        result = "$randomNumber";
      }
    });
  }

  void _generateNewLabel(String newLabel) {
    setState(() {
      label = newLabel;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = screenWidth / screenHeight;
    double mult = 0.1;

    return Scaffold(
      backgroundColor: const Color(0xff1e1e1e),
      body: ListView(
        children: [
          SizedBox(
            height: screenHeight * 0.7,
            width: screenWidth * 0.9,
            child: Card(
              shape: SmoothRectangleBorder(
                smoothness: 0.6,
                borderRadius: BorderRadius.circular(20),
              ),
              color: const Color(0xff73cf48),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenHeight * 0.02), // Add some padding
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.065), // Space for the button
                          SizedBox(height: screenHeight * 0.17),
                          Text(
                            "$label result",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: aspectRatio * 80,
                            ),
                          ),
                          Text(
                            "$result",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: aspectRatio * 180,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.02, // Adjust this value for vertical positioning
                    right: screenHeight * 0.02, // Adjust this value for horizontal positioning
                    child: SizedBox(
                      height: screenHeight * 0.065,
                      width: screenHeight * 0.065,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffff014a),
                          shape: SmoothRectangleBorder(
                            smoothness: 0.6,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.zero, // Remove default padding
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset('assets/cross.svg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: const Color(0xff353535),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.025),
                Text(
                  "Tap to roll",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: aspectRatio * 80,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconColumn(context, 'assets/d20.svg', 'D20', screenHeight, aspectRatio, mult),
                    _buildIconColumn(context, 'assets/d6.svg', 'D6', screenHeight, aspectRatio, mult),
                    _buildIconColumn(context, 'assets/coin.svg', 'Coin', screenHeight, aspectRatio, mult),
                  ],
                ),
                SizedBox(height: screenHeight * 0.025),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIconColumn(BuildContext context, String assetPath, String label, double screenHeight, double aspectRatio, double mult) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            switch (label) {
              case 'D20':
                _generateNewLabel("D20");
                _generateNewResult(20);
              case 'D6':
                _generateNewLabel("D6");
                _generateNewResult(6);
              case 'Coin':
                _generateNewLabel("Coin");
                _generateNewResult(2);
            }
          },
          icon: SvgPicture.asset(
            assetPath,
            height: screenHeight * mult,
            width: screenHeight * mult,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: aspectRatio * 60,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
