import 'package:flutter/material.dart';
import 'models/palette.dart';
import 'screens/tabs/tabs.dart' as tabs;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NAK",
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primarySwatch: Palette.nakRed,
      ),
      // home: const MyHomePage(title: 'NAK'),
      home: const HomePage(title: "NAK"),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({Key? key, this.title = "NAK"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Palette.nakRed,
                ),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        "assets/img/nak-emblem.png",
                        height: 100.0,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                          color: Palette.nakWhite,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.holiday_village),
                title: const Text('Chapters'),
                onTap: () {
                  // Update the state of the app.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('Dues'),
                onTap: () {
                  // Update the state of the app.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.groups),
                title: const Text('National Board'),
                onTap: () {
                  // Update the state of the app.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text('NAKstore'),
                onTap: () {
                  // Update the state of the app.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.groups),
                title: const Text('Alumni'),
                onTap: () {
                  // Update the state of the app.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.public),
                title: const Text('Website'),
                onTap: () {
                  // Update the state of the app.
                  Navigator.pop(context);
                },
              ),
            ],
          ),
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
