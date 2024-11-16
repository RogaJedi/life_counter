import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../items.dart';
import 'pick_color_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickColorCard extends StatefulWidget {
  final Item player;
  final List<Item> playersList;
  final VoidCallback onCountersTap;
  final VoidCallback onClose;
  final Function(Item, List<Item>) onColorSelected;
  final int turn;

  const PickColorCard({
    super.key,
    required this.player,
    required this.playersList,
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




  List<Widget> presetColors = [

    Container(
      height: 80.h,
      width: 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFE57373), width: 2),
      ),
      child: Center(
        child: Container(
          height: 70.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: Color(0xFFE57373),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),

    Container(
      height: 80.h,
      width: 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF73BFE5), width: 2),
      ),
      child: Center(
        child: Container(
          height: 70.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: Color(0xFF73BFE5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),

    Container(
      height: 80.h,
      width: 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFE59973), width: 2),
      ),
      child: Center(
        child: Container(
          height: 70.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: Color(0xFFE59973),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),

    Container(
      height: 80.h,
      width: 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF7399E5), width: 2),
      ),
      child: Center(
        child: Container(
          height: 70.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: Color(0xFF7399E5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),

    Container(
      height: 80.h,
      width: 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFFFC34C), width: 2),
      ),
      child: Center(
        child: Container(
          height: 70.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: Color(0xFFFFC34C),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),


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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      presetColors[0],
                      SizedBox(width: 10.w,),
                      Container(
                        height: 80.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const RotatedBox(quarterTurns: 1, child: Icon(Icons.edit)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      presetColors[1],
                      SizedBox(width: 10.w,),
                      presetColors[2]
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      presetColors[3],
                      SizedBox(width: 10.w,),
                      presetColors[4]
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