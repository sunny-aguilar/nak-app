import 'package:flutter/material.dart';
import 'package:nak_app/models/palette.dart';

class AppDrawer extends StatelessWidget {
  final String title;
  final bool bottomAppBar;
  final Widget body;
  const AppDrawer({
    Key? key,
    required this.title,
    required this.bottomAppBar,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffoldValues = {
      "context": context,
      "title": title,
      "appBar": bottomAppBar,
      "body": body,
    };
    return getScaffold(scaffoldValues);
  }
}

Widget getScaffold(Map scaffoldValues) {
  if (scaffoldValues["appBar"] == true) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: drawer(scaffoldValues["context"]),
        appBar: AppBar(
          title: Text(scaffoldValues["title"]),
        ),
        body: scaffoldValues["body"],
        bottomNavigationBar: bottomNavBar(),
      ),
    );
  } else {
    return Scaffold(
      drawer: drawer(scaffoldValues["context"]),
      appBar: AppBar(
        leading: (ModalRoute.of(scaffoldValues["context"])?.canPop ?? false)
            ? const BackButton()
            : null,
        title: Text(scaffoldValues["title"]),
      ),
      body: scaffoldValues["body"],
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
          child: Row(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/img/nak-emblem.png",
                  height: 100.0,
                ),
              ),
              const Flexible(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Nu Alpha Kappa Fraternity, Inc.",
                    style: TextStyle(
                      color: Palette.nakWhite,
                      fontSize: 20,
                    ),
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
            Navigator.pushNamed(context, "/chapters");
            // Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.attach_money),
          title: const Text('Dues'),
          onTap: () {
            // Update the state of the app.
            Navigator.pushNamed(context, "/dues");
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
