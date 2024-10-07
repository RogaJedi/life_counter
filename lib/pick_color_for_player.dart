import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

class pickColorForPlayer extends StatefulWidget {
  final Color currentColor;
  final HSVColor colorHSV;
  final ValueChanged<HSVColor> onChanged;
  final void Function() onPressed;

  const pickColorForPlayer({
    Key? key,
    required this.currentColor,
    required this.colorHSV,
    required this.onChanged,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<pickColorForPlayer> createState() => _pickColorForPlayerState();
}

class _pickColorForPlayerState extends State<pickColorForPlayer> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("color picker"),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 260,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0.0),
              ),
            ),
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      print("pressed");
                    },
                    backgroundColor: widget.currentColor,
                  ),
                  const Divider(),

                  ///---------------------------------
                  HSVPicker(
                    color: widget.colorHSV,
                    onChanged: widget.onChanged,
                  ),


                  ///---------------------------------
                ],
              ),
            ),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Select'),
          onPressed: widget.onPressed,
        ),

      ],
    );
  }
}