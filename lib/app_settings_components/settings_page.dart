import 'package:flutter/material.dart';
import 'settings_button.dart';
import 'package:raccoon_counter/player_options_components/option_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              "Starting life totals",
              style: TextStyle(
                fontSize: ((screenWidth / 2) / (screenHeight / 2)) * 70,
                color: const Color(0xff504bff),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SettingsButton(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    text: "20",
                    onPressed: () {
                      print("20");
                    },
                ),
                const SizedBox(width: 8),
                SettingsButton(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  text: "30",
                  onPressed: () {
                    print("30");
                  },
                ),
                const SizedBox(width: 8),
                SettingsButton(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  text: "40",
                  onPressed: () {
                    print("40");
                  },
                ),
                const SizedBox(width: 8),
                SettingsButton(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  text: "100",
                  onPressed: () {
                    print("100");
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              "Amount of players",
              style: TextStyle(
                fontSize: ((screenWidth / 2) / (screenHeight / 2)) * 70,
                color: Color(0xff504bff),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SettingsButton(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                text: "2",
                onPressed: () {
                  print("2");
                },
              ),
              const SizedBox(width: 8),
              SettingsButton(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                text: "3",
                onPressed: () {
                  print("3");
                },
              ),
              const SizedBox(width: 8),
              SettingsButton(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                text: "4",
                onPressed: () {
                  print("4");
                },
              ),
              const SizedBox(width: 8),
              SettingsButton(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                text: "5",
                onPressed: () {
                  print("5");
                },
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SettingsButton(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                text: "6",
                onPressed: () {
                  print("6");
                },
              ),
              const SizedBox(width: 8),
              SettingsButton(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                text: "7",
                onPressed: () {
                  print("7");
                },
              ),
              const SizedBox(width: 8),
              SettingsButton(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                text: "8",
                onPressed: () {
                  print("8");
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: OptionsButton(
                screenWidth: screenWidth * 0.8,
                screenHeight: screenHeight,
                textSizeScale: 80,
                text: "Select layout",
                onPressed: () {
                  print("select layout");
                }
            ),
          ),
        ],
      ),
    );
  }
}
