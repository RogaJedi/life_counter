import 'package:flutter/material.dart';

class OptionsButton extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final double textSizeScale;
  final String text;
  final VoidCallback onPressed;

  const OptionsButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.textSizeScale,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.08, // 8% of the screen height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff504bff),
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
              fontSize: (screenWidth / screenHeight) * textSizeScale,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
