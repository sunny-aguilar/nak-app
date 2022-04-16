import 'package:flutter/material.dart';

class NAKAppBar extends StatelessWidget {
  final String title;
  final bool backButton;
  const NAKAppBar({
    Key? key,
    required this.title,
    required this.backButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (backButton == true) {
      return AppBar(
        leading:
            (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
        title: Text(title),
      );
    } else {
      return AppBar(
        title: Text(title),
      );
    }
  }
}

// Widget getAppBar() {}
