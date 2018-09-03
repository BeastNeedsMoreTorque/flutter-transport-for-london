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
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              data,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 16.0),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
      ),
      key: key,
    );
  }
}
