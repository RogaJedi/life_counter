import 'package:flutter/material.dart';
import '../items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerCard extends StatelessWidget {
  final Item player;

  const PlayerCard({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {

    String hex = player.colorHex.replaceAll('0x', '');
    int colorInt = int.parse(hex, radix: 16);

    return Card(
      color: Color(colorInt),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: Text(
                "-",
                style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.white,
                ),
              ),
            ),
            Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    player.counter.toString(),
                    style: TextStyle(
                      fontSize: 110.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Transform.rotate(
              angle: 90 * 3.14159 / 180,
              child: Text(
                "+",
                style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}