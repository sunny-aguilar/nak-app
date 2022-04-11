import 'package:flutter/material.dart';
import 'models/palette.dart';
import 'screens/tabs/tabs.dart' as tabs;

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
      // home: const MyHomePage(title: 'NAK'),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NAK"),
        ),
        bottomNavigationBar: menu(),
        body: TabBarView(
          children: <Widget>[
            tabs.homeTab(),
            tabs.resourcesTab(),
            tabs.contactUsTab(),
          ],
        ),
      ),
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

Widget menu() {
  return Container(
    color: Palette.nakRed,
    child: const TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      // indicatorPadding: EdgeInsets.all(5.0),
      indicatorColor: Palette.nakWhite,
      indicatorWeight: 2,
      tabs: [
        Tab(
          text: "Home",
          icon: Icon(Icons.home),
        ),
        Tab(
          text: "Resources",
          icon: Icon(Icons.policy),
        ),
        Tab(
          text: "Contact Us",
          icon: Icon(Icons.email),
        ),
      ],
    ),
  );
}
