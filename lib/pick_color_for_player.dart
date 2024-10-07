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
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('Select'),
        ),
      ],
    );
  }
}
