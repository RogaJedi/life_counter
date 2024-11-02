import 'package:flutter/material.dart';
import 'counters_icons.dart';
import '../../items.dart';
import 'c_items.dart';
import 'counters_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CountersDialog extends StatefulWidget {
  final Item player;
  final Function() onSelectedCounters;

  const CountersDialog({
    super.key,
    required this.player,
    required this.onSelectedCounters,
  });

  @override
  _CountersDialogState createState() => _CountersDialogState();
}

class _CountersDialogState extends State<CountersDialog> {

  late Map<String, bool> buttonStates;

  @override
  void initState() {
    super.initState();
    buttonStates = widget.player.counterButtonStates;
  }

  void onButtonPressed(IconData icon, String label) {
    setState(() {
      buttonStates[label] = !buttonStates[label]!;
      widget.player.counterButtonStates = buttonStates; // Update player's state
      if (buttonStates[label]!) {
        widget.player.playerCounters.add(C_Item(counter_icon: icon, counter_amount: 0));
      } else {
        widget.player.playerCounters.removeWhere((item) => item.counter_icon == icon);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AlertDialog(
      backgroundColor: Color(0xff1e1e1e),
      title: const Text(
          "Add Counters",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      content: SizedBox(
        width: screenWidth * 0.65,
        height: screenHeight * 0.45,
        child: Center(
          child: SizedBox(
            width: screenWidth * 0.8,
            height: screenHeight * 0.6,
            child: Card(
              color: Color(0xff353535),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  CountersButton(
                      icon: CountersIcons.dice_one,
                      label: "player A",
                      screenHeight: screenHeight * 1.2,
                      buttonStates: buttonStates,
                      onTap: () {
                        onButtonPressed(CountersIcons.dice_one, "player A");
                      }
                  ),
                  CountersButton(
                      icon: CountersIcons.dice_two,
                      label: "player B",
                      screenHeight: screenHeight * 1.2,
                      buttonStates: buttonStates,
                      onTap: () {
                        onButtonPressed(CountersIcons.dice_two, "player B");
                      }
                  ),
                  CountersButton(
                      icon: CountersIcons.dice_three,
                      label: "player C",
                      screenHeight: screenHeight * 1.2,
                      buttonStates: buttonStates,
                      onTap: () {
                        onButtonPressed(CountersIcons.dice_three, "player C");
                      }
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/white.svg',
                      height: screenHeight * 0.04,
                      width: screenHeight * 0.04,
                    ),
                    label: "white",
                    screenHeight: screenHeight * 0.8,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "white");
                    },
                  ),

                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/blue.svg',
                      height: screenHeight * 0.04,
                      width: screenHeight * 0.04,
                    ),
                    label: "blue",
                    screenHeight: screenHeight * 0.8,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "blue");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/black.svg',
                      height: screenHeight * 0.04,
                      width: screenHeight * 0.04,
                    ),
                    label: "black",
                    screenHeight: screenHeight * 0.8,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "black");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/red.svg',
                      height: screenHeight * 0.04,
                      width: screenHeight * 0.04,
                    ),
                    label: "red",
                    screenHeight: screenHeight * 0.8,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "red");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/green.svg',
                      height: screenHeight * 0.04,
                      width: screenHeight * 0.04,
                    ),
                    label: "green",
                    screenHeight: screenHeight * 0.8,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "green");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/colorless.svg',
                      height: screenHeight * 0.04,
                      width: screenHeight * 0.04,
                    ),
                    label: "colorless",
                    screenHeight: screenHeight * 0.8,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "colorless");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/storm.svg',
                      height: screenHeight * 0.04,
                      width: screenHeight * 0.04,
                    ),
                    label: "storm",
                    screenHeight: screenHeight * 0.8,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "storm");
                    },
                  ),
                  //experience
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/poison.svg',
                      height: screenHeight * 0.04,
                      width: screenHeight * 0.04,
                    ),
                    label: "poison",
                    screenHeight: screenHeight * 0.8,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "poison");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/energy.svg',
                      height: screenHeight * 0.04,
                      width: screenHeight * 0.04,
                    ),
                    label: "energy",
                    screenHeight: screenHeight * 0.8,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "energy");
                    },
                  ),
                  SizedBox(height: screenHeight * 0.04, width: screenHeight * 0.04,),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/exp.svg',
                      height: screenHeight * 0.04,
                      width: screenHeight * 0.04,
                    ),
                    label: "experience",
                    screenHeight: screenHeight * 0.8,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "experience");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      actions: [
        SizedBox(
          height: screenHeight * 0.065,
          width: screenHeight * 0.135,
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
        SizedBox(width: screenHeight * 0.01),
        SizedBox(
          height: screenHeight * 0.065,
          width: screenHeight * 0.135,
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
              widget.onSelectedCounters();
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset('assets/check.svg'),
          ),
        ),
      ],
    );
  }
}