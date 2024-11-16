import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../layouts/2_players_A.dart';
import '../layouts/2_players_B.dart';
import '../layouts/4_players_A.dart';
import 'l_2_a.dart';
import 'l_2_b.dart';
import 'l_4_a.dart';

class SelectorPage extends StatefulWidget {

  final double aspectRatio;
  final Function navigateToOptionsPage;
  final Function navigateToCountersDialog;

  const SelectorPage({
    Key? key,
    required this.aspectRatio,
    required this.navigateToOptionsPage,
    required this.navigateToCountersDialog,
  }) : super(key: key);

  @override
  _SelectorPageState createState() => _SelectorPageState();
}

class _SelectorPageState extends State<SelectorPage>{

  late Function() createChosenLayout;

  Map<String, List<Color>> layoutButtonsColors = {
    "L2A": [Color(0xFF1E1E1E), Color(0xFF676767)],
    "L2B": [Color(0xFF1E1E1E), Color(0xFF676767)],
    "L4A": [Color(0xFF1E1E1E), Color(0xFF676767)],
  };

  void onSelectLayout(String layout, Function() createLayout) {
    setState(() {
      layoutButtonsColors = {
        "L2A": [Color(0xFF1E1E1E), Color(0xFF676767)],
        "L2B": [Color(0xFF1E1E1E), Color(0xFF676767)],
        "L4A": [Color(0xFF1E1E1E), Color(0xFF676767)],
      };
      layoutButtonsColors[layout] = [Color(0xFFFFC34D), Color(0xFFFFC34D)];
      createChosenLayout = createLayout;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Center(
        child: Column(
          children: [
            Text(
              "number of players",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //2 PLAYERS
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () => onSelectLayout(
                        "L2A",
                            () => TwoPlayersA(
                          aspectRatio: widget.aspectRatio,
                          navigateToOptionsPage: widget.navigateToOptionsPage,
                          navigateToCountersDialog: widget.navigateToCountersDialog
                        ),
                      ),
                      child: L2A(currentColors: layoutButtonsColors["L2A"] ?? []),
                    ),

                    SizedBox(width: 20.w),

                    GestureDetector(
                      onTap: () => onSelectLayout(
                        "L2B",
                            () => TwoPlayersB(
                            aspectRatio: widget.aspectRatio,
                            navigateToOptionsPage: widget.navigateToOptionsPage,
                            navigateToCountersDialog: widget.navigateToCountersDialog
                        ),
                      ),
                      child: L2B(currentColors: layoutButtonsColors["L2B"] ?? []),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                //4 PLAYERS
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () => onSelectLayout(
                        "L4A",
                            () => FourPlayersA(
                            aspectRatio: widget.aspectRatio,
                            navigateToOptionsPage: widget.navigateToOptionsPage,
                            navigateToCountersDialog: widget.navigateToCountersDialog
                        ),
                      ),
                      child: L4A(currentColors: layoutButtonsColors["L4A"] ?? []),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 80.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 118.w,
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
                  width: 118.w,
                  height: 56.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF67E55C),
                      shape: SmoothRectangleBorder(
                        smoothness: 0.6,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (createChosenLayout != null) {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => createChosenLayout(),
                          ),
                        );
                      }
                    },
                    child: SvgPicture.asset('assets/check.svg'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
