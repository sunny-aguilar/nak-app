import 'package:flutter/material.dart';
import 'package:nak_app/models/palette.dart';

class AppDrawer extends StatelessWidget {
  final title;
  final body;
  const AppDrawer({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: drawer(context),
        appBar: AppBar(title: title),
        body: body,
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
