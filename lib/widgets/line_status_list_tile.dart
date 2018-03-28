import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/models/line_status.dart';

class LineStatusListTileWidget extends StatelessWidget {
  LineStatusListTileWidget({
    Key key,
    @required this.lineStatus,
  })
      : super(key: key);

  final LineStatus lineStatus;

  @override
  Widget build(BuildContext context) {
    if (lineStatus.reason != null) {
      return new ListTile(
        isThreeLine: true,
        subtitle: new Text(
          lineStatus.reason,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      return new ListTile(
        title: new Text(lineStatus.statusSeverityDescription),
      );
    }
  }
}
