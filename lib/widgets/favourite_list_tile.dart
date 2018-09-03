import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/models/favourite.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';

class FavouriteListTile extends ListTile {
  FavouriteListTile(
    Favourite favourite, {
    Key key,
    VoidCallback onTap,
  }) : super(
          key: key,
          onTap: onTap,
          title: SingleLineText(favourite.name),
        );
}
