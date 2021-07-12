import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyhomePage extends StatelessWidget {
  final String title;
  MyhomePage({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        title: Text(title),
      ),
      body: new Center(
        child: new Container(
          color: Theme.of(context).accentColor,
          child: new Text('带有背景色的文本组件',
              style: Theme.of(context).textTheme.bodyText1),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.black),
        child: new FloatingActionButton(
          onPressed: () {
            const url = 'https://www.github.com';
            launch(url);
          },
          child: new Icon(Icons.computer),
        ),
      ),
    );
  }
}
