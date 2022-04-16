import 'package:flutter/material.dart';
import 'package:nak_app/widgets/app_scaffold.dart';
import '';

class ChaptersScreen extends StatelessWidget {
  final String title;
  const ChaptersScreen({Key? key, required this.title}) : super(key: key);

  static const route = '/chapters';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title,
      bottomAppBar: false,
      body: chaptersScreen(context),
    );
  }
}

Widget chaptersScreen(BuildContext context) {
  final List<String> items;
  items = List<String>.generate(20, (i) => 'Chapter $i');

  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(items[index]),
      );
    },
  );
}
