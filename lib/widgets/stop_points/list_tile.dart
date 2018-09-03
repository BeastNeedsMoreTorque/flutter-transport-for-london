import 'package:flutter/material.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';

class StopPointListTile extends ListTile {
  StopPointListTile(
    StopPoint stopPoint, {
    Key key,
    VoidCallback onTap,
    Widget subtitle,
  }) : super(
          key: key,
          onTap: onTap,
          subtitle: subtitle,
          title: stopPoint.indicator != null
              ? SingleLineText(
                  '${stopPoint.commonName} - ${stopPoint.indicator}',
                )
              : SingleLineText(
                  stopPoint.commonName,
                ),
        );
}
