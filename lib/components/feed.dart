import 'package:flutter/material.dart';

import 'package:ManaVai/utils/restapi.dart';
import 'package:ManaVai/utils/card_post.dart';

class Feed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FeedState();

}

class FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return _buildFeed();
  }

  @override
  void initState() {

  }

  FutureBuilder<List> _buildFeed() {
    
    return new FutureBuilder<List>(
      future: RestApi.getCardList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          return new ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildCard(snapshot.data[index]);
              }
          );
        } else if (snapshot.hasError) {
          print('ERROR');
          return new Text("${snapshot.error}");
        }

        return new Scaffold(
          body: new Center(
            child: new CircularProgressIndicator(),
          ),
        );
      }
    );
  }

  Card _buildCard(CardPost card) {
    return new Card(
      child: new Material(
        color: Colors.white,
        child: new Column(
            children: <Widget>[
              new ListTile(
                title: new Text(card.name, style: new TextStyle(color: Colors.black)),
                subtitle: new Text(
                    "${card.setName}, ${card.isReprint == true ? "Reprint" : "Carta Nova"}",
                    style: new TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic
                    )
                )
              ),
              new Padding(
                padding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: new Align(
                  alignment: Alignment.centerRight,
                  child: new Text(card.manaCost, style: new TextStyle(
                    color: Colors.black
                  ),),
                ),
              ),
              (card.imageUris != null) ?  new Image.network(
                  card.imageUris['small']
              ) : new Image.asset(
                  'lib/images/placeholder_card.png',
                width: 140.0,
              ),
              new Padding(
                padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: new Text(card.body != null ? card.body : '', style: new TextStyle(color: Colors.black)),
              )
            ]
        ),
      ),
      elevation: 10.0,
    );
  }
}