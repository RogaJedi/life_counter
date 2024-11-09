import 'package:flutter/material.dart';
import '../layouts/2_players_B.dart';
import '../layouts/4_players_A.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {

  final double aspectRatio;
  final Function navigateToOptionsPage;
  final Function navigateToCountersDialog;

  const SettingsPage({
    Key? key,
    required this.aspectRatio,
    required this.navigateToOptionsPage,
    required this.navigateToCountersDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TwoPlayersB(
                      aspectRatio: aspectRatio,
                      navigateToOptionsPage: navigateToOptionsPage,
                      navigateToCountersDialog: navigateToCountersDialog
                  ),
                ),
              ),
              child: Container(
                width: 107.67.w,
                height: 202.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 97.67.w,
                      height: 93.5.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFC34D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Transform.rotate(
                          angle: 90 * 3.14159 / 180,
                          child: Text(
                            "40",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      width: 97.67.w,
                      height: 93.5.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFC34D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Transform.rotate(
                          angle: 90 * 3.14159 / 180,
                          child: Text(
                            "40",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            //FOUR PLAYERS A
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FourPlayersA(
                      aspectRatio: aspectRatio,
                      navigateToOptionsPage: navigateToOptionsPage,
                      navigateToCountersDialog: navigateToCountersDialog
                  ),
                ),
              ),
              child: Container(
                width: 107.67.w,
                height: 202.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 46.33.w,
                          height: 93.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC34D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Transform.rotate(
                              angle: 90 * 3.14159 / 180,
                              child: Text(
                                "40",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Container(
                          width: 46.33.w,
                          height: 93.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC34D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Transform.rotate(
                              angle: 270 * 3.14159 / 180,
                              child: Text(
                                "40",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 46.33.w,
                          height: 93.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC34D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Transform.rotate(
                              angle: 90 * 3.14159 / 180,
                              child: Text(
                                "40",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Container(
                          width: 46.33.w,
                          height: 93.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC34D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Transform.rotate(
                              angle: 270 * 3.14159 / 180,
                              child: Text(
                                "40",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
