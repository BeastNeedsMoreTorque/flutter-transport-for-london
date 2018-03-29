import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchIconButtonWidget extends StatelessWidget {
  SearchIconButtonWidget({Key key, @required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new IconButton(icon: new Icon(Icons.search), onPressed: onPressed);
  }
}
