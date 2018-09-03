import 'package:flutter/material.dart';
import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';

class ArrivalListTile extends ListTile {
  ArrivalListTile(
    Prediction arrival, {
    Key key,
    VoidCallback onTap,
  }) : super(
          isThreeLine: true,
          key: key,
          onTap: onTap,
          subtitle: Column(
            children: <Widget>[
              SingleLineText(arrival.destinationName ?? 'Unknown'),
              SingleLineText(arrival.currentLocation ?? 'Unknown'),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          title: SingleLineText(arrival.towards ?? 'Unknown'),
          trailing: Text(
            arrival.expectedArrival != null
                ? arrival.expectedArrival
                    .toLocal()
                    .toIso8601String()
                    .substring(11, 16)
                : '-',
          ),
        );
}
