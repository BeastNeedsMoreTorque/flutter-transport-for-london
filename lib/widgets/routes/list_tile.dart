import 'package:flutter/material.dart';
import 'package:transport_for_london/models/matched_route.dart';
import 'package:transport_for_london/widgets/single_line_text.dart';

class RouteListTile extends ListTile {
  RouteListTile(
    MatchedRoute route, {
    Key key,
  }) : super(
          key: key,
          subtitle: SingleLineText('to ${route.destinationName}'),
          title: SingleLineText(route.originationName),
        );
}
