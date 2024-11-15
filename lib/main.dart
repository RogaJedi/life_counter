import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'items.dart';
import 'options_components/options_page.dart';
import 'player_components/counters_dialog.dart';
import 'player_components/counters_dialog_horizontal.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'layouts/4_players_A.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            aspectRatio: aspectRatio,
            navigateToOptionsPage: navigateToOptionsPage,
            navigateToCountersDialog: navigateToCountersDialog,
        ),
      ),
    );
  }


  void navigateToCountersDialog(
      BuildContext context,
      Item player,
      double aspectRatio,
      int mode,
      int turn,
      ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (mode == 1) {
          return Transform.rotate(
            angle: turn * 3.14159 / 180,
            child: CountersDialog(
              player: player,
              onSelectedCounters: () {
                setState(() {});
              },
            ),
          );
        } else {
          return Transform.rotate(
            angle: turn * 3.14159 / 180,
            child: CountersDialogHorizontal(
              player: player,
              onSelectedCounters: () {
                setState(() {});
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(369, 780), // Your design draft size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
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
      },
    );
  }
}
