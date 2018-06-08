import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuItemButton extends StatelessWidget{
  final Icon icon;
  final VoidCallback onPressed;

  MenuItemButton({@required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return new Column();
  }

}