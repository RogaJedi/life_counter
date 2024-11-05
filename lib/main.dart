import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'items.dart';
import 'options_components/options_page.dart';
import 'player_components/counters/counters_dialog.dart';
import 'layouts/4_players_A.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'layouts/2_players.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  void changePlayerColor(Item newItem, List<Item> items) {
    String newColor = newItem.colorHex;
    int playerId = newItem.id;
    setState(() {
      items[playerId].colorHex = newColor;
    });
  }


  void navigateToOptionsPage(
      BuildContext context,
      List<Item> items,
      List<Item> defaultItems,
      double aspectRatio,
      ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OptionsPage(
            playersList: items,
            defaultPlayersList: defaultItems,
            onResetComplete: () {
              setState(() {});
            },
            aspectRatio: aspectRatio
        ),
      ),
    );
  }


  void navigateToCountersDialog(
      BuildContext context,
      Item player,
      double aspectRatio
      ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CountersDialog(
          player: player,
          aspectRatio: aspectRatio,
          onSelectedCounters: () {
            setState(() {});
          },
        ); // Your modified widget
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Bebas'),
      home: Builder(
        builder: (context) {
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;
          double aspectRatio = (screenWidth / 2) / (screenHeight / 2);
          return FourPlayersA(
            aspectRatio: aspectRatio,
            navigateToOptionsPage: navigateToOptionsPage,
            navigateToCountersDialog: navigateToCountersDialog,
          );
        },
      ),
    );
  }
}
