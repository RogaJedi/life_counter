import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountersButton extends StatefulWidget {
  final dynamic icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const CountersButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  _CountersButtonState createState() => _CountersButtonState();
}

class _CountersButtonState extends State<CountersButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: widget.isActive ? const Color(0xff676767) : Color(0xff353535),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              SizedBox(
                height: 45.h,
                width: 45.h,
                child: widget.icon as Widget,
              ),
              SizedBox(height: 2.h),
              Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
