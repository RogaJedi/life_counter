import 'package:flutter/material.dart';
import 'package:raccoon_counter/counters_icons_icons.dart';

class CountersDialog extends StatefulWidget {
  const CountersDialog({
    super.key,
  });

  @override
  _CountersDialogState createState() => _CountersDialogState();
}

class _CountersDialogState extends State<CountersDialog> {
  Map<String, bool> buttonStates = {};

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: const Text("Add Counters"),
      content: SizedBox(
        width: screenWidth * 0.6,
        height: screenHeight * 0.4,
        child: Center(
          child: GridView.count(
            crossAxisCount: 3, // Adjust this value to change the number of columns
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              _buildIconButton(context, CountersIcons.circle, "player A", screenHeight),
              _buildIconButton(context, CountersIcons.circle, "player B", screenHeight),
              _buildIconButton(context, CountersIcons.circle, "player C", screenHeight),
              _buildIconButton(context, CountersIcons.sun, "white", screenHeight),
              _buildIconButton(context, CountersIcons.tint, "blue", screenHeight),
              _buildIconButton(context, CountersIcons.skull, "black", screenHeight),
              _buildIconButton(context, CountersIcons.fire_alt, "red", screenHeight),
              _buildIconButton(context, CountersIcons.tree, "green", screenHeight),
              _buildIconButton(context, CountersIcons.vial, "poison", screenHeight),
              _buildIconButton(context, CountersIcons.graduation_cap, "experience", screenHeight),
              _buildIconButton(context, CountersIcons.radiation, "radiation", screenHeight),
              _buildIconButton(context, CountersIcons.clock, "time", screenHeight),



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

  Widget _buildIconButton(BuildContext context, IconData icon, String label, double screenHeight) {
    // Initialize the state for this button if it doesn't exist
    buttonStates.putIfAbsent(label, () => false);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            buttonStates[label]! ? Color(0xff504bff) : Colors.white,
          ),
          padding: WidgetStateProperty.all(EdgeInsets.all(screenHeight * 0.02)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
        ),
        onPressed: () {
          setState(() {
            // Toggle the button state
            buttonStates[label] = !buttonStates[label]!;
          });
          print(label);
        },
        icon: Icon(
          icon,
          size: screenHeight * 0.04,
          color: buttonStates[label]! ? Colors.white : Color(0xff504bff),
        ),
      ),
    );
  }

}
