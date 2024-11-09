import 'package:flutter/material.dart';
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
    buttonStates = Map.from(widget.player.counterButtonStates);
  }

  void onButtonPressed(String icon, String label) {
    setState(() {
      buttonStates[label] = !(buttonStates[label] ?? false);
      widget.player.counterButtonStates = Map.from(buttonStates); // Update player's state
      if (buttonStates[label]!) {
        widget.player.playerCounters.add(C_Item(counter_icon: icon, counter_amount: 0));
      } else {
        widget.player.playerCounters.removeWhere((item) => item.counter_icon == icon);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    icon: SvgPicture.asset(
                      'assets/white.svg',
                    ),
                    label: "White",
                    aspectRatio: widget.aspectRatio,
                    isActive: buttonStates['white'] ?? false,
                    onTap: () => onButtonPressed("assets/white.svg", "white"),
                  ),

                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/blue.svg',
                    ),
                    label: "Blue",
                    aspectRatio: widget.aspectRatio,
                    isActive: buttonStates['blue'] ?? false,
                    onTap: () => onButtonPressed("assets/blue.svg", "blue"),
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/black.svg'
                    ),
                    label: "Black",
                    aspectRatio: widget.aspectRatio,
                    isActive: buttonStates['black'] ?? false,
                    onTap: () => onButtonPressed("assets/black.svg", "black"),
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/red.svg',
                    ),
                    label: "Red",
                    aspectRatio: widget.aspectRatio,
                    isActive: buttonStates['red'] ?? false,
                    onTap: () => onButtonPressed("assets/red.svg", "red"),
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/green.svg',
                    ),
                    label: "Green",
                    aspectRatio: widget.aspectRatio,
                    isActive: buttonStates['green'] ?? false,
                    onTap: () {
                      onButtonPressed('assets/green.svg', "green");
                    },
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/colorless.svg',
                    ),
                    label: "Colorless",
                    aspectRatio: widget.aspectRatio,
                    isActive: buttonStates['colorless'] ?? false,
                    onTap: () => onButtonPressed("assets/colorless.svg", "colorless"),
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/storm.svg',
                    ),
                    label: "Storm",
                    aspectRatio: widget.aspectRatio,
                    isActive: buttonStates['storm'] ?? false,
                    onTap: () => onButtonPressed("assets/storm.svg", "storm"),
                  ),
                  //experience
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/poison.svg',
                    ),
                    label: "Poison",
                    aspectRatio: widget.aspectRatio,
                    isActive: buttonStates['poison'] ?? false,
                    onTap: () => onButtonPressed("assets/poison.svg", "poison"),
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/energy.svg',
                    ),
                    label: "Energy",
                    aspectRatio: widget.aspectRatio,
                    isActive: buttonStates['energy'] ?? false,
                    onTap: () => onButtonPressed("assets/energy.svg", "energy"),
                  ),
                  SizedBox(width: widget.aspectRatio),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/exp.svg',
                    ),
                    label: "Experience",
                    aspectRatio: widget.aspectRatio,
                    isActive: buttonStates['experience'] ?? false,
                    onTap: () => onButtonPressed("assets/exp.svg", "experience"),
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