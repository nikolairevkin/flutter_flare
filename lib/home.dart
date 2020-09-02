import 'package:flutter/material.dart';
import 'package:flutter_second_project/smart_flare_animation.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SmartFlareAnimation(),
        ));
  }
}
