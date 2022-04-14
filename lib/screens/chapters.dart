import 'package:flutter/material.dart';
import 'package:nak_app/widgets/app_scaffold.dart';

class ChaptersScreen extends StatelessWidget {
  final String title;
  const ChaptersScreen({Key? key, required this.title}) : super(key: key);

  static const route = '/chapters';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title,
      bottomAppBar: false,
      body: chaptersScreen(),
    );
  }
}

Widget chaptersScreen() {
  return Column(
    children: const <Widget>[
      Text("Chapters Screen"),
    ],
  );
}
