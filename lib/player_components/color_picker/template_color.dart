import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      height: 90.h,
      width: 60.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Center(
        child: Container(
          height: 80.h,
          width: 50.w,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

}