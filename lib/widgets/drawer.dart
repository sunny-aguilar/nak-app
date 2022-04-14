import 'package:flutter/material.dart';
import 'package:nak_app/models/palette.dart';

class AppDrawer extends StatelessWidget {
  final String title;
  final Widget body;
  const AppDrawer({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: drawer(context),
        appBar: AppBar(title: Text(title)),
        body: body,
        bottomNavigationBar: bottomNavBar(),
      ),
    );
  }
}

Widget drawer(BuildContext context) {
  return Drawer(
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
  );
}

Widget bottomNavBar() {
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
