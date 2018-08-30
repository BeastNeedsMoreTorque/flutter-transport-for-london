import 'package:flutter/material.dart';
import 'package:transport_for_london/models/line.dart';

class LineListTile extends ListTile {
  LineListTile(
    Line line, {
    Key key,
    VoidCallback onTap,
  }) : super(
          key: key,
          onTap: onTap,
          title: new Text(line.name),
        );
}
