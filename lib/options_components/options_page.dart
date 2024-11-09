import 'package:flutter/material.dart';
import '../items.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'option_button.dart';
import 'reset_game_dialog.dart';
import 'dice_and_coin_page.dart';
import '../number_of_players/settings_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionsPage extends StatefulWidget {
  final List<Item> playersList;
  final List<Item> defaultPlayersList;
  final Function() onResetComplete;
  final double aspectRatio;
  final Function navigateToOptionsPage;
  final Function navigateToCountersDialog;

  const OptionsPage({
    Key? key,
    required this.playersList,
    required this.defaultPlayersList,
    required this.onResetComplete,
    required this.aspectRatio,
    required this.navigateToOptionsPage,
    required this.navigateToCountersDialog,
  }) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {

  Color _getButtonColor(int index) {
    List<Color> colors = [
      Color(0xFF676767),
      //0xFF5CC3E5
      Color(0xFF676767),
      //0xFFC973E5
      Color(0xFFE573B6),
      Color(0xFFFF6666),
      Color(0xFFFFC34D),
      Color(0xFF676767),
      //0xFF5AD863
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsPage(
                    aspectRatio: widget.aspectRatio,
                    navigateToOptionsPage: widget.navigateToOptionsPage,
                    navigateToCountersDialog: widget.navigateToCountersDialog
                ),
              ),
            );
        // Add your specific functionality here
      },
          () {
        // Function for button 3
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DiceAndCoinPage(),
                ),
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
              height: 43.h,
              width: 157.w,
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
                    fontSize: 17.sp,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Settings",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35.sp,
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
              height: 56.h,
              width: 353.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6666),
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
                    fontSize: 24.sp,
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
