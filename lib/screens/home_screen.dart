import 'package:flutter/material.dart';
import 'package:nak_app/screens/tabs/tabs.dart' as tabs;
import 'package:nak_app/widgets/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title,
      body: homeTabs(),
    );
  }
}

Widget homeTabs() {
  return TabBarView(
    children: <Widget>[
      tabs.homeTab(),
      tabs.resourcesTab(),
      tabs.contactUsTab(),
    ],
  );
}
