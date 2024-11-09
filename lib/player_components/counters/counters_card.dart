import 'package:flutter/material.dart';
import '../../items.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountersCard extends StatelessWidget {
  final Item player;
  final int index;
  final double aspectRatio;

  const CountersCard({
    super.key,
    required this.player,
    required this.index,
    required this.aspectRatio,
  });

  final double mult = 40;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double mult = 0.03;

    return SizedBox(
      child: Card(
        color: Color(0xff353535),
        shape: SmoothRectangleBorder(
          smoothness: 0.6,
          borderRadius:
          BorderRadius.circular(40),
          side: BorderSide(color: Colors.white, width: 1.25),
        ),
        elevation: 0,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: 90 * 3.14159 / 180,
                child: Text(
                  "–",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: aspectRatio * 70,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              Transform.rotate(
                angle: 90 * 3.14159 / 180,
                child: SvgPicture.asset(
                    player.playerCounters[index].counter_icon,
                  width: screenWidth * 0.07,
                ),
              ),
              SizedBox(width: screenWidth * 0.015),
              Transform.rotate(
                angle: 90 * 3.14159 / 180,
                child: SizedBox(
                  width: screenWidth * 0.055,
                  height: screenWidth * 0.09,
                  child: Center(
                    child: Text(
                      player.playerCounters[index].counter_amount.toString(),
                      style: TextStyle(
                        fontSize: aspectRatio * 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Transform.rotate(
                angle: 90 * 3.14159 / 180,
                child: Text(
                  "+",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: aspectRatio * 60,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
