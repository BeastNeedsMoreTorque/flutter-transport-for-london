import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  TextDivider(
    this.data, {
    Key key,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            child: new Text(
              data,
              style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: new EdgeInsets.symmetric(vertical: 16.0),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      decoration: new BoxDecoration(
        color: Theme.of(context).dividerColor,
      ),
      key: key,
    );
  }
}
