import 'package:flutter/material.dart';
import 'package:nak_app/widgets/splash_screen.dart';

class ContactFormTab extends StatefulWidget {
  const ContactFormTab({Key? key}) : super(key: key);

  @override
  State<ContactFormTab> createState() => _ContactFormTabState();
}

class _ContactFormTabState extends State<ContactFormTab> {
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
