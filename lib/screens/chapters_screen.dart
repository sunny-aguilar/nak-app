import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nak_app/widgets/app_scaffold.dart';
import 'package:nak_app/models/chapters.dart';

class ChaptersScreen extends StatefulWidget {
  final String title;
  const ChaptersScreen({Key? key, required this.title}) : super(key: key);

  static const route = '/chapters';

  @override
  State<ChaptersScreen> createState() => _ChaptersScreenState();
}

class _ChaptersScreenState extends State<ChaptersScreen> {
  List _chapters = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString("assets/json/chapters.json");
    final data = await json.decode(response);
    setState(() {
      _chapters = data["chapters"];
    });
    print(_chapters[0]["name"]);
  }

  @override
  void initState() {
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    // readJson();
    return AppScaffold(
      title: widget.title,
      bottomAppBar: false,
      body: chaptersScreen(context, _chapters),
    );
  }
}

Widget chaptersScreen(BuildContext context, _chapters) {
  return ListView.builder(
    itemCount: _chapters.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          // leading: FlutterLogo(size: 6.0),
          leading: Image.asset(
            "assets/img/chapters/0${index}.png",
            width: 50.0,
          ),
          title: Text(_chapters[index]["name"]),
          subtitle: Text(_chapters[index]["established"]),
        ),
      );
    },
  );
}
