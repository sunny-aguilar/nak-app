import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nak_app/models/palette.dart';
import 'package:nak_app/widgets/app_scaffold.dart';

class NationalBoardScreen extends StatefulWidget {
  final String title;
  const NationalBoardScreen({Key? key, required this.title}) : super(key: key);

  static const route = "/board";

  @override
  State<NationalBoardScreen> createState() => _NationalBoardScreenState();
}

class _NationalBoardScreenState extends State<NationalBoardScreen> {
  List _boardMembers = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString("assets/json/board_members.json");
    final data = await json.decode(response);
    setState(() {
      _boardMembers = data["board"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.title,
      bottomAppBar: false,
      body: nationalBoardScreen(context, _boardMembers),
    );
  }
}

Widget nationalBoardScreen(BuildContext context, _boardMembers) {
  return ListView.builder(
    itemCount: _boardMembers.length,
    itemBuilder: (context, index) {
      return boardCard(context, index, _boardMembers);
    },
  );
}

Widget boardCard(BuildContext context, int index, _boardMembers) {
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Stack(
          children: <Widget>[
            Image.asset(
              "assets/img/nak-emblem.png",
              height: 300,
              fit: BoxFit.cover,
            ),
          ],
        ),
        Text(
          "${_boardMembers[index]["position"]}",
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Palette.nakBronze,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${_boardMembers[index]["name"]}",
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Palette.nakBronze,
            fontSize: 18,
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonPadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          children: [
            TextButton(
              child: RichText(
                text: const TextSpan(children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.email,
                      size: 18,
                    ),
                  ),
                  TextSpan(
                    text: " Contact",
                  )
                ]),
              ),
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                primary: Palette.nakWhite,
                backgroundColor: Palette.nakBronze,
                shape: const StadiumBorder(),
              ),
            ),
            TextButton(
              child: RichText(
                text: const TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.ios_share,
                        size: 18,
                      ),
                    ),
                    TextSpan(
                      text: " Share",
                    )
                  ],
                ),
              ),
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                primary: Palette.nakWhite,
                backgroundColor: Palette.nakBronze,
                shape: const StadiumBorder(),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
