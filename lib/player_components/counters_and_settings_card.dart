import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../items.dart';
import 'counters/interactive_counters_card.dart';
import 'pick_color_dialog.dart';

class CountersAndSettingsCard extends StatefulWidget {
  final Item player;
  final List<Item> playersList;
  final double aspectRatio;
  final VoidCallback onCountersTap;
  final Function(Item, List<Item>) onColorSelected;

  const CountersAndSettingsCard({
    super.key,
    required this.player,
    required this.playersList,
    required this.aspectRatio,
    required this.onCountersTap,
    required this.onColorSelected,
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
    String hex = widget.player.colorHex.replaceAll('0x', '');
    int colorInt = int.parse(hex, radix: 16);
    currentColor = Color(colorInt);
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          color: bgColor,
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: ListView.builder(
              itemCount: widget.player.playerCounters.length + 1,
              itemBuilder: (context, index) {
                if (index < widget.player.playerCounters.length) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: SizedBox(
                        width: screenWidth * 0.35,
                        height: screenHeight * 0.075,
                        child: InteractiveCountersCard(
                          player: widget.player,
                          index: index,
                          aspectRatio: widget.aspectRatio,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      if (widget.player.playerCounters.isNotEmpty)
                        //DIVIDER
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10), // Adjust this value to change the roundness
                          ),
                          height: screenHeight * 0.0032,
                          width: screenWidth * 0.35,
                        ),
                      Transform.rotate(
                        angle: 90 * 3.14159 / 180,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: widget.onCountersTap,
                              icon: SvgPicture.asset(
                                'assets/add_counter.svg',
                                height: screenHeight * 0.075,
                              ),
                            ),
                            Text(
                              "ADD COUNTER",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.022,
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
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                      builder: (context, setState) => PickColorDialog(
                                        currentColor: currentColor,
                                        onChanged: (newColor) => setState(() => changeColor(newColor)),
                                        onPressed: () {
                                          Item newItem = Item(
                                            colorHex: colorToHex(currentColor),
                                            counter: 40,
                                            playerCounters: [],
                                            counterButtonStates: {},
                                            id: widget.player.id,
                                          );
                                          widget.onColorSelected(newItem, widget.playersList);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: SvgPicture.asset(
                                'assets/white.svg',
                                height: screenHeight * 0.075,
                                color: currentColor,
                              ),
                            ),
                            Text(
                              "BACKGROUND",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.022,
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
        );
      },
    );
  }
}