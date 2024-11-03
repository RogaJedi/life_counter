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
    return Card(
      color: Color(0xff353535),
      shape: SmoothRectangleBorder(
        smoothness: 0.6,
        borderRadius:
        BorderRadius.circular(60),
        side: BorderSide(color: Colors.white, width: 2),
      ),
      elevation: 0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: Icon(
                Icons.remove,
                size: aspectRatio * 40,
                color: Colors.white,
              ),
            ),
            SizedBox(width: aspectRatio * mult),
            Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: SvgPicture.asset(player.playerCounters[index].counter_icon),
            ),
            SizedBox(width: aspectRatio * mult),
            Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: Center(
                child: Text(
                  player.playerCounters[index].counter_amount.toString(),
                  style: TextStyle(
                    fontSize: aspectRatio * 70,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: aspectRatio * mult),
            Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: Icon(
                Icons.add,
                size: aspectRatio * 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
