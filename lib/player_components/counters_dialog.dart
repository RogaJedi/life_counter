import 'package:flutter/material.dart';
import '../items.dart';
import 'counters/c_items.dart';
import 'counters/counters_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return AlertDialog(
      backgroundColor: Color(0xff1e1e1e),
      title: Text(
          "Add Counters",
        style: TextStyle(
          color: Colors.white,
          fontSize: 35.sp,
        ),
      ),
      content: SizedBox(
        width: 300.w,
        height: 350.h,
        child: Center(
          child: SizedBox(
            width: 252.w,
            height: 350.h,
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
                    isActive: buttonStates['white'] ?? false,
                    onTap: () => onButtonPressed("assets/white.svg", "white"),
                  ),

                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/blue.svg',
                    ),
                    label: "Blue",
                    isActive: buttonStates['blue'] ?? false,
                    onTap: () => onButtonPressed("assets/blue.svg", "blue"),
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/black.svg'
                    ),
                    label: "Black",
                    isActive: buttonStates['black'] ?? false,
                    onTap: () => onButtonPressed("assets/black.svg", "black"),
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/red.svg',
                    ),
                    label: "Red",
                    isActive: buttonStates['red'] ?? false,
                    onTap: () => onButtonPressed("assets/red.svg", "red"),
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/green.svg',
                    ),
                    label: "Green",
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
                    isActive: buttonStates['colorless'] ?? false,
                    onTap: () => onButtonPressed("assets/colorless.svg", "colorless"),
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/storm.svg',
                    ),
                    label: "Storm",
                    isActive: buttonStates['storm'] ?? false,
                    onTap: () => onButtonPressed("assets/storm.svg", "storm"),
                  ),
                  //experience
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/poison.svg',
                    ),
                    label: "Poison",
                    isActive: buttonStates['poison'] ?? false,
                    onTap: () => onButtonPressed("assets/poison.svg", "poison"),
                  ),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/energy.svg',
                    ),
                    label: "Energy",
                    isActive: buttonStates['energy'] ?? false,
                    onTap: () => onButtonPressed("assets/energy.svg", "energy"),
                  ),
                  const SizedBox(width: 1),
                  CountersButton(
                    icon: SvgPicture.asset(
                      'assets/exp.svg',
                    ),
                    label: "Experience",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 105.w,
              height: 56.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6666),
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
            SizedBox(width: 16.w),
            SizedBox(
              width: 105.w,
              height: 56.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF67E55C),
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
        )

      ],
    );
  }
}