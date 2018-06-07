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

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          // LOGO
          new Center(
            child: new Text('ManaVai', style: new TextStyle(
              fontSize: 50.0
            )),
          ),

          // TEXT INPUTS
          new Column(

            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextField(
                  decoration: new InputDecoration(
                    hintText: 'Email',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                      
                    )
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextField(
                obscureText: true,
                decoration: new InputDecoration(
                    hintText: 'Password',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.all(new Radius.circular(50.0)),

                    )
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: new RaisedButton(
                  color: Colors.redAccent,
                  child: new Text('Login'),
                  onPressed: (){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new HomePage())
                    );
                  }
                ),
              )
            ],
          )
        ],
      ),
    );


  }

}