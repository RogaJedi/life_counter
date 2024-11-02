import 'package:flutter/material.dart';

class CountersButton extends StatelessWidget {
  final dynamic icon;
  final String label;
  final double screenHeight;
  final Map<String, bool> buttonStates;
  final VoidCallback onTap;

  const CountersButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.screenHeight,
    required this.buttonStates,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buttonStates.putIfAbsent(label, () => false);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.all(screenHeight * 0.02),
          decoration: BoxDecoration(
            color: buttonStates[label]! ? const Color(0xff676767) : Color(0xff353535),

            borderRadius: BorderRadius.circular(8),
          ),
          child: _buildIcon()
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (icon is IconData) {
      return Icon(
        icon as IconData,
        size: screenHeight * 0.04,
        color: const Color(0xff504bff),
      );
    } else if (icon is Widget) {
      return SizedBox(
        height: screenHeight * 0.04,
        width: screenHeight * 0.04,
        child: icon as Widget,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
