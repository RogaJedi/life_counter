import 'package:flutter/material.dart';

class OptionsButton extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String text;
  final double textSize;
  final VoidCallback onPressed;

  const OptionsButton({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.text,
    required this.textSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.08, // 8% of the screen height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff504bff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
