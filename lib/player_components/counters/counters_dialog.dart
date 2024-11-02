import 'package:flutter/material.dart';
import 'counters_icons.dart';
import '../../items.dart';
import 'c_items.dart';
import 'counters_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CountersDialog extends StatefulWidget {
  final Item player;
  final double aspectRatio;
  final Function() onSelectedCounters;

  const CountersDialog({
    super.key,
    required this.player,
    required this.aspectRatio,
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
      title: Text(
          "Add Counters",
        style: TextStyle(
          color: Colors.white,
          fontSize: widget.aspectRatio * 80,
        ),
      ),
      content: SizedBox(
        width: widget.aspectRatio * 65,
        height: widget.aspectRatio * 750,
        child: Center(
          child: SizedBox(
            width: widget.aspectRatio * 540,
            height: widget.aspectRatio * 750,
            child: Card(
              color: Color(0xff353535),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  CountersButton(
                      icon: CountersIcons.dice_one,
                      label: "Player A",
                      aspectRatio: widget.aspectRatio,
                      buttonStates: buttonStates,
                      onTap: () {
                        onButtonPressed(CountersIcons.dice_one, "player A");
                      }
                  ),
                  CountersButton(
                      icon: CountersIcons.dice_two,
                      label: "Player B",
                      aspectRatio: widget.aspectRatio,
                      buttonStates: buttonStates,
                      onTap: () {
                        onButtonPressed(CountersIcons.dice_two, "player B");
                      }
                  ),
                  CountersButton(
                      icon: CountersIcons.dice_three,
                      label: "Player C",
                      aspectRatio: widget.aspectRatio,
                      buttonStates: buttonStates,
                      onTap: () {
                        onButtonPressed(CountersIcons.dice_three, "player C");
                      }
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/white.svg',
                    ),
                    label: "White",
                    aspectRatio: widget.aspectRatio,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "white");
                    },
                  ),

                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/blue.svg',
                    ),
                    label: "Blue",
                    aspectRatio: widget.aspectRatio,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "blue");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/black.svg'
                    ),
                    label: "Black",
                    aspectRatio: widget.aspectRatio,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "black");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/red.svg',
                    ),
                    label: "Red",
                    aspectRatio: widget.aspectRatio,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "red");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/green.svg',
                    ),
                    label: "Green",
                    aspectRatio: widget.aspectRatio,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "green");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/colorless.svg',
                    ),
                    label: "Colorless",
                    aspectRatio: widget.aspectRatio,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "colorless");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/storm.svg',
                    ),
                    label: "Storm",
                    aspectRatio: widget.aspectRatio,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "storm");
                    },
                  ),
                  //experience
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/poison.svg',
                    ),
                    label: "Poison",
                    aspectRatio: widget.aspectRatio,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "poison");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/energy.svg',
                    ),
                    label: "Energy",
                    aspectRatio: widget.aspectRatio,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "energy");
                    },
                  ),
                  SizedBox(width: widget.aspectRatio),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/exp.svg',
                    ),
                    label: "Experience",
                    aspectRatio: widget.aspectRatio,
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