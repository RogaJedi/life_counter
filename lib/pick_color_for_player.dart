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
  late HSVColor hsvColor;

  @override
  void initState() {
    super.initState();
    hsvColor = HSVColor.fromColor(widget.currentColor);
  }

  void changeColor(HSVColor newColor) {
    setState(() => hsvColor = newColor);
    widget.onChanged(newColor);
  }

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
                    onPressed: () {},
                    backgroundColor: hsvColor.toColor(),
                  ),
                  const Divider(),

                  ///---------------------------------
                  HSVPicker(
                    color: hsvColor,
                    onChanged: changeColor,
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
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: widget.onPressed,
          child: const Text("Select"),
        ),
      ],
    );
  }
}