import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/tfl_colors.dart';

class LineListTileWidget extends StatelessWidget {
  LineListTileWidget({
    Key key,
    @required this.line,
    this.onTap,
  })
      : super(key: key);

  final Line line;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: TflColors.map[line.id],
      ),
      onTap: onTap,
      subtitle: new Text(
        line.serviceTypes.map((serviceType) => serviceType.name).join(', '),
      ),
      title: new Text(line.name),
    );
  }
}
