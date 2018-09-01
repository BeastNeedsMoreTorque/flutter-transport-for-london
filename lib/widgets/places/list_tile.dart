import 'package:flutter/material.dart';
import 'package:transport_for_london/models/place.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';

class PlaceListTile extends ListTile {
  PlaceListTile(
    Place place, {
    Key key,
    VoidCallback onTap,
    Widget trailing,
  }) : super(
          key: key,
          onTap: onTap,
          title: new SingleLineText(place.commonName),
          trailing: trailing,
        );
}
