import 'package:flutter/material.dart';

class OptionsButton extends StatelessWidget {
  final double aspectRatio;
  final double textSizeScale;
  final String text;
  final Color buttonColor;
  final VoidCallback onPressed;

  const OptionsButton({
    super.key,
    required this.aspectRatio,
    required this.textSizeScale,
    required this.text,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: aspectRatio * 0.5,
      width: aspectRatio,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: TextStyle(
              fontSize: aspectRatio * textSizeScale,
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
