import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'items.dart';
import 'options_components/options_dialog.dart';
import 'layouts/4_players_A.dart';
import 'layouts/2_players.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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


  void navigateToOptionsDialog(
      BuildContext context,
      List<Item> items,
      List<Item> defaultItems,
      ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OptionsDialog(
          playersList: items,
          defaultPlayersList: defaultItems,
          onResetComplete: () {
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
      theme: ThemeData(fontFamily: 'K2D'),
      home: Builder(
        builder: (context) {
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;
          double aspectRatio = (screenWidth / 2) / (screenHeight / 2);
          return FourPlayersA(
            aspectRatio: aspectRatio,
            navigateToOptionsDialog: navigateToOptionsDialog,
          );
        },
      ),
    );
  }
}
