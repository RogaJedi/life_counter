import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';

class L2A extends StatelessWidget {
  final List<Color> currentColors;

  const L2A({super.key,
    required this.currentColors

  });

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      width: 107.67.w,
      height: 202.h,
      smoothness: 0.6,
      side: BorderSide(color: currentColors[0], width: 2),
      borderRadius: BorderRadius.circular(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmoothContainer(
            width: 97.67.w,
            height: 93.5.h,
            smoothness: 0.6,
            color: currentColors[1],
            borderRadius: BorderRadius.circular(10),
            child: Center(
              child: Transform.rotate(
                angle: 180 * 3.14159 / 180,
                child: Text(
                  "40",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          SmoothContainer(
            width: 97.67.w,
            height: 93.5.h,
            smoothness: 0.6,
            color: currentColors[1],
            borderRadius: BorderRadius.circular(10),
            child: Center(
              child: Text(
                "40",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}