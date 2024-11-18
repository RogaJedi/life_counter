import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../items.dart';
import 'pick_color_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'template_color.dart';

class PickColorCard extends StatefulWidget {
  final Item player;
  final VoidCallback onCountersTap;
  final VoidCallback onClose;
  final Function(int, Color) onColorSelected;
  final int turn;

  const PickColorCard({
    super.key,
    required this.player,
    required this.onCountersTap,
    required this.onClose,
    required this.onColorSelected,
    required this.turn,
  });

  @override
  _PickColorCardState createState() => _PickColorCardState();
}


class _PickColorCardState extends State<PickColorCard>{
  late Color currentColor;

  Color bgColor = const Color(0xFF353535);

  late Color finalColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.player.colorHex;
    finalColor = widget.player.colorHex;
  }

  void changeColor(HSVColor color) {
    setState(() => currentColor = color.toColor());
  }

  String colorToHex(Color color) {
    String hexRaw = '#${color.value.toRadixString(16).padLeft(8, '0')}';
    String hexColor = hexRaw.replaceAll('#ff', '0xff');
    return hexColor;
  }

  late int lastSelectedColorId = -1;

  void onSelectColor(int selectedColorId){
    if (presetColors[selectedColorId][0] == const Color(0xFF353535)) {
      setState(() {
        if (lastSelectedColorId > -1) {
          presetColors[lastSelectedColorId][0] = const Color(0xFF353535);
        }
        lastSelectedColorId = selectedColorId;
        presetColors[selectedColorId][0] = presetColors[selectedColorId][1];
        widget.onColorSelected(widget.player.id, presetColors[selectedColorId][1]);
      });
    }
  }

  List<List<Color>> presetColors = [
    [Color(0xFF353535), Color(0xFF73E5E5)],

    [Color(0xFF353535), Color(0xFFE57373)],

    [Color(0xFF353535), Color(0xFF73BFE5)],

    [Color(0xFF353535), Color(0xFFE59973)],

    [Color(0xFF353535), Color(0xFF7399E5)],

    [Color(0xFF353535), Color(0xFFFFC34C)],

    [Color(0xFF353535), Color(0xFF7373E5)],

    [Color(0xFF353535), Color(0xFFE5E573)],

    [Color(0xFF353535), Color(0xFF9973E5)],

    [Color(0xFF353535), Color(0xFFBFE573)],

    [Color(0xFF353535), Color(0xFFBF73E5)],

    [Color(0xFF353535), Color(0xFF99E573)],

    [Color(0xFF353535), Color(0xFFE573E5)],

    [Color(0xFF353535), Color(0xFF73E573)],

    [Color(0xFF353535), Color(0xFFE573BF)],

    [Color(0xFF353535), Color(0xFF73E599)],

    [Color(0xFF353535), Color(0xFFE57399)],

    [Color(0xFF353535), Color(0xFF73E5BF)],

  ];





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
              child: ListView(
                children: [
                  Column(
                    children: [
                      Transform.rotate(
                        angle: 90 * 3.14159 / 180,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: widget.onClose,
                              icon: SvgPicture.asset(
                                'assets/back.svg',
                                height: 70.h,
                              ),
                            ),
                            Text(
                              "BACK",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 90.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF353535), width: 2),
                        ),
                        child: Center(
                          child: Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const RotatedBox(quarterTurns: 1, child: Icon(Icons.edit)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => onSelectColor(0),
                        child: TemplateColor(
                            borderColor: presetColors[0][0],
                            mainColor: presetColors[0][1],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      GestureDetector(
                        onTap: () => onSelectColor(1),
                        child: TemplateColor(
                          borderColor: presetColors[1][0],
                          mainColor: presetColors[1][1],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => onSelectColor(2),
                        child: TemplateColor(
                          borderColor: presetColors[2][0],
                          mainColor: presetColors[2][1],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      GestureDetector(
                        onTap: () => onSelectColor(3),
                        child: TemplateColor(
                          borderColor: presetColors[3][0],
                          mainColor: presetColors[3][1],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => onSelectColor(4),
                        child: TemplateColor(
                        borderColor: presetColors[4][0],
                          mainColor: presetColors[4][1],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      GestureDetector(
                        onTap: () => onSelectColor(5),
                        child: TemplateColor(
                          borderColor: presetColors[5][0],
                          mainColor: presetColors[5][1],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => onSelectColor(6),
                        child: TemplateColor(
                          borderColor: presetColors[6][0],
                          mainColor: presetColors[6][1],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      GestureDetector(
                        onTap: () => onSelectColor(7),
                        child: TemplateColor(
                          borderColor: presetColors[7][0],
                          mainColor: presetColors[7][1],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => onSelectColor(8),
                        child: TemplateColor(
                          borderColor: presetColors[8][0],
                          mainColor: presetColors[8][1],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      GestureDetector(
                        onTap: () => onSelectColor(9),
                        child: TemplateColor(
                          borderColor: presetColors[9][0],
                          mainColor: presetColors[9][1],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => onSelectColor(10),
                        child: TemplateColor(
                          borderColor: presetColors[10][0],
                          mainColor: presetColors[10][1],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      GestureDetector(
                        onTap: () => onSelectColor(11),
                        child: TemplateColor(
                          borderColor: presetColors[11][0],
                          mainColor: presetColors[11][1],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => onSelectColor(12),
                        child: TemplateColor(
                          borderColor: presetColors[12][0],
                          mainColor: presetColors[12][1],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      GestureDetector(
                        onTap: () => onSelectColor(13),
                        child: TemplateColor(
                          borderColor: presetColors[13][0],
                          mainColor: presetColors[13][1],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => onSelectColor(14),
                        child: TemplateColor(
                          borderColor: presetColors[14][0],
                          mainColor: presetColors[14][1],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      GestureDetector(
                        onTap: () => onSelectColor(15),
                        child: TemplateColor(
                          borderColor: presetColors[15][0],
                          mainColor: presetColors[15][1],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => onSelectColor(16),
                        child: TemplateColor(
                          borderColor: presetColors[16][0],
                          mainColor: presetColors[16][1],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      GestureDetector(
                        onTap: () => onSelectColor(17),
                        child: TemplateColor(
                          borderColor: presetColors[17][0],
                          mainColor: presetColors[17][1],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ),
        );
      },
    );
  }
}
/*
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

                                   */