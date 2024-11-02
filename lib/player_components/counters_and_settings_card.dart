import 'package:flutter/material.dart';
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

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          color: bgColor,
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.player.playerCounters.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SizedBox(
                            width: widget.aspectRatio * 380,
                            height: widget.aspectRatio * 250,
                            child: InteractiveCountersCard(
                              player: widget.player,
                              index: index,
                              aspectRatio: widget.aspectRatio,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (widget.player.playerCounters.isNotEmpty)
                  Divider(color: Colors.white),
                Transform.rotate(
                  angle: 90 * 3.14159 / 180,
                  child: Column(
                    children: [
                      IconButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(EdgeInsets.all(constraints.maxWidth * 0.05)),
                        ),
                        onPressed: widget.onCountersTap,
                        icon: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 1, // Adjust the width as needed
                            ),
                          ),
                          child: Icon(
                              Icons.add,
                              size: constraints.maxWidth * 0.31,
                              color: Colors.white
                          ),
                        ),
                      ),
                      Text(
                        "ADD COUNTER",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: constraints.maxWidth * 0.07,
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
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(EdgeInsets.all(constraints.maxWidth * 0.0001)),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (context, setState) => PickColorDialog(
                                  currentColor: currentColor,
                                  onChanged: (newColor) =>
                                      setState(() => changeColor(newColor)),
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
                        icon: Icon(
                            Icons.circle,
                            size: constraints.maxWidth * 0.4,
                            color: currentColor
                        ),
                      ),
                      Text(
                        "BACKGROUND",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: constraints.maxWidth * 0.07,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
