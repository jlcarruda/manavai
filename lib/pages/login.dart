import 'dart:async';
import 'dart:convert';

import 'package:ManaVai/app.dart';
import 'package:ManaVai/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 500)
    );

    _iconAnimation = new CurvedAnimation(
        curve: Curves.easeOut,
        parent: _iconAnimationController
    );

    _iconAnimation.addListener(() => setState((){}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/login_bg.jpg"),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: new FlutterLogo(
                      size: _iconAnimation.value * 100.0
                  ),
                ),
                new Form(
                    child: new Column(
                        children: [
                          new Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                            child: new TextFormField(
                              decoration: new InputDecoration(
                                  hintText: "Email",
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                                  )
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                            child: new TextFormField(
                              decoration: new InputDecoration(
                                  hintText: "Password",
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                                  )
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                          ),
                          new Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                          new MaterialButton(
                            onPressed: (){
                              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new HomePage()));
                            },
                            color: Colors.teal,
                            textColor: Colors.white,
                            splashColor: Colors.redAccent,
                            minWidth: 130.0,
                            child: new Text(
                                "Login"
                            ),
                          )
                        ]
                    )
                )
              ],
            )
          ],
        )
    );


  }

}