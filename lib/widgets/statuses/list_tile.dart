import 'package:flutter/material.dart';
import 'package:transport_for_london/models/line_status.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';

class StatusListTile extends ListTile {
  StatusListTile(
    LineStatus status, {
    Key key,
  }) : super(
          isThreeLine: true,
          key: key,
          subtitle: new Text(
            status.reason ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          title: new SingleLineText(
            status.statusSeverityDescription ?? '',
          ),
        );
}
