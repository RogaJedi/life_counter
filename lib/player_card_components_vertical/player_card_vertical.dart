import 'package:flutter/material.dart';
import '../items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerCardVertical extends StatelessWidget {
  final Item player;

  const PlayerCardVertical({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      color: player.colorHex,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: 180 * 3.14159 / 180,
              child: Text(
                "+",
                style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.white,
                ),
              ),
            ),
            Transform.rotate(
              angle: 180 * 3.14159 / 180,
              child: SizedBox(
                width: 200.h,
                height: 200.h,
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
              angle: 180 * 3.14159 / 180,
              child: Text(
                "-",
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