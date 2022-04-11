import 'package:flutter/material.dart';

Widget homeTab() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Spacer(),
      const Text(
        "Welcome to the official website for Nu Alpha Kappa Fraternity, Inc.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, fontFamily: "TrajanPro"),
      ),
      Spacer(),
      Container(
        child: const Text(
          "Welcome to the official website for Nu Alpha Kappa Fraternity, Inc.",
          style: TextStyle(
              fontSize: 24,
              fontFamily: "TrajanPro",
              fontWeight: FontWeight.bold),
        ),
      ),
      Spacer(),
      Container(
        child: const Text(
            "Welcome to the official website for Nu Alpha Kappa Fraternity, Inc."),
      ),
    ],
  );
}

Widget resourcesTab() {
  return Container(
    child: Icon(Icons.home),
  );
}

Widget contactUsTab() {
  return Container(
    child: Icon(Icons.home),
  );
}
