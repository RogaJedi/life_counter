import 'package:flutter/material.dart';
import 'package:raccoon_counter/counters_icons.dart';
import '../items.dart';
import 'c_items.dart';
import 'counters_button.dart';

class CountersDialog extends StatefulWidget {
  final Item player;

  const CountersDialog({
    super.key,
    required this.player,
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

    double turn = 90;
    if (widget.player.id % 2 != 0) turn = 270;

    return Transform.rotate(
      angle: turn * 3.14159 / 180,
      child: AlertDialog(
        title: const Text("Add Counters"),
        content: SizedBox(
          width: screenWidth * 0.5,
          height: screenHeight * 0.25,
          child: Center(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                CountersButton(
                    icon: CountersIcons.dice_one,
                    label: "player A",
                    screenHeight: screenHeight,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.dice_one, "player A");
                    }
                ),
                CountersButton(
                    icon: CountersIcons.dice_two,
                    label: "player B",
                    screenHeight: screenHeight,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.dice_two, "player B");
                    }
                ),
                CountersButton(
                    icon: CountersIcons.dice_three,
                    label: "player C",
                    screenHeight: screenHeight,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.dice_three, "player C");
                    }
                ),
                CountersButton(
                    icon: CountersIcons.sun,
                    label: "white",
                    screenHeight: screenHeight,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.sun, "white");
                    }
                ),
                CountersButton(
                    icon: CountersIcons.tint,
                    label: "blue",
                    screenHeight: screenHeight,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.tint, "blue");
                    }
                ),
                CountersButton(
                    icon: CountersIcons.skull,
                    label: "black",
                    screenHeight: screenHeight,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.skull, "black");
                    }
                ),
                CountersButton(
                    icon: CountersIcons.fire_alt,
                    label: "red",
                    screenHeight: screenHeight,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.fire_alt, "red");
                    }
                ),
                CountersButton(
                    icon: CountersIcons.tree,
                    label: "green",
                    screenHeight: screenHeight,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.tree, "green");
                    }
                ),
                CountersButton(
                    icon: CountersIcons.vial,
                    label: "poison",
                    screenHeight: screenHeight,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.vial, "poison");
                    }
                ),
                CountersButton(
                    icon: CountersIcons.graduation_cap,
                    label: "experience",
                    screenHeight: screenHeight,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.graduation_cap, "experience");
                    }
                ),
                CountersButton(
                    icon: CountersIcons.radiation,
                    label: "radiation",
                    screenHeight: screenHeight,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.radiation, "radiation");
                    }
                ),
                CountersButton(
                    icon: CountersIcons.clock,
                    label: "time",
                    screenHeight: screenHeight,
                    buttonStates: buttonStates,
                    onTap: () {
                      onButtonPressed(CountersIcons.clock, "time");
                    }
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
      ),
    );
  }
}