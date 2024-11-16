import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:smooth_corner/smooth_corner.dart';

class PickColorDialog extends StatelessWidget {
  final Color currentColor;
  final ValueChanged<HSVColor> onChanged;
  final void Function() onPressed;

  const PickColorDialog({
    super.key,
    required this.currentColor,
    required this.onChanged,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    //Color bgColor_A = const Color(0xff393939);
    //Color bgColor_B = const Color(0xff5b5b5b);

    return AlertDialog(
      shape: SmoothRectangleBorder(
        smoothness: 0.6,
        borderRadius:
        BorderRadius.circular(20),
      ),
      title: const Text("Pick a color"),
      //CHANGE!
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child:  SizedBox(
          width: screenWidth * 0.6,
          height: screenHeight * 0.4,
          child: Card(
            //CHANGE!
            color: Colors.white,
            shape: SmoothRectangleBorder(
              smoothness: 0.6,
              borderRadius:
              BorderRadius.circular(10),
            ),
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.05,
                    child: FloatingActionButton(
                      shape: SmoothRectangleBorder(
                        smoothness: 0.6,
                        borderRadius:
                        BorderRadius.circular(40),
                      ),
                      onPressed: null,
                      backgroundColor: currentColor,
                    ),
                  ),
                  const Divider(),
                  Container(
                    //CHANGE!
                    color: Colors.white,
                    child: HSVPicker(
                      color: HSVColor.fromColor(currentColor),
                      onChanged: onChanged,
                    ),
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
            shape: SmoothRectangleBorder(
              smoothness: 0.6,
              borderRadius:
              BorderRadius.circular(10),
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
            shape: SmoothRectangleBorder(
              smoothness: 0.6,
              borderRadius:
              BorderRadius.circular(10),
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
