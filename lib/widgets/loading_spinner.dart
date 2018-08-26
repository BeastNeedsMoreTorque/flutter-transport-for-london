import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new CircularProgressIndicator(),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
