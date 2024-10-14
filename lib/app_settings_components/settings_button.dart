import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String text;
  final VoidCallback onPressed;

  const SettingsButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.22,
      height: screenHeight * 0.08, // 8% of the screen height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
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
              fontSize: ((screenWidth / 2) / (screenHeight / 2)) * 60,
              color: const Color(0xff504bff),
            ),
          ),
        ),
      ),
    );
  }
}
