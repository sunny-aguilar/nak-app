import 'package:flutter/material.dart';

class ChaptersScreen extends StatelessWidget {
  static const route = 'chapters';
  const ChaptersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Text('Chapters'),
      ],
    );
  }
}
