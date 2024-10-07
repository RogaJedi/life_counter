import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

class PickColorForPlayer extends StatelessWidget {
  final Color currentColor;
  final ValueChanged<HSVColor> onChanged;
  final void Function() onPressed;

  const PickColorForPlayer({
    super.key,
    required this.currentColor,
    required this.onChanged,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: const Text("Pick a color"),
      content: SingleChildScrollView(
        child:  SizedBox(
          width: screenWidth * 0.6,
          height: screenHeight * 0.4,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: null,
                    backgroundColor: currentColor,
                  ),
                  const Divider(),
                  HSVPicker(
                    color: HSVColor.fromColor(currentColor),
                    onChanged: onChanged,
                  ),
                ],
              ),
            ),
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
          onPressed: onPressed,
          child: const Text(
            'Select',
            style: TextStyle(
              color: Color(0xff504bff),
            ),
          ),
        ),
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
