import 'package:flutter/material.dart';
import 'option_button.dart';

class ResetGameDialog extends StatelessWidget {

  const ResetGameDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: const Text("Reset game"),
      content: SizedBox(
        width: screenWidth * 0.6,
        height: screenHeight * 0.4,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Are you sure?",
                style: TextStyle(
                  fontSize: (screenWidth / screenHeight) * 55,
                  color: Color(0xff504bff),
                ),
              ),
              const SizedBox(height: 8),
              OptionsButton(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  textSizeScale: 55,
                  text: "Yes",
                  onPressed: () {
                    print("yes");
                  }
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
              color: Color(0xff504bff),
            ),
          ),
        ),
      ],
    );
  }
}
