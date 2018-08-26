import 'package:flutter/material.dart';
import 'package:transport_for_london/models/stop_point.dart';

class StopPointListTile extends ListTile {
  StopPointListTile(
    StopPoint stopPoint, {
    VoidCallback onTap,
    Widget subtitle,
  }) : super(
          onTap: onTap,
          subtitle: subtitle,
          title: stopPoint.indicator != null
              ? new Text('${stopPoint.commonName} - ${stopPoint.indicator}')
              : new Text(stopPoint.commonName),
        );
}
