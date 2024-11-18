import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';

class TemplateColor extends StatelessWidget {
  final Color borderColor;
  final Color mainColor;


  const TemplateColor({
    super.key,
    required this.borderColor,
    required this.mainColor
  });

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      height: 90.h,
      width: 60.w,
      smoothness: 0.6, // Adjust this value to control the smoothness (0.0 to 1.0)
      color: Colors.transparent, // Set the background color if needed
      side: BorderSide(color: borderColor, width: 2),
      borderRadius: BorderRadius.circular(14),
      child: Center(
        child: SmoothContainer(
          height: 80.h,
          width: 50.w,
          smoothness: 0.6,
          color: mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

}