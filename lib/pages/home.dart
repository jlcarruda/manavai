import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ManaVai/components/fab.dart';
import 'package:ManaVai/components/fab/flutter_radial_menu.dart';

import 'package:ManaVai/utils/menu_item_button.dart';
import 'package:ManaVai/components/feed.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Feed()
      ),
    );
  }

}