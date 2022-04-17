import 'package:flutter/material.dart';
import 'package:nak_app/models/palette.dart';
import 'resources.dart';

Widget homeTab() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(
        height: 50.0,
      ),
      Image.asset(
        "assets/img/nak-letters.png",
      ),
      const SizedBox(
        height: 30.0,
      ),
      const Text(
        "Welcome to the official App for Nu Alpha Kappa Fraternity, Inc.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Palette.nakRed,
          fontSize: 24,
          fontFamily: "TrajanPro",
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
    ],
  );
}

Widget resourcesTab() {
  // return Column(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: const <Widget>[
  //     Text(
  //       "Resources",
  //       style: TextStyle(
  //         fontSize: 24,
  //       ),
  //     ),
  //   ],
  // );
  return const Resources();
}

Widget contactUsTab() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const <Widget>[
      Text(
        "Contact Form",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    ],
  );
}
