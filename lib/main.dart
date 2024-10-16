import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'layouts/4_players_A.dart';

//TODO: make it possible to save user's preferred layout and life amount.

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = (screenWidth / 2) / (screenHeight / 2);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'K2D'),
      home: FourPlayersA(aspectRatio: aspectRatio),
    );
  }
}
