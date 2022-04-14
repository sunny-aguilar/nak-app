import 'package:flutter/material.dart';
import 'package:nak_app/widgets/app_scaffold.dart';

class DuesScreen extends StatelessWidget {
  final String title;
  const DuesScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title,
      body: duesScreen(),
    );
  }
}

Widget duesScreen() {
  return Column(
    children: const <Widget>[
      Text("Dues Screen"),
    ],
  );
}
