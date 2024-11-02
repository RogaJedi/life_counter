import 'package:flutter/material.dart';

class CountersButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double screenHeight;
  final Map<String, bool> buttonStates;
  final VoidCallback onTap;

  const CountersButton({
    super.key,
    required this.icon,
    required this.label,
    required this.screenHeight,
    required this.buttonStates,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    buttonStates.putIfAbsent(label, () => false);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.all(screenHeight * 0.02),
          decoration: BoxDecoration(
            color: buttonStates[label]! ? const Color(0xfffaff4b) : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: screenHeight * 0.04,
            color: const Color(0xff504bff),
          ),
        ),
      ),
    );
  }

}