import 'package:flutter/material.dart';
import 'package:hold_down_button/hold_down_button.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CustomButton extends StatelessWidget {
  final double borderRad;
  final VoidCallback onTap;
  final VoidCallback onLongTap;

  const CustomButton({
    super.key,
    required this.borderRad,
    required this.onTap,
    required this.onLongTap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: AspectRatio(
          aspectRatio: 1,
          child: HoldDownButton(
            onHoldDown: onLongTap,
            longWait: const Duration(milliseconds: 750),
            middleWait: const Duration(milliseconds: 750),
            minWait: const Duration(milliseconds: 750),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  elevation: 0,
                  side: BorderSide.none,

                  shape: SmoothRectangleBorder(
                    smoothness: 0.6,
                    borderRadius:
                    BorderRadius.circular(borderRad),
                  )
              ),
              onPressed: onTap,
              child: const FittedBox(
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}