import 'package:ManaVai/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ManaVai/components/fab.dart';

import 'package:ManaVai/utils/menu_item_button.dart';
import 'package:ManaVai/pages/feed.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new DefaultTabController(
          length: 3,
          child: new Scaffold(
            bottomNavigationBar: new Material(
              color: kMVBottomAppBarDark,
              child: new TabBar(
                tabs: <Widget>[
                  new Tab(icon: new Icon(Icons.details)),
                  new Tab(icon: new Icon(Icons.account_circle)),
                  new Tab(icon: new Icon(Icons.apps))
                ],
              ),
            ),
            body: new TabBarView(
                children: <Widget>[
                  new Feed(),
                  new Feed(),
                  new Feed(),
                ]
            ),
            floatingActionButton: new MVFloatingActionButton(
              onPressed: (){},
              icon: new Icon(Icons.add, color: Colors.white),
              menuButtons: <MenuItemButton>[
                new MenuItemButton(icon: new Icon(Icons.share, color: Colors.white), onPressed: (){}),
                new MenuItemButton(icon: new Icon(Icons.share, color: Colors.white), onPressed: (){}),
                new MenuItemButton(icon: new Icon(Icons.share, color: Colors.white), onPressed: (){})
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          )
      ),
    );
  }

}