import 'package:flutter/material.dart';
import 'models/palette.dart';
import 'screens/home_screen.dart';
import 'screens/chapters_screen.dart';
import 'screens/dues_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String appTitle = "NAK";

    final routes = {
      HomeScreen.route: (context) => const HomeScreen(title: appTitle),
      ChaptersScreen.route: (context) => const ChaptersScreen(
            title: appTitle,
          ),
      DuesScreen.route: (context) => const DuesScreen(title: appTitle),
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.nakRed,
      ),
      routes: routes,
    );
  }
}
