import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/models/disruption.dart';

class DisruptionListTileWidget extends StatelessWidget {
  DisruptionListTileWidget({
    Key key,
    @required this.disruption,
  })
      : super(key: key);

  final Disruption disruption;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      isThreeLine: true,
      subtitle: new Text(
        disruption.description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
