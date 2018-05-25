import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:manavai/config.dart';
import 'package:manavai/utils/menu_item_button.dart';

const double _radiansPerDegree = math.pi / 180;
final double _startAngle = -180.0 * _radiansPerDegree;

typedef double ItemAngleCalculator(int index);

class MVFloatingActionButton extends StatefulWidget {

  MVFloatingActionButton({this.onPressed, this.animController, this.menuButtons, @required this.icon, this.isRadial = false, this.menuIcons});

  final VoidCallback onPressed;
  final List<MenuItemButton> menuButtons;
  final AnimationController animController;
  final bool isRadial;
  final Icon icon;
  final List<Icon> menuIcons;

  @override
  State<StatefulWidget> createState() => new MVFloatingActionButtonState();
}

class MVFloatingActionButtonState extends State<MVFloatingActionButton> with TickerProviderStateMixin {

  AnimationController _controller;

  List<MenuItemButton> _menuButtons;
  List<IconData> icons = const [ Icons.sms, Icons.mail, Icons.phone ];

  double calculateItemAngle(int index) {
    double _itemSpacing = 180.0 / widget.menuButtons.length;
    return _startAngle * index * _itemSpacing * _radiansPerDegree;
  }

  VoidCallback superOnPressed() {
    return (() {
      if (_controller.isDismissed) {
        _controller.forward();
      } else {
        _controller.reverse();
      }});
  }

  @override
  void initState() {
    super.initState();
//
//    // Create animation controller if it wasn't passed to the class
    if (widget.animController == null) {
      _controller = new AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this
      );
      _controller.addListener(() {setState(() {});});
    }

    if (widget.menuButtons != null) {
      _menuButtons = widget.menuButtons;
    }
//
//    // If no menu buttons, create default
//    if (widget.menuButtons == null) {
//      _menuButtons.add(new Container(
//        width: kFABMenuItemWidth,
//        height: kFABMenuItemHeight,
//        alignment: FractionalOffset.topCenter,
//        child: new ScaleTransition(
//          scale: new CurvedAnimation(
//            parent: _controller,
//            curve: new Interval(0.0, 1.0, curve: Curves.easeOut),
//          ),
//          child: new FloatingActionButton(
//            onPressed: () {},
//            mini: true,
//          ),
//        ),
//      ));
//    } else {
//      _menuButtons = widget.menuButtons;
//    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = _buildMenuButtons();

    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: new List.generate(children.length, (int index) {
        Widget child = new Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: new ScaleTransition(
            scale: new CurvedAnimation(
              parent: _controller,
              curve: new Interval(
                0.0,
                1.0 - index / children.length / 2.0,
                curve: Curves.easeOut
              )
            ),
            child: new FloatingActionButton(
              mini: true,
              onPressed: (widget.menuButtons != null) ? widget.menuButtons[index].onPressed : () {},
              child: (widget.menuButtons != null) ? widget.menuButtons[index].icon : new Icon(Icons.ac_unit)
            )
          )
        );

        return child;
      }).toList()..add(
        new FloatingActionButton(
          onPressed: () {
            if (_controller.isDismissed) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          },
          child: new AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return new Transform(
                transform: new Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                alignment: FractionalOffset.center,
                child: new Icon(_controller.isDismissed ? Icons.add : Icons.close)
              );
            }
          )
        )
      )
    );
//    return new Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        (widget.isRadial) ? new CustomMultiChildLayout(
//          delegate: new _MVFloatingActionButtonMenuLayout(
//
//              calculator: calculateItemAngle,
//              itemCount: _menuButtons.length,
//              radius: 40.0,
//          ),
//          children : children,
//          ) : new Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            mainAxisSize: MainAxisSize.min,
//            children: children,
//          ),
//        new FloatingActionButton(
//          onPressed: (widget.onPressed != null) ? widget.onPressed : superOnPressed(),
//          tooltip: 'tooltip',
//          child: (widget.onPressed != null) ? null : new AnimatedBuilder(
//            animation: _controller,
//            builder: (BuildContext context, Widget child) {
//              return new Transform(
//                transform: new Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
//                alignment: FractionalOffset.center,
//                child: new Icon(_controller.isDismissed ? widget.icon : Icons.close),
//              );
//            },
//          ),
//        )
//      ]
//    );
  }

  List<Widget> _buildMenuButtons() {

    if (widget.menuButtons != null) {

      return new List.generate(widget.menuButtons.length, (int index) {
          Widget child = new LayoutId(
            id: 'menu_button$index',
            child: new IconButton(
              icon: widget.menuButtons[index].icon,
              onPressed: widget.menuButtons[index].onPressed,
            )
          );
          return child;
        }).toList();
    }

    return <Widget>[
      new Column()
    ];
  }

}
//
//class _MVFloatingActionButtonMenuLayout extends MultiChildLayoutDelegate {
//
//  final int itemCount;
//  final double radius;
//  final ItemAngleCalculator calculator;
//  final double bottomPadding;
//
//  _MVFloatingActionButtonMenuLayout({
//    @required this.itemCount,
//    @required this.radius,
//    @required this.calculator,
//    this.bottomPadding = 20.0
//  });
//
//  Offset center;
//  @override
//  void performLayout(Size size) {
//    center = new Offset(size.width / 2, size.height / 2);
//    for (int i = 0 ; i < itemCount ; i++) {
//      final String itemId = 'menu_button$i';
//      if (hasChild(itemId)) {
//        final Size buttonSize = layoutChild(itemId, new BoxConstraints.loose(size));
//
//        final double itemAngle = calculator(i);
//
//        positionChild(
//          itemId,
//          new Offset((center.dx - buttonSize.width/2) * math.cos(itemAngle), center.dy - buttonSize.height/2) * math.sin(itemAngle)
//        );
//      }
//    }
//  }
//
//  @override
//  bool shouldRelayout(_MVFloatingActionButtonMenuLayout oldDelegate) =>
//      itemCount != oldDelegate.itemCount ||
//      radius != oldDelegate.radius ||
//      calculator != oldDelegate.calculator;
//}