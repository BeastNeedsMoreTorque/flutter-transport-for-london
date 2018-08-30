import 'package:flutter/material.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';
import 'package:transport_for_london/widgets/stop_points/list_tile.dart';

class ModeStopPointListTile extends StopPointListTile {
  ModeStopPointListTile(
    StopPoint stopPoint, {
    Key key,
    VoidCallback onTap,
  }) : super(
          stopPoint,
          key: key,
          onTap: onTap,
          subtitle: new SingleLineText(stopPoint.stopType),
        );
}
