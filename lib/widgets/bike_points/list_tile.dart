import 'package:flutter/material.dart';
import 'package:transport_for_london/models/place.dart';
import 'package:transport_for_london/widgets/places/list_tile.dart';

class BikePointListTile extends PlaceListTile {
  BikePointListTile(
    Place bikePoint, {
    Key key,
    VoidCallback onTap,
  }) : super(
          bikePoint,
          key: key,
          onTap: onTap,
          trailing: Text(
            '${bikePoint.additionalProperties.firstWhere(
                  (additionalProperty) => additionalProperty.key == 'NbBikes',
                ).value} / ${bikePoint.additionalProperties.firstWhere(
                  (additionalProperty) => additionalProperty.key == 'NbDocks',
                ).value}',
          ),
        );
}
