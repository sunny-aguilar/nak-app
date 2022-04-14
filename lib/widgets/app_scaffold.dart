import 'package:flutter/material.dart';
import 'drawer.dart';

class AppScaffold extends StatelessWidget {
  final title;
  final body;
  const AppScaffold({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDrawer(
      title: title,
      body: body,
    );
  }
}
