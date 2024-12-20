import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../items.dart';
import 'counters/interactive_counters_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//TODO: FIX COLOR BUTTON

class CountersAndSettingsCard extends StatefulWidget {
  final Item player;
  final VoidCallback onCountersTap;
  final VoidCallback onPickColorTap;
  final Function(int, Color) onColorSelected;
  final int turn;

  const CountersAndSettingsCard({
    super.key,
    required this.player,
    required this.onCountersTap,
    required this.onPickColorTap,
    required this.onColorSelected,
    required this.turn,
  });

  @override
  _CountersAndSettingsCardState createState() => _CountersAndSettingsCardState();
}


class _CountersAndSettingsCardState extends State<CountersAndSettingsCard>{
  late Color currentColor;

  Color bgColor = const Color(0xff353535);

  @override
  void initState() {
    super.initState();
    currentColor = widget.player.colorHex;
  }



  void changeColor(HSVColor color) {
    setState(() => currentColor = color.toColor());
  }

  String colorToHex(Color color) {
    String hexRaw = '#${color.value.toRadixString(16).padLeft(8, '0')}';
    String hexColor = hexRaw.replaceAll('#ff', '0xff');
    return hexColor;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          color: bgColor,
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Transform.rotate(
              angle: widget.turn * 3.14159 / 180,
              child: ListView.builder(
                itemCount: widget.player.playerCounters.length + 1,
                itemBuilder: (context, index) {
                  if (index < widget.player.playerCounters.length) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(
                        child: SizedBox(
                          width: 137.w,
                          height: 56.h,
                          child: InteractiveCountersCard(
                            player: widget.player,
                            index: index,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        if (widget.player.playerCounters.isNotEmpty)
                          //DIVIDER
                          Column(
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10), // Adjust this value to change the roundness
                                ),
                                height: 3.h,
                                width: 142.1.w,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                            ],
                          ),
                        Transform.rotate(
                          angle: 90 * 3.14159 / 180,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: widget.onCountersTap,
                                icon: SvgPicture.asset(
                                  'assets/add_counter.svg',
                                  height: 70.h,
                                ),
                              ),
                              Text(
                                "ADD COUNTER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.rotate(
                          angle: 90 * 3.14159 / 180,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: widget.onPickColorTap,
                                icon: SvgPicture.asset(
                                  'assets/white.svg',
                                  height: 70.h,
                                  color: currentColor,
                                ),
                              ),
                              Text(
                                "BACKGROUND",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}