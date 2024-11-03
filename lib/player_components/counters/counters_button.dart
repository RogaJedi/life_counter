import 'package:flutter/material.dart';

class CountersButton extends StatelessWidget {
  final dynamic icon;
  final String label;
  final double aspectRatio;
  final Map<String, bool> buttonStates;
  final VoidCallback onTap;

  const CountersButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.aspectRatio,
    required this.buttonStates,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//TODO: FIX BUTTONS PLEASE
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: buttonStates[label] == true ? const Color(0xff676767) : Color(0xff353535),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              SizedBox(
                height: aspectRatio * 100,
                width: aspectRatio * 100,
                child: icon as Widget,
              ),
              SizedBox(height: aspectRatio * 7),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: aspectRatio * 30,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*
  Widget _buildIcon() {
    if (icon is IconData) {
      return Icon(
        icon as IconData,
        size: aspectRatio * 100,
        color: const Color(0xff504bff),
      );
    } else if (icon is Widget) {
      return SizedBox(
        height: aspectRatio * 100,
        width: aspectRatio * 100,
        child: icon as Widget,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

   */
}
