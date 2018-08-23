import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/tfl_colors.dart';

class PredictionListTileWidget extends StatelessWidget {
  PredictionListTileWidget({
    Key key,
    this.onTap,
    @required this.prediction,
  }) : super(key: key);

  final VoidCallback onTap;
  final Prediction prediction;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: TflColors.map[prediction.lineId],
      ),
      isThreeLine: true,
      onTap: onTap,
      subtitle: new Column(
        children: <Widget>[
          new Text(
            prediction.destinationName ?? 'Destination Unknown',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          new Text(
            prediction.currentLocation ?? 'Location Unknown',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      title: new Text(
        prediction.towards ?? 'Destination Unknown',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: new Text(
        prediction.expectedArrival
            .toLocal()
            .toIso8601String()
            .substring(11, 16),
      ),
    );
  }
}
