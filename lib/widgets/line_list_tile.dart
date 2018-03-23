import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/models/line.dart';
import 'package:transport_for_london/models/tfl_colors.dart';

class LineListTileWidget extends StatelessWidget {
  LineListTileWidget({Key key, @required this.line}) : super(key: key);

  final Line line;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: TflColors.map[line.id],
      ),
      subtitle: new Text(
        line.serviceTypes.map((serviceType) => serviceType.name).join(', '),
      ),
      title: new Text(line.name),
    );
  }
}
