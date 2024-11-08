import 'package:flutter/material.dart';
import '../layouts/2_players_B.dart';
import '../layouts/4_players_A.dart';

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
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TwoPlayersB(
                        aspectRatio: aspectRatio,
                        navigateToOptionsPage: navigateToOptionsPage,
                        navigateToCountersDialog: navigateToCountersDialog
                    ),
                ),
              ),
              child: Text('2 Players B'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FourPlayersA(
                      aspectRatio: aspectRatio,
                      navigateToOptionsPage: navigateToOptionsPage,
                      navigateToCountersDialog: navigateToCountersDialog
                  ),
                ),
              ),
              child: Text('4 Players A'),
            ),
          ],
        ),
      ),
    );
  }
}
