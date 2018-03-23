import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/models/stop_point.dart';

class StopPointListTileWidget extends StatelessWidget {
  StopPointListTileWidget({
    Key key,
    @required this.stopPoint,
    this.onTap,
  })
      : super(key: key);

  final StopPoint stopPoint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: onTap,
      subtitle: new Text(
        stopPoint.lines
            .where((line) => !line.name.contains(new RegExp('[0-9]')))
            .map((line) => line.name)
            .join(', '),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      title: new Text(
        stopPoint.commonName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
