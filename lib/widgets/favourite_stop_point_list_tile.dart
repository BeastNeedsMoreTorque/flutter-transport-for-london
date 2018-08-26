import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';

class FavouriteStopPointListTile extends ListTile {
  FavouriteStopPointListTile(
    StopPoint stopPoint,
    Icon icon, {
    Key key,
    VoidCallback onTap,
  }) : super(
          key: key,
          leading: icon,
          onTap: onTap,
          title: new SingleLineText(stopPoint?.commonName ?? 'Unknown'),
        );
}
