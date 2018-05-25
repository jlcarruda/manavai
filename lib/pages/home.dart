import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manavai/components/fab.dart';
import 'package:manavai/components/fab/flutter_radial_menu.dart';

import 'package:manavai/config.dart';
import 'package:manavai/utils/menu_item_button.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  GlobalKey<RadialMenuState> _menuKey = new GlobalKey<RadialMenuState>();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new BottomAppBar(
        hasNotch: false,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: () {})
          ],
        ),
      ),
      body: new Center(
//
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new MVFloatingActionButton(
        onPressed: _incrementCounter,
        icon: new Icon(Icons.add),
        menuButtons: <MenuItemButton>[
          new MenuItemButton(icon: new Icon(Icons.share), onPressed: (){print('BUTTON PRESSED');}),
          new MenuItemButton(icon: new Icon(Icons.share), onPressed: (){print('BUTTON PRESSED');}),
          new MenuItemButton(icon: new Icon(Icons.share), onPressed: (){print('BUTTON PRESSED');})
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }


}