import 'package:flutter/material.dart';
import 'package:transport_for_london/models/line.dart';

class LineListTile extends ListTile {
  LineListTile(
    Line line, {
    VoidCallback onTap,
  }) : super(
          onTap: onTap,
          title: new Text(line.name),
        );
}
