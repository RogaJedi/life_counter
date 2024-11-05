import 'package:flutter/material.dart';
import '../items.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'option_button.dart';
import 'dice_and_coin_page.dart';
import 'reset_game_dialog.dart';
import '../app_settings_components/settings_page.dart';

class OptionsPage extends StatefulWidget {
  final List<Item> playersList;
  final List<Item> defaultPlayersList;
  final Function() onResetComplete;
  final double aspectRatio;

  const OptionsPage({
    Key? key,
    required this.playersList,
    required this.defaultPlayersList,
    required this.onResetComplete,
    required this.aspectRatio,
  }) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {

  Color _getButtonColor(int index) {
    List<Color> colors = [
      Color(0xfffe0167),
      Color(0xfffe9801),
      Color(0xff8bc24a),
      Color(0xff0167fe),
      Color(0xff9801fe),
      Color(0xff01e6fe),
    ];
    return colors[index % colors.length];
  }

  String _getButtonInfo(int index) {
    List<String> info = [
      'High roll',
      'Starting life',
      'Number of players',
      'Dice & Coin',
      'Restart',
      'History',
    ];
    return info[index % info.length];
  }

  VoidCallback _getButtonFunction(int index) {
    List<VoidCallback> functions = [
          () {
        // Function for button 0
        print("Button 0 pressed");
        // Add your specific functionality here
      },
          () {
        // Function for button 1
        print("Button 1 pressed");
        // Add your specific functionality here
      },
          () {
        // Function for button 2
        print("Button 2 pressed");
        // Add your specific functionality here
      },
          () {
        // Function for button 3
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DiceAndCoinPage();
                }
            );
        // Add your specific functionality here
      },
          () {
        // Function for button "Restart"
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return ResetGameDialog(
                  playersList: widget.playersList,
                  defaultPlayersList: widget.defaultPlayersList,
                  onResetComplete: widget.onResetComplete,
              );
            }
        );
        // Add your specific functionality here
      },
          () {
        // Function for button 5
        print("Button 5 pressed");
        // Add your specific functionality here
      },
    ];
    return functions[index % functions.length];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1e1e),
      body: Column(
        children: [
          SizedBox(height: widget.aspectRatio * 50),
          Center(
            child: SizedBox(
              height: widget.aspectRatio * 90,
              width: widget.aspectRatio * 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1e1e1e),
                  shape: SmoothRectangleBorder(
                    smoothness: 0.6,
                    borderRadius:
                    BorderRadius.circular(60),
                    side: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                onPressed: () {},
                child: Text(
                    "Got feedback?",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: widget.aspectRatio * 30,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Settings",
            style: TextStyle(
              color: Colors.white,
              fontSize: widget.aspectRatio * 100,
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) { // Subtracting for spacing
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2,
                  ),
                  itemCount: 6, // Or however many buttons you have
                  padding: EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return OptionsButton(
                      aspectRatio: widget.aspectRatio,
                      textSizeScale: 50, // Adjust this value to change text size
                      text: _getButtonInfo(index),
                      onPressed: _getButtonFunction(index),
                      buttonColor: _getButtonColor(index),
                    );
                  },
                );
              },
            ),
          ),
          Center(
            child: SizedBox(
              height: widget.aspectRatio * 120,
              width: widget.aspectRatio * 700,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffff014a),
                  shape: SmoothRectangleBorder(
                    smoothness: 0.6,
                    borderRadius:
                    BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {Navigator.of(context).pop();},
                child: Text(
                  "Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: widget.aspectRatio * 50,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: widget.aspectRatio * 45),
        ],
      ),
    );
  }
}
