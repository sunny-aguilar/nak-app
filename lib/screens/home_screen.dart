import 'package:flutter/material.dart';
import 'package:nak_app/widgets/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  final title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title,
      body: home(),
    );
  }
}

Widget home() {
  return const Text("Home Body");
}
