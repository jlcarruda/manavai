import 'dart:async';

import 'package:flutter/material.dart';

class TransitionButton extends StatefulWidget {
  TransitionButton({this.routeToGoName, this.label, this.color, this.labelColor, this.routeToGo});
  String routeToGoName;
  Widget routeToGo;
  String label;
  Color color;
  Color labelColor;

  @override
  _TransitionButtonState createState() => new _TransitionButtonState();
}

class _TransitionButtonState extends State<TransitionButton> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation squeezeAnimation;
  Animation zoomOutAnimation;

  /**
   * Delegates the child for the conditional of the build function
   */
  Widget _childDelegator () {
    return squeezeAnimation.value > 75.0 ? new Text(
      widget.label != null ? widget.label : "Label",
      style: new TextStyle(
          color: (widget.labelColor != null ? widget.labelColor : Colors.white),
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3
      ),
    ) : (zoomOutAnimation.value < 300.0 ? new CircularProgressIndicator(
      value: null,
      strokeWidth: 1.0,
      valueColor: new AlwaysStoppedAnimation<Color>(
          Colors.white
      ),
    ) : null);
  }

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: new Duration(seconds:1),
        vsync: this
    );

    squeezeAnimation = new Tween(
        begin: 320.0,
        end: 70.0
    ).animate(new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.0, 0.250)
    ));

    zoomOutAnimation = new Tween(
        begin: 70.0,
        end: 1000.0
    ).animate(new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.550, 0.900, curve: Curves.bounceOut)
    ));
  }

  @override
  Widget build(BuildContext context) {
    squeezeAnimation.addListener(() => setState(() {}));
    zoomOutAnimation.addListener(() => setState(() {
      if (_controller.isCompleted) {
        Navigator.pushNamed(context, widget.routeToGoName);
//        if (widget.routeToGo != null) {
//
//          Navigator.pushReplacement(context, new ));
//        }
      }
    }));
    return new Padding(
      padding: zoomOutAnimation.value == 70 ? const EdgeInsets.only(
          bottom: 50.0
      ) : const EdgeInsets.only(
          top: 0.0, bottom: 0.0
      ),
      child: new InkWell(
          onTap: () {
            _playAnimation();
          },
          child: new Hero(
              tag: 'fade',
              // flex: 100,
              child: new Container(
                  width: zoomOutAnimation.value == 70 ? squeezeAnimation.value : zoomOutAnimation.value,
                  height: zoomOutAnimation.value == 70 ? 60.0 : zoomOutAnimation.value,
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                      color: (widget.color != null ? widget.color : Colors.redAccent),
                      borderRadius: new BorderRadius.all((zoomOutAnimation.value == 70 ? const Radius.circular(30.0) : const Radius.circular(0.0)))
                  ),
                  child: _childDelegator()
              )
          )
      ),
    );
  }


  Future<Null> _playAnimation() async {
    try {
      await _controller.forward();
      // await _controller.reverse();
    }
    on TickerCanceled {}
  }
}
