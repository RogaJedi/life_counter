import 'package:flutter/material.dart';
import '../items.dart';
import 'counters/c_items.dart';
import 'counters/counters_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountersDialogHorizontal extends StatefulWidget {
  final Item player;
  final Function() onSelectedCounters;

  const CountersDialogHorizontal({
    super.key,
    required this.player,
    required this.onSelectedCounters,
  });

  @override
  _CountersDialogHorizontalState createState() => _CountersDialogHorizontalState();
}

class _CountersDialogHorizontalState extends State<CountersDialogHorizontal> {

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
      content: SizedBox(
        width: 328.w,
        height: 420.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center, // This will center the icon on the button
                  children: [
                    SizedBox(
                      width: 50.w,
                      height: 190.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF6666),
                          shape: SmoothRectangleBorder(
                            smoothness: 0.6,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.zero, // Remove default padding
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: SizedBox.shrink(), // Use SizedBox.shrink() instead of empty Text
                      ),
                    ),
                    SizedBox(
                      width: 24.w, // Adjust this value to change icon size
                      height: 24.h, // Adjust this value to change icon size
                      child: SvgPicture.asset(
                        'assets/cross.svg',
                        fit: BoxFit.contain, // This will scale the SVG to fit within the SizedBox
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17.h,),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 50.w,
                      height: 190.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF67E55C),
                          shape: SmoothRectangleBorder(
                            smoothness: 0.6,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.zero, // Remove default padding
                        ),
                        onPressed: () {
                          widget.onSelectedCounters();
                          Navigator.of(context).pop();
                        },
                        child: SizedBox.shrink(), // Use SizedBox.shrink() instead of empty child
                      ),
                    ),
                    SizedBox(
                      width: 24.w, // Adjust this value to change icon size
                      height: 24.h, // Adjust this value to change icon size
                      child: Transform.rotate(
                        angle: 90 * 3.14159 / 180,
                        child: SvgPicture.asset(
                          'assets/check.svg',
                          fit: BoxFit.contain, // This will scale the SVG to fit within the SizedBox
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),


            SizedBox(
              width: 160.w,
              height: 410.h,

              child: Card(
                color: Color(0xff353535),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: CountersButton(
                        icon: SvgPicture.asset(
                          'assets/white.svg',
                        ),
                        label: "White",
                        isActive: buttonStates['white'] ?? false,
                        onTap: () => onButtonPressed("assets/white.svg", "white"),
                      ),
                    ),
                    Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: CountersButton(
                        icon: SvgPicture.asset(
                          'assets/blue.svg',
                        ),
                        label: "Blue",
                        isActive: buttonStates['blue'] ?? false,
                        onTap: () => onButtonPressed("assets/blue.svg", "blue"),
                      ),
                    ),
                    Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: CountersButton(
                        icon: SvgPicture.asset(
                            'assets/black.svg'
                        ),
                        label: "Black",
                        isActive: buttonStates['black'] ?? false,
                        onTap: () => onButtonPressed("assets/black.svg", "black"),
                      ),
                    ),
                    Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: CountersButton(
                        icon: SvgPicture.asset(
                          'assets/red.svg',
                        ),
                        label: "Red",
                        isActive: buttonStates['red'] ?? false,
                        onTap: () => onButtonPressed("assets/red.svg", "red"),
                      ),
                    ),
                    Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: CountersButton(
                        icon: SvgPicture.asset(
                          'assets/green.svg',
                        ),
                        label: "Green",
                        isActive: buttonStates['green'] ?? false,
                        onTap: () {
                          onButtonPressed('assets/green.svg', "green");
                        },
                      ),
                    ),
                    Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: CountersButton(
                        icon: SvgPicture.asset(
                          'assets/colorless.svg',
                        ),
                        label: "Colorless",
                        isActive: buttonStates['colorless'] ?? false,
                        onTap: () => onButtonPressed("assets/colorless.svg", "colorless"),
                      ),
                    ),
                    Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: CountersButton(
                        icon: SvgPicture.asset(
                          'assets/storm.svg',
                        ),
                        label: "Storm",
                        isActive: buttonStates['storm'] ?? false,
                        onTap: () => onButtonPressed("assets/storm.svg", "storm"),
                      ),
                    ),
                    //experience
                    Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: CountersButton(
                        icon: SvgPicture.asset(
                          'assets/poison.svg',
                        ),
                        label: "Poison",
                        isActive: buttonStates['poison'] ?? false,
                        onTap: () => onButtonPressed("assets/poison.svg", "poison"),
                      ),
                    ),
                    Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: CountersButton(
                        icon: SvgPicture.asset(
                          'assets/energy.svg',
                        ),
                        label: "Energy",
                        isActive: buttonStates['energy'] ?? false,
                        onTap: () => onButtonPressed("assets/energy.svg", "energy"),
                      ),
                    ),
                    Transform.rotate(
                      angle: 90 * 3.14159 / 180,
                      child: CountersButton(
                        icon: SvgPicture.asset(
                          'assets/exp.svg',
                        ),
                        label: "Experience",
                        isActive: buttonStates['experience'] ?? false,
                        onTap: () => onButtonPressed("assets/exp.svg", "experience"),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            Column(
              children: [
                SizedBox(height: 10.h,),
                RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    "Add counters",
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}