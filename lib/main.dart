import 'package:flutter/material.dart';
import 'models/palette.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NAK',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primarySwatch: Palette.nakRed,
      ),
      home: const MyHomePage(title: 'NAK'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, this.title = 'NAK'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Child text in column in body',
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNav(),
    );
  }
}

Widget bottomNav() {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
        backgroundColor: Palette.nakRed,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.policy),
        label: "Resources",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.email),
        label: "Contact",
      ),
    ],
  );
}
