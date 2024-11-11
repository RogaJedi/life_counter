import 'package:flutter/material.dart';
import '../items.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ResetGameDialog extends StatefulWidget {
  final List<Item> playersList;
  final List<Item> defaultPlayersList;
  final Function() onResetComplete;

  const ResetGameDialog({
    super.key,
    required this.playersList,
    required this.defaultPlayersList,
    required this.onResetComplete,
  });

  @override
  _ResetGameDialogState createState() => _ResetGameDialogState();
}

class _ResetGameDialogState extends State<ResetGameDialog> {

  void resetPlayer (int index) {
    setState(() {
      widget.playersList[index].colorHex = widget.defaultPlayersList[index].colorHex;
      widget.playersList[index].counter = widget.defaultPlayersList[index].counter;
      widget.playersList[index].playerCounters.clear();
      widget.playersList[index].counterButtonStates = {};
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xff1e1e1e),
      content: SizedBox(
        width: 300.w,
        height: 217.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Are you sure?",
                style: TextStyle(
                  fontSize: 35.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 45.h),
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
                        for (var i = 0; i < widget.playersList.length; i++) {
                          resetPlayer(i);
                        }
                        widget.onResetComplete();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset('assets/check.svg'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
